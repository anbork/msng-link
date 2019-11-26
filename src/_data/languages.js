const fs = require('fs');

module.exports = async function() {
  let languages = [];
  let langs = JSON.parse(fs.readFileSync('src/_json/languages.json', 'utf8'));
  // добавлять обычный js объект нельзя

  langs.forEach(lang => {
    let localize = JSON.parse(fs.readFileSync(`src/_json/${lang.symbol}.json`, 'utf8'))
    
    languages.push({ lang, localize });
  });
  return languages;
}