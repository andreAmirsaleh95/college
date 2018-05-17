import React from 'react';
import { 
  StyleSheet, 
  Text, 
  View
} from 'react-native';

export default class FavoritesScreen extends React.Component {
  static navigationOptions = {
    title: 'Favorites',
  };

  render() {
    const { params } = this.props.navigation.state;

    return (
        <View>
          <Text>Favorites</Text>
          <Picker
            selectedValue={(this.state && this.state.pickerValue) || 'a'}
            onValueChange={(value) => {
              this.setState({pickerValue: value});
            }} >
              <Picker.Item label="Grand Central Station" value="GCT" />
              <Picker.Item label="Oyster Bay" value="OB3" />
              <Picker.Item label="Oyster Bay" value="OB3" />
              <Picker.Item label="Penn Station" value="PS" />
          </Picker>
        </View>
    );
  }
}