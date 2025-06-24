const fs = require('fs').promises; // Using the promises API for cleaner async/await

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

const recipientsList = await readJsonFile('destinatari.json');
if (!recipientsList) {
    console.log('Error reading or parsing JSON file.');
    process.exit(1);
}
console.log(recipientsList.map(p => p.email.join(',')).join(','));
