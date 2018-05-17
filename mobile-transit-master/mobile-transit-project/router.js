import React from 'react';
import { 
  StyleSheet, 
  Text, 
  View, 
  AppRegistry, 
  TextInput,
  Navigator
} from 'react-native';

import Home from './components/Home'

export default class Router extends React.Component {
  constructor() {
  	super()

  	this.renderScene = this.renderScene.bind(this)
  }

  renderScene(route, navigator) {
  	if(route.name === 'homePage') {
  		return <Home navigator={navigator} />
  	} else if(route.name === 'aboutPage') {
  		return <About navigator={navigator} /> 
  	}
  }

  render() {
    return (
      <Navigator
        initialRoute={{name: 'home'}}
        renderScene={{this.renderScene()}}
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#3498db',
    alignItems: 'center',
    justifyContent: 'center',
  },
});