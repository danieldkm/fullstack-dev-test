class CountriesRepository  {
    db;
    constructor(db) {
        this.db = db;
    }

    async create(country) {
        await this.db.collection('countries').add(country);
    }
}

module.exports = {
    CountriesRepository,
}