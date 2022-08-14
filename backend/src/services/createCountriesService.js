  const fs = require('fs'),
      rl = require('readline')
      path = require('path');
 

class CreateCountriesService {
  countriesRepository
  constructor(_countriesRepository) {
    this.countriesRepository = _countriesRepository;
  }

  _initReadFile() {
    return rl.createInterface({
      input: fs.createReadStream(path.resolve('..', 'data', 'world-cities.csv'))
    });
  }

  async execute() {
    const countries = []
    const reader = this._initReadFile();

    reader.on('line', (row) => {
      const [name, country, subcountry, geonameid] = row.split(",");
      if(country === 'country') {
        return;
      }
      const existCountry = countries.find(ctry => ctry.name === country);
      if (!existCountry) {
        countries.push({
          name: country,
          subcountries: [{
            name: subcountry,
            cities: [{
              name,
              geonameid,
            }],
          }]
        });
      } else {
        const existSubcountry = existCountry.subcountries.find(e => e.name === subcountry);
        if(!existSubcountry) {
          existCountry.subcountries.push({
            name: subcountry,
            cities: [{
              name, geonameid,
          }]
          }); 
        } else {
          const existCity = existSubcountry.cities.find(ct => ct.name === name);
          if(!existCity) {
            existSubcountry.cities.push({
              name, 
              geonameid,
            });
          }
        }
      }
    });

    reader.on('close', async () => {
      await Promise.all(countries.map(country => this.countriesRepository.create(country)));
    });
  }
}

module.exports = {
  CreateCountriesService,
}