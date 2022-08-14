const { initialize } = require('./infra/firestore');
const { CountriesRepository } = require('./infra/firestore/repositories/countriesRepository');

const {CreateCountriesService } = require('./services/createCountriesService');

const db = initialize();

const countriesRepository = new CountriesRepository(db);

const createCountriesService = new CreateCountriesService(countriesRepository);
createCountriesService.execute();
