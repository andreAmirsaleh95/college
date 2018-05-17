import React from 'react';
import { 
  StyleSheet, 
  Text, 
  View,
  FlatList,
  Button
} from 'react-native';

import { FavoritedStations } from '../globals/FavoritedStations';
import { SELECTION } from '../globals/Selection';
import * as firebase from 'firebase';

export default class FavoritesScreen extends React.Component {
  state = {
    stations: "",
    ETA: "",
    loclat: "",
    loclong: "",
    latitude: "",
    longitude: "",
    location: "",
    attrs: "",
  }

  constructor() {
    super();
  };

  static navigationOptions = {
    title: 'Favorites',
  };

  componentDidMount() {
    return fetch('https://mobile-transit-bbdf3.firebaseio.com/favorites.json?shallow=true')
      .then(result => result.json())
      .then(resultJSON => {
        this.setState({stations: resultJSON});
        return (resultJSON);
      }).done();
  }


  onTap = async (obj) => {
    this.props.navigation.navigate('Status', {
      location: obj.item,
    });
  }

  render() {
    var stationList = [];
    for (var key  in this.state.stations) {
      stationList.push(key);
    }

    return (
      <View style={styles.container}>
        <Text style={ styles.headerText }>Favorites:</Text>
        <FlatList 
          style={styles.tblRows}
          data={stationList}
          renderItem={({item}) => <Button 
            style={ styles.rowText }
            title={item}
            ref={component => this._stationBtn = component}
            onPress={() => this.onTap({item})}> </Button>} />
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

  tblRows: {
    padding: 20,
    width: 300,
  },

  headerText: {
    fontSize: 30,
    paddingTop: 10,
    paddingBottom: 30
  },

  rowText: {
    borderWidth: 2,
    fontSize: 18,
    textAlign: 'center',
    marginTop: 2,
    height: 30,
    width: 250
  }
});
