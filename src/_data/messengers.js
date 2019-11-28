const fs = require('fs');

module.exports = async function() {
  let messengers = JSON.parse(fs.readFileSync('src/_json/messengers.json', 'utf8'));
  let messengersObject = {}

  messengers.forEach(messenger => {
    messengersObject[messenger.slug] = messenger;
  });

  return messengersObject;
}