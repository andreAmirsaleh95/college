import React, { Component } from 'react';
import { 
  StyleSheet, 
  Text, 
  View, 
  AppRegistry, 
  TextInput, 
  Button, 
} from 'react-native';
import { StackNavigator } from 'react-navigation';
import * as firebase from 'firebase';

import { FavoritedStations } from './globals/FavoritedStations';

import HomeScreen from './screens/Home';
import MapScreen from './screens/Map';
import FavoritesScreen from './screens/Favorites';
import InformationScreen from './screens/Information';
import ScheduleScreen from './screens/Schedule';
import SchedulePickerScreen from './screens/SchedulePicker';
import StatusScreen from './screens/StatusScreen';

var config = {
  apiKey: "AIzaSyAgjVKhNLO0wI4pAh5dtmSQ1DpSsimHH3I",
  authDomain: "mobile-transit-bbdf3.firebaseapp.com",
  databaseURL: "https://mobile-transit-bbdf3.firebaseio.com/",
  projectId: "mobile-transit-bbdf3",
  storageBucket: "mobile-transit-bbdf3.appspot.com",
  messagingSenderId: "270559937070"
};
firebase.initializeApp(config);

var database = firebase.database();


// Initialize Cheerio
const cheerio = require('react-native-cheerio');
const $ = cheerio.load('<h2 class="title">Hello world</h2>');

export default class App extends React.Component {
  render() {
    return <MTApp />;
  }
}

const MTApp = StackNavigator({
  Home: { screen: HomeScreen },
  Map: { screen: MapScreen },
  Favorites: { screen: FavoritesScreen },
  Information: { screen: InformationScreen },
  SchedulePicker: { screen: SchedulePickerScreen },
  Schedule: { screen: ScheduleScreen },
  Status: { screen: StatusScreen },
});
