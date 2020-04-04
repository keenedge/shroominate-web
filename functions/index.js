'use strict';
const functions = require('firebase-functions');

//const admin = require('firebase-admin');
const Firestore = require('@google-cloud/firestore');
const firestore = new Firestore({
    projectId: "shroominate",
    timestampsInSnapshots: true,
  });


// exports.Measurement = functions.pubsub.topic('Measurement').onPublish(async (message) => {
//   console.log(message.data);
//   const value = message.data ? Buffer.from(message.data, 'base64').toString() : null;
  
//   const json = JSON.parse( value );
//   console.log(value);
  
//     firestore.collection('Measurements').add( json ).then(writeResult => {
//       console.log(`OK Hello ${value || 'World'}!`);
//   });
// });
  
exports.Measurement2 = functions.pubsub.topic('Measurement').onPublish(async (message) => {
    console.log(message.data);
    const value = message.data ? Buffer.from(message.data, 'base64').toString() : null;
    console.log(value);
    
    const json = JSON.parse( value );
    console.log(json);
    json.timestamp = new Firestore.Timestamp( json.timestamp,0 )
    console.log(json);
    
      firestore.collection('Measurements').add( json ).then(writeResult => {
        console.log(`OK: ${writeresult}`);
    });
  });
  

// admin.initializeApp({
//   credential: admin.credential.applicationDefault()
// });


// const admin = require('firebase-admin');

// admin.initializeApp({
//   credential: admin.credential.applicationDefault()
// });

// const db = admin.firestore();

// let docRef = db.collection('Measurments').doc('alovelace');

// let setAda = docRef.set({
//   first: 'Ada',
//   last: 'Lovelace',
//   born: 1815
// });

// var admin = require("firebase-admin");
// var serviceAccount = require("./key/serviceAccountKey.json");
// admin.initializeApp({
//   credential: admin.credential.cert(serviceAccount),
//   databaseURL: "https://shroominate.firebaseio.com"
// });
// const functions = require('firebase-functions');

// var db = admin.firestore();
// var data = {
//   name: 'Los Angeles',
//   state: 'CA',
//   country: 'USA'
// };

// // Add a new document in collection "cities" with ID 'LA'
// var setDoc = db.collection('cities').doc('LA').set(data);
// setDoc




'use strict';


// const functions = require('firebase-functions');
// const admin = require('firebase-admin');
// admin.initializeApp({
//     credential: admin.credential.applicationDefault()
//   });
  


// const admin = require('firebase-admin');


// const db = admin.firestore(
//     {
//         apiKey: "AIzaSyADoe_5XuILzc_9OvOLi4Wp76d672tJfqc",
//         authDomain: "shroominate.firebaseapp.com",
//         databaseURL: "https://shroominate.firebaseio.com",
//         projectId: "shroominate",
//         storageBucket: "shroominate.appspot.com",
//         messagingSenderId: "167686281726",
//         appId: "1:167686281726:web:a5134caf1baa301cab48af",
//         measurementId: "G-Q8Y5K5FM0M"
//     }
// );

// let docRef = db.collection('Measurments').doc('alovelace');

// let setAda = docRef.set({
//   first: 'Ada',
//   last: 'Lovelace',
//   born: 1815
// });

// 'use strict';

// const functions = require('firebase-functions');

// const admin = require('firebase-admin');
// admin.initializeApp({
//     databaseURL: "https://shroominate.firebaseio.com"
// });

// exports.Co2 = functions.pubsub.topic('Co2').onPublish(async (message) => {
//   const value = message.data ? Buffer.from(message.data, 'base64').toString() : null;

//   admin.firestore().collection('messages').add({original: original}).then(writeResult => {
//     console.log(`OK Hello ${value || 'World'}!`);
// });


//   let docRef = db.collection('Measurments').doc('alovelace');

//  let setAda = docRef.set({
//   first: 'Ada',
//   last: 'Lovelace',
//   born: 1815
// });


//   // Push the new message into the Realtime Database using the Firebase Admin SDK.
//   const snapshot = await admin.database().ref('/Measurments').push({co2: value});

  // Print the message in the logs.
//   console.log(`Hello ${vaue || 'World'}!`);
//   console.log(snapshot.ref.toString());
//   return null;
//  })