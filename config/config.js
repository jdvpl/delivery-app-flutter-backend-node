const promise = require('bluebird');

const options = {
    promiseLib: promise,
    query: (e) => {}
}

const pgp = require('pg-promise')(options);
const types = pgp.pg.types;
types.setTypeParser(1114, function(stringValue) {
    return stringValue;
});


const databaseConfig = {
    'host': process.env.PG_HOST,
    'port': 5432,
    'database': process.env.PG_DB,
    'user': process.env.PG_USER,
    'password':process.env.PG_PASSWORD,
    'ssl':{
        rejectUnauthorized: false,
    }
};

const db = pgp(databaseConfig);

module.exports = db;

