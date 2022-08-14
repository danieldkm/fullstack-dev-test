const { initializeApp, applicationDefault, cert } = require('firebase-admin/app');
const { getFirestore, Timestamp, FieldValue } = require('firebase-admin/firestore');
const serviceAccount = require('../../../serviceAccountKey.json');

function initialize() {
  initializeApp({
    credential: cert(serviceAccount)
  });
  const db = getFirestore();
  return db;
}

module.exports = {
  initialize,
}