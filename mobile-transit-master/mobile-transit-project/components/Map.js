import React from 'react';
import { 
  StyleSheet, 
  Text, 
  View
} from 'react-native';  

export default class MapScreen extends React.Component {
  // Nav options can be defined as a function of the screen's props:
  static navigationOptions = {
    title: 'Map',
  };

  render() {
    // The screen's current route is passed in to `props.navigation.state`:
    const { params } = this.props.navigation.state;
    return (
      <View>
        <Text>Map Page</Text>
      </View>
    );
  }
}
