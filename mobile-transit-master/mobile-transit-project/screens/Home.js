import React from 'react';
import { StyleSheet, Text, View, AppRegistry, TextInput, Button } from 'react-native';

import { StackNavigator } from 'react-navigation';

import Header from '../components/Header.js';
import ImgButton from '../components/ImgButton.js';

export default class HomeScreen extends React.Component {
  static navigationOptions = {
    title: 'Home',
  };

  render() {
    const { navigate } = this.props.navigation;
    var thisVar = 0;

    return (
      <View style={styles.container}>
        <Header />
        <Button
          raised
          style={styles.mapBtn}
          onPress={() => navigate('Map')}
          title="Map" />
        <Button
          style={styles.favBtn}
          onPress={() => navigate('Favorites')}
          title="Favorites" />
        <Button
          style={styles.infoBtn}
          onPress={() => navigate('Information')}
          title="Information" />
        <Button
          style={styles.schedBtn}
          onPress={() => navigate('SchedulePicker')}
          title="Schedule" />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#abcdef',
    alignItems: 'center',
    justifyContent: 'center',
  },

  inputField:{
    height: 50,
    width: 300,
    borderColor:'#fff',
    borderWidth: 1,
    padding: 10,
    color: '#fff'
  },
});
