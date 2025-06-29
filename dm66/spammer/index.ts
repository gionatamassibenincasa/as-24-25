const nodemailer = require("nodemailer");
const mustache = require("mustache");
const fs = require('fs').promises; // Using the promises API for cleaner async/await

const today = new Date().toISOString().substr(0, 10);
const HOURS = 10;
const REMAINING_HOURS = HOURS - 10;
const HOURS_TO_BE_CERTIFICATED = 7;

/**
 * Converts a given string to title case.
 * @param {string} nome The string to capitalize.
 * @returns {string} The capitalized string.
 */
function capitalizza(nome) {
    if (!nome) {
        return ""; // Gestisci il caso di input vuoto o nullo
    }

    return nome.toLowerCase().split(' ').map(function (parola) {
        return parola.charAt(0).toUpperCase() + parola.slice(1);
    }).join(' ');
}

/**
 * Reads a JSON file from the specified file path and parses its content.
 * 
 * @param filePath - The path to the JSON file to be read.
 * @returns A promise that resolves to the parsed JSON data or null if an error occurs.
 * Logs an error message if the file cannot be read or parsed.
 */

async function readJsonFile(filePath) {
    try {
        const fileContent = await fs.readFile(filePath, 'utf8');
        const jsonData = JSON.parse(fileContent);
        return jsonData;
    } catch (error) {
        console.error('Error reading or parsing JSON file:', error);
        return null; // Or throw the error if you want the calling function to handle it
    }
}

/**
 * Verifies the connection to the email server using the given transporter.
 * Logs a success message if the connection is established successfully, or an
 * error message if an error occurs.
 * @param transporter - The transporter to use for verifying the connection.
 * @returns A promise that resolves to true if the connection is established
 * successfully, or false if an error occurs.
 */
async function checkConnection(transporter) {
    try {
        await transporter.verify();
        console.log('Connection to email server established successfully!');
        return true;
    } catch (error) {
        console.error('Error connecting to email server:', error);
        return false;
    }
}

/**
 * Sends an email using the given transporter and mail options, retrying up to
 * `maxRetries` times if an error occurs. Waits 5 seconds between retries.
 *
 * @param transporter - The transporter to use for sending the email.
 * @param mailOptions - The options for the email to be sent.
 * @param maxRetries - The maximum number of times to retry sending the email.
 */
async function sendWithRetry(transporter, mailOptions, maxRetries) {
    let attempts = 0;
    let success = false;

    while (attempts < maxRetries && !success) {
        attempts++;
        try {
            const info = await transporter.sendMail(mailOptions);
            console.log(`Email sent to ${mailOptions.to}:`, info.response);
            success = true;
        } catch (error) {
            console.error(`Error sending email to ${mailOptions.to} (Attempt ${attempts}):`, error);
            if (attempts < maxRetries) {
                console.log(`Retrying in a few seconds...`);
                await new Promise(resolve => setTimeout(resolve, 5000)); // Wait for 5 seconds before retrying
            } else {
                console.error(`Failed to send email to ${mailOptions.to} after ${maxRetries} attempts.`);
            }
        }
    }
}

/**
 * Sends a personalized email to each recipient in the given array using the given
 * transporter, HTML template, and subject.
 *
 * @param transporter - The transporter to use for sending the emails.
 * @param recipients - The array of recipient objects with `email` and `nome` properties.
 * @param htmlTemplate - The HTML template to use for the email body.
 * @param subject - The email subject.
 *
 * The email body is generated by replacing `{{lettera}}` and `{{nome}}` placeholders
 * in the template with the recipient's name and a gender-specific letter.
 */
async function sendPersonalizedEmails(transporter, recipients, htmlTemplate, subject) {
    if (!await checkConnection(transporter)) {
        console.error('Failed to establish initial connection. Emails will not be sent.');
        return;
    }
    mustache.parse(htmlTemplate);

    for (const recipientInfo of recipients) {
        let { email, nome } = recipientInfo;
        nome = capitalizza(nome);
        const lettera = isMale(recipientInfo) ? 'o' : 'a';
        // const personalizedHtml = htmlTemplate.replace(/{{name}}/g, name);
        const personalizedHtml = mustache.render(htmlTemplate, { lettera, nome });
        const mailOptions = {
            from: 'gionata.massi@savoiabenincasa.it',
            to: email.join(','),
            subject: subject,
            html: personalizedHtml + "\n\n" + certificatePostScriptum(recipientInfo),
        };
        if (process.env.SEND)
            await sendWithRetry(transporter, mailOptions, 5);
        else
            console.log(mailOptions);
    }
}

/**
 * Returns true if the given recipientInfo object represents a male person.
 *
 * This function will use the `sesso` property if it is present in the object.
 * Otherwise, it will parse the `codiceFiscale` property and check the gender
 * code in the CF string.
 */
function isMale(recipientInfo) {
    if (recipientInfo.codiceFiscale === undefined) {
        return recipientInfo.sesso === 'M';
    }
    return parseInt(codiceFiscale.substring(9, 11)) < 40;
}

function certificatePostScriptum(recipientInfo) {
    let str = "<p><strong>PS</strong>: avendo registrato " + recipientInfo.numOreReg + " ore di presenza, ";
    if (recipientInfo.numOreReg >= HOURS_TO_BE_CERTIFICATED) {
        str += 'sono lieto di informarti che potrai scaricare l\'attestato su <a href="https://scuolafutura.pubblica.istruzione.it/">Scuola Futura</a>.</p>';
    }
    //  else if (recipientInfo.numOreReg + REMAINING_HOURS >= HOURS_TO_BE_CERTIFICATED) {
    //     const missingHours = HOURS_TO_BE_CERTIFICATED - recipientInfo.numOreReg;
    //     str += "ti informo che dovrai essere presente "  +
    //         ((missingHours == 1) ? "ad almeno un'ora" : "a entrambe le ore") +
    //         " dell'ultimo incontro al fine di conseguire l'attestato di partecipazione al corso.</p>"
    // }
     else str += "mi spiace informarti che non hai conseguito l'attestato di partecipazione al corso. Se ritieni che ci siano stati errori di registrazione delle presenze, ti invito a contattarmi il prima possibile.</p>";

    return str;
}

/**
 * Main entry point of the script.
 *
 * Reads the list of recipients from the "destinatari.json" file and sends a
 * personalized email to each of them using the specified HTML template.
 *
 * The email is sent using a Gmail transporter with a connection pool of 5
 * and a maximum of 50 messages per connection.
 *
 * If an error occurs while reading the JSON file or sending an email, the
 * script will exit with a non-zero status code.
 */
async function main() {
    const recipientsList = await readJsonFile('destinatari.json');
    if (!recipientsList) {
        console.log('Error reading or parsing JSON file.');
        process.exit(1);
    }

    const emailSubject = await fs.readFile(`subject-${today}.txt`, 'utf8');
    const emailTemplate = await fs.readFile(`template-${today}.html`, 'utf8'); // Your HTML template

    const transporter = nodemailer.createTransport({
        service: "gmail",
        pool: true,
        maxConnections: 5, // optional – defaults to 5
        maxMessages: 50, // optional – defaults to 100
        auth: {
            user: "gionata.massi@savoiabenincasa.it",
            pass: await fs.readFile('.env.GOOGLE_APP_PASSWORD', 'utf8')
        },
    });

    await sendPersonalizedEmails(transporter, recipientsList, emailTemplate, emailSubject);
    await transporter.close();
}

main().catch(console.error);
