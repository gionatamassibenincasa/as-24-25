import fs from 'fs';
import YAML from 'yaml';
import carbone from 'carbone';

const dataYAML = fs.readFileSync('./laboratori.yml', 'utf8');
const data = YAML.parse(dataYAML);
console.log(JSON.stringify(data, null, 2));

carbone.render('./Laboratorio-template.odt', data, function(err, result){
    if (err) {
      return console.log(err);
    }
    // write the result
    fs.writeFileSync('result.odt', result);
  });
