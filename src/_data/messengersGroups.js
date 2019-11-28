const fs = require('fs');

module.exports = async function() {
  let messengersGroups = [];
  let groups = JSON.parse(fs.readFileSync('src/_json/messengers_groups.json', 'utf8'));
  let messengers = JSON.parse(fs.readFileSync('src/_json/messengers.json', 'utf8'));
  // добавлять обычный js объект нельзя

  groups.forEach(group => {
    messengersGroups.push(group.map(msng => messengers.find(messenger => messenger.slug == msng)));
  });

  return messengersGroups;
}