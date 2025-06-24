const fs = require('fs');
const carbone = require('carbone');
const YAML = require('yaml');

const dataYAML = fs.readFileSync('./laboratori.yml', 'utf8');
const data = YAML.parse(dataYAML);
console.log(JSON.stringify(data, null, 2));

carbone.render('./Laboratorio-template.docx', data, function(err, result){
    if (err) {
      return console.log(err);
    }
    // write the result
    fs.writeFileSync('result.docx', result);
  });
