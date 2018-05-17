import React, { Component } from 'react';
import { 
  StyleSheet, 
  Text, 
  View, 
  AppRegistry, 
  TextInput, 
  Picker,
  Button,
  Alert,
} from 'react-native';

import StationPicker from '../components/StationPicker';

export default class SchedulePickerScreen extends React.Component {
  state = { term: '' };

  static navigationOptions = {
    title: 'Schedule Picker',
  };

  handleSearch = ({ navigate }) => {


    if (this.state.term === "Albertson") {
      this.props.navigation.navigate("Schedule", { station: "44" })
    } else if (this.state.term == "Amagansett") {
      this.props.navigation.navigate('Schedule', { station: "137" })
    } else if (this.state.term == "Amityville") {
      this.props.navigation.navigate('Schedule', { station: "115" })
    } else if (this.state.term == "Atlantic Terminal") {
      this.props.navigation.navigate('Schedule', { station: "12" })
    } else if (this.state.term == "Auburndale") {
      this.props.navigation.navigate('Schedule', { station: "21" })
    } else if (this.state.term == "Babylon") {
      this.props.navigation.navigate('Schedule', { station: "118" })
    } else if (this.state.term == "Baldwin") {
      this.props.navigation.navigate('Schedule', { station: "107" })
    } else if (this.state.term == "Bay Shore") {
      this.props.navigation.navigate('Schedule', { station: "119" })
    } else if (this.state.term == "Bayside") {
      this.props.navigation.navigate('Schedule', { station: "22" })
    } else if (this.state.term == "Bellerose") {
      this.props.navigation.navigate('Schedule', { station: "33" })
    } else if (this.state.term == "Bellmore") {
      this.props.navigation.navigate('Schedule', { station: "110" })
    } else if (this.state.term == "Bellport") {
      this.props.navigation.navigate('Schedule', { station: "126" })
    } else if (this.state.term == "Belmont") {
      this.props.navigation.navigate('Schedule', { station: "32" })
    } else if (this.state.term == "Bethpage") {
      this.props.navigation.navigate('Schedule', { station: "68" })
    } else if (this.state.term == "Brentwood") {
      this.props.navigation.navigate('Schedule', { station: "73" })
    } else if (this.state.term == "Bridgehampton") {
      this.props.navigation.navigate('Schedule', { station: "135" })
    } else if (this.state.term == "Broadway") {
      this.props.navigation.navigate('Schedule', { station: "20" })
    } else if (this.state.term == "Carle Place") {
      this.props.navigation.navigate('Schedule', { station: "54" })
    } else if (this.state.term == "Cedarhurst") {
      this.props.navigation.navigate('Schedule', { station: "96" })
    } else if (this.state.term == "Central Islip") {
      this.props.navigation.navigate('Schedule', { station: "74" })
    } else if (this.state.term == "Centre Avenue") {
      this.props.navigation.navigate('Schedule', { station: "101" })
    } else if (this.state.term == "Cold Spring Harbor") {
      this.props.navigation.navigate('Schedule', { station: "59" })
    } else if (this.state.term == "Copiague") {
      this.props.navigation.navigate('Schedule', { station: "116" })
    } else if (this.state.term == "Country Life Press") {
      this.props.navigation.navigate('Schedule', { station: "38" })
    } else if (this.state.term == "Deer Park") {
      this.props.navigation.navigate('Schedule', { station: "72" })
    } else if (this.state.term == "Douglaston") {
      this.props.navigation.navigate('Schedule', { station: "23" })
    } else if (this.state.term == "East Hampton") {
      this.props.navigation.navigate('Schedule', { station: "136" })
    } else if (this.state.term == "East New York") {
      this.props.navigation.navigate('Schedule', { station: "14" })
    } else if (this.state.term == "East Rockaway") {
      this.props.navigation.navigate('Schedule', { station: "102" })
    } else if (this.state.term == "East Williston") {
      this.props.navigation.navigate('Schedule', { station: "43" })
    } else if (this.state.term == "Far Rockaway") {
      this.props.navigation.navigate('Schedule', { station: "99" })
    } else if (this.state.term == "Farmingdale") {
      this.props.navigation.navigate('Schedule', { station: "69" })
    } else if (this.state.term == "Floral Park") {
      this.props.navigation.navigate('Schedule', { station: "34" })
    } else if (this.state.term == "Flushing Main St") {
      this.props.navigation.navigate('Schedule', { station: "18" })
    } else if (this.state.term == "Forest Hills") {
      this.props.navigation.navigate('Schedule', { station: "10" })
    } else if (this.state.term == "Freeport") {
      this.props.navigation.navigate('Schedule', { station: "108" })
    } else if (this.state.term == "Garden City") {
      this.props.navigation.navigate('Schedule', { station: "37" })
    } else if (this.state.term == "Gibson") {
      this.props.navigation.navigate('Schedule', { station: "93" })
    } else if (this.state.term == "Glen Cove") {
      this.props.navigation.navigate('Schedule', { station: "50" })
    } else if (this.state.term == "Glen Head") {
      this.props.navigation.navigate('Schedule', { station: "47" })
    } else if (this.state.term == "Glen Street") {
      this.props.navigation.navigate('Schedule', { station: "49" })
    } else if (this.state.term == "Great Neck") {
      this.props.navigation.navigate('Schedule', { station: "25" })
    } else if (this.state.term == "Great River") {
      this.props.navigation.navigate('Schedule', { station: "121" })
    } else if (this.state.term == "Greenlawn") {
      this.props.navigation.navigate('Schedule', { station: "61" })
    } else if (this.state.term == "Greenport") {
      this.props.navigation.navigate('Schedule', { station: "82" })
    } else if (this.state.term == "Greenvale") {
      this.props.navigation.navigate('Schedule', { station: "46" })
    } else if (this.state.term == "Hampton Bays") {
      this.props.navigation.navigate('Schedule', { station: "132" })
    } else if (this.state.term == "Hempstead") {
      this.props.navigation.navigate('Schedule', { station: "39" })
    } else if (this.state.term == "Hempstead Gardens") {
      this.props.navigation.navigate('Schedule', { station: "91" })
    } else if (this.state.term == "Hewlett") {
      this.props.navigation.navigate('Schedule', { station: "94" })
    } else if (this.state.term == "Hicksville") {
      this.props.navigation.navigate('Schedule', { station: "56" })
    } else if (this.state.term == "Hollis") {
      this.props.navigation.navigate('Schedule', { station: "30" })
    } else if (this.state.term == "Hunterspoint Avenue") {
      this.props.navigation.navigate('Schedule', { station: "2" })
    } else if (this.state.term == "Huntington") {
      this.props.navigation.navigate('Schedule', { station: "60" })
    } else if (this.state.term == "Inwood") {
      this.props.navigation.navigate('Schedule', { station: "98" })
    } else if (this.state.term == "Island Park") {
      this.props.navigation.navigate('Schedule', { station: "104" })
    } else if (this.state.term == "Islip") {
      this.props.navigation.navigate('Schedule', { station: "120" })
    } else if (this.state.term == "Jamaica") {
      this.props.navigation.navigate('Schedule', { station: "15" })
    } else if (this.state.term == "Kew Gardens") {
      this.props.navigation.navigate('Schedule', { station: "11" })
    } else if (this.state.term == "Kings Park") {
      this.props.navigation.navigate('Schedule', { station: "63" })
    } else if (this.state.term == "Lakeview") {
      this.props.navigation.navigate('Schedule', { station: "90" })
    } else if (this.state.term == "Laurelton") {
      this.props.navigation.navigate('Schedule', { station: "85" })
    } else if (this.state.term == "Lawrence") {
      this.props.navigation.navigate('Schedule', { station: "97" })
    } else if (this.state.term == "Lindenhurst") {
      this.props.navigation.navigate('Schedule', { station: "117" })
    } else if (this.state.term == "Little Neck") {
      this.props.navigation.navigate('Schedule', { station: "24" })
    } else if (this.state.term == "Locust Manor") {
      this.props.navigation.navigate('Schedule', { station: "84" })
    } else if (this.state.term == "Locust Valley") {
      this.props.navigation.navigate('Schedule', { station: "51" })
    } else if (this.state.term == "Long Beach") {
      this.props.navigation.navigate('Schedule', { station: "105" })
    } else if (this.state.term == "Long Island City") {
      this.props.navigation.navigate('Schedule', { station: "1" })
    } else if (this.state.term == "Lynbrook") {
      this.props.navigation.navigate('Schedule', { station: "100" })
    } else if (this.state.term == "Malverne") {
      this.props.navigation.navigate('Schedule', { station: "89" })
    } else if (this.state.term == "Manhasset") {
      this.props.navigation.navigate('Schedule', { station: "26" })
    } else if (this.state.term == "Massapequa") {
      this.props.navigation.navigate('Schedule', { station: "113" })
    } else if (this.state.term == "Massapequa Park") {
      this.props.navigation.navigate('Schedule', { station: "114" })
    } else if (this.state.term == "Mastic Shirley") {
      this.props.navigation.navigate('Schedule', { station: "127" })
    } else if (this.state.term == "Mattituck") {
      this.props.navigation.navigate('Schedule', { station: "80" })
    } else if (this.state.term == "Meadowlands") {
      this.props.navigation.navigate('Schedule', { station: "508" })
    } else if (this.state.term == "Medford") {
      this.props.navigation.navigate('Schedule', { station: "77" })
    } else if (this.state.term == "Merillon Av") {
      this.props.navigation.navigate('Schedule', { station: "41" })
    } else if (this.state.term == "Merrick") {
      this.props.navigation.navigate('Schedule', { station: "109" })
    } else if (this.state.term == "Mets-Willets Point") {
      this.props.navigation.navigate('Schedule', { station: "17" })
    } else if (this.state.term == "Mineola") {
      this.props.navigation.navigate('Schedule', { station: "42" })
    } else if (this.state.term == "Montauk") {
      this.props.navigation.navigate('Schedule', { station: "138" })
    } else if (this.state.term == "Murray Hill") {
      this.props.navigation.navigate('Schedule', { station: "19" })
    } else if (this.state.term == "Nassau Boulevard") {
      this.props.navigation.navigate('Schedule', { station: "36" })
    } else if (this.state.term == "New Hyde Park") {
      this.props.navigation.navigate('Schedule', { station: "40" })
    } else if (this.state.term == "Northport") {
      this.props.navigation.navigate('Schedule', { station: "62" })
    } else if (this.state.term == "Nostrand Avenue") {
      this.props.navigation.navigate('Schedule', { station: "13" })
    } else if (this.state.term == "Oakdale") {
      this.props.navigation.navigate('Schedule', { station: "122" })
    } else if (this.state.term == "Oceanside") {
      this.props.navigation.navigate('Schedule', { station: "103" })
    } else if (this.state.term == "Oyster Bay") {
      this.props.navigation.navigate('Schedule', { station: "53" })
    } else if (this.state.term == "Patchogue") {
      this.props.navigation.navigate('Schedule', { station: "124" })
    } else if (this.state.term == "Penn Station") {
      this.props.navigation.navigate('Schedule', { station: "8" })
    } else if (this.state.term == "Pinelawn") {
      this.props.navigation.navigate('Schedule', { station: "70" })
    } else if (this.state.term == "Plandome") {
      this.props.navigation.navigate('Schedule', { station: "27" })
    } else if (this.state.term == "Port Jefferson") {
      this.props.navigation.navigate('Schedule', { station: "67" })
    } else if (this.state.term == "Port Washington") {
      this.props.navigation.navigate('Schedule', { station: "28" })
    } else if (this.state.term == "Queens Village") {
      this.props.navigation.navigate('Schedule', { station: "31" })
    } else if (this.state.term == "Riverhead") {
      this.props.navigation.navigate('Schedule', { station: "79" })
    } else if (this.state.term == "Rockville Centre") {
      this.props.navigation.navigate('Schedule', { station: "106" })
    } else if (this.state.term == "Ronkonkoma") {
      this.props.navigation.navigate('Schedule', { station: "75" })
    } else if (this.state.term == "Rosedale") {
      this.props.navigation.navigate('Schedule', { station: "86" })
    } else if (this.state.term == "Roslyn") {
      this.props.navigation.navigate('Schedule', { station: "45" })
    } else if (this.state.term == "Sayville") {
      this.props.navigation.navigate('Schedule', { station: "123" })
    } else if (this.state.term == "Sea Cliff") {
      this.props.navigation.navigate('Schedule', { station: "48" })
    } else if (this.state.term == "Seaford") {
      this.props.navigation.navigate('Schedule', { station: "112" })
    } else if (this.state.term == "Smithtown") {
      this.props.navigation.navigate('Schedule', { station: "64" })
    } else if (this.state.term == "Southampton") {
      this.props.navigation.navigate('Schedule', { station: "134" })
    } else if (this.state.term == "Southold") {
      this.props.navigation.navigate('Schedule', { station: "81" })
    } else if (this.state.term == "Speonk") {
      this.props.navigation.navigate('Schedule', { station: "129" })
    } else if (this.state.term == "St. Albans") {
      this.props.navigation.navigate('Schedule', { station: "83" })
    } else if (this.state.term == "St. James") {
      this.props.navigation.navigate('Schedule', { station: "65" })
    } else if (this.state.term == "Stewart Manor") {
      this.props.navigation.navigate('Schedule', { station: "35" })
    } else if (this.state.term == "Stony Brook") {
      this.props.navigation.navigate('Schedule', { station: "66" })
    } else if (this.state.term == "Syosset") {
      this.props.navigation.navigate('Schedule', { station: "58" })
    } else if (this.state.term == "Valley Stream") {
      this.props.navigation.navigate('Schedule', { station: "87" })
    } else if (this.state.term == "Wantagh") {
      this.props.navigation.navigate('Schedule', { station: "111" })
    } else if (this.state.term == "West Hempstead") {
      this.props.navigation.navigate('Schedule', { station: "92" })
    } else if (this.state.term == "Westbury") {
      this.props.navigation.navigate('Schedule', { station: "55" })
    } else if (this.state.term == "Westhampton") {
      this.props.navigation.navigate('Schedule', { station: "130" })
    } else if (this.state.term == "Westwood") {
      this.props.navigation.navigate('Schedule', { station: "88" })
    } else if (this.state.term == "Woodmere") {
      this.props.navigation.navigate('Schedule', { station: "95" })
    } else if (this.state.term == "Woodside") {
      this.props.navigation.navigate('Schedule', { station: "9" })
    } else if (this.state.term == "Wyandanch") {
      this.props.navigation.navigate('Schedule', { station: "71" })
    } else if (this.state.term == "Yaphank") {
      this.props.navigation.navigate('Schedule', { station: "78" })
    } else {
      Alert.alert('Station not found.\nPlease try again.');
    }

  }

  render() {
    const { navigate } = this.props.navigation;
    
    return(
      <View style={styles.container}>
        <Text style={styles.menuTxt} >Choose a station:</Text>
        <TextInput 
          style={styles.inputField}
          placeholder='Search for a station'
          value={this.state.term}
          onChangeText={term =>  this.setState({ term })} />
        <Button
          style={styles.searchBtn}
          title="search"
          onPress={() => this.handleSearch(navigate)} />
        <StationPicker ref={(ref) => this._stationPicker = ref}/>
        <Button
          style={styles.favBtn}
          onPress={() => navigate("Schedule", { station: this._stationPicker.getPickerValue() } )}
          title="Submit" />
      </View>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#abcdef',
    alignItems: 'center',
    justifyContent: 'center',
  },

  inputField: {
    paddingTop: 30,
  },

  searchBtn: {
    paddingBottom: 40,
    fontSize: 30,
  },

  menuTxt: {
    fontSize: 30,
  }
});