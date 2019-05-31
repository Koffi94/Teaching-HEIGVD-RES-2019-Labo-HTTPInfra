var Chance = require('chance');
var chance = new Chance();

var express = require('express');
var app = express();

app.get('/', function(req, res) {
  res.send(generateAnimals());
});

app.listen(3000, function () {
  console.log('Accepting HTTP requests on port 3000.')
});

function generateAnimals() {
  var numberOfAnimals = chance.integer({
    min: 1,
    max: 20
  });

  console.log(numberOfAnimals);

  var animals = [];
  var types = ["ocean", "desert", "grassland", "forest", "farm", "pet", "zoo"];

  for(var i = 0; i < numberOfAnimals; ++i) {
    var type = types[chance.integer({ min: 0, max: 6 })];
    var name = chance.animal({type: type});
    var gender = chance.gender();
    var originCountry = chance.country({ full: true });
    animals.push({
      name: name,
      type: type,
      gender: gender,
      originCountry: originCountry
    });
  }
  console.log(animals);
  return animals;
}
