const fs = require('fs');

module.exports = async function() {
  let messengersWithLang = [];
  let langs = JSON.parse(fs.readFileSync('src/_json/languages.json', 'utf8'));
  let messengers = JSON.parse(fs.readFileSync('src/_json/messengers.json', 'utf8'));
  // добавлять обычный js объект нельзя

  langs.forEach(lang => {
    let localize = JSON.parse(fs.readFileSync(`src/_json/${lang.symbol}.json`, 'utf8'))

    messengers.forEach(messenger => {
      messengersWithLang.push({ messenger, lang, localize})
    });
  });

  return messengersWithLang;
}