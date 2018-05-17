import React, { Component } from 'react';
import { 
  StyleSheet,
  Text, 
  View, 
  AppRegistry, 
  Button, 
  Picker,
} from 'react-native';

export default class StationPicker extends React.Component {
	getPickerValue() {
		return (this.state.pickerValue);
	}

	render() {
		return (
			<Picker
			  style={{
	        width: 200,
	      }}
	      selectedValue={ (this.state && this.state.pickerValue) || "44"}
	      onValueChange={(value) => {
	        this.setState({pickerValue: value});
	        console.log(value);
	      	console.log(this.state);
	        console.log(value);
	      }
	    } >
		      <Picker.Item label="Albertson" value="44" id="OB1" />
		      <Picker.Item label="Amagansett" value="137" id="OB1" />
		      <Picker.Item label="Amityville" value="115" id="OB1" />
		      <Picker.Item label="Atlantic Terminal" value="12" id="OB1" />
		      <Picker.Item label="Auburndale" value="21" id="OB1" />
					<Picker.Item label="Babylon" value="118" id="OB1" />
					<Picker.Item label="Baldwin" value="107" id="OB1" />
					<Picker.Item label="Bay Shore" value="119" id="OB1" />
		      <Picker.Item label="Bayside" value="22" id="OB1" />
		      <Picker.Item label="Bellerose" value="33" id="OB1" />
		      <Picker.Item label="Bellmore" value="110" id="OB2" />
		      <Picker.Item label="Bellport" value="126" id="OB2" />
		      <Picker.Item label="Belmont" value="32" id="OB2" />
		      <Picker.Item label="Bethpage" value="68" id="OB2" />
		      <Picker.Item label="Brentwood" value="73" id="OB2" />
		      <Picker.Item label="Bridgehampton" value="135" id="OB2" />
		      <Picker.Item label="Broadway" value="20" id="OB2" />
		      <Picker.Item label="Carle Place" value="54" id="OB2" />
		      <Picker.Item label="Cedarhurst" value="96" id="OB2" />
		      <Picker.Item label="Central Islip" value="74" id="OB2" />
		      <Picker.Item label="Centre Avenue" value="101" id="OB3" />
		      <Picker.Item label="Cold Spring Harbor" value="59" id="OB3" />
		      <Picker.Item label="Copiague" value="116" id="OB3" />
		      <Picker.Item label="Country Life Press" value="38" id="OB3" />
		      <Picker.Item label="Deer Park" value="72" id="OB3" />
		      <Picker.Item label="Douglaston" value="23" id="OB3" />
		      <Picker.Item label="East Hampton" value="136" id="OB3" />
		      <Picker.Item label="East New York" value="14" id="OB3" />
		      <Picker.Item label="East Rockaway" value="102" id="OB3" />
		      <Picker.Item label="East Williston" value="43" id="OB3" />
		      <Picker.Item label="Far Rockaway" value="99" id="OB3" />
		      <Picker.Item label="Farmingdale" value="69" id="PJ5" />
		      <Picker.Item label="Floral Park" value="34" id="PJ5" />
		      <Picker.Item label="Flushing Main St" value="18" id="PJ5" />
		      <Picker.Item label="Forest Hills" value="10" id="PJ5" />
		      <Picker.Item label="Freeport" value="108" id="PJ5" />
		      <Picker.Item label="Garden City" value="37" id="PJ5" />
		      <Picker.Item label="Gibson" value="93" id="PJ5" />
		      <Picker.Item label="Glen Cove" value="50" id="PJ5" />
		      <Picker.Item label="Glen Head" value="47" id="PJ5" />
		      <Picker.Item label="Glen Street" value="49" id="PJ5" />
		      <Picker.Item label="Great Neck" value="25" id="PJ4" />
		      <Picker.Item label="Great River" value="121" id="PJ4" />
		      <Picker.Item label="Greenlawn" value="61" id="PJ4" />
		      <Picker.Item label="Greenport" value="82" id="PJ4" />
		      <Picker.Item label="Greenvale" value="46" id="PJ4" />
		      <Picker.Item label="Hampton Bays" value="132" id="PJ4" />
		      <Picker.Item label="Hempstead" value="39" id="PJ4" />
		      <Picker.Item label="Hempstead Gardens" value="91" id="PJ4" />
		      <Picker.Item label="Hewlett" value="94" id="PJ4" />
		      <Picker.Item label="Hicksville" value="56" id="PJ4" />
		      <Picker.Item label="Hollis" value="30" id="PJ3" />
		      <Picker.Item label="Hunterspoint Avenue" value="2" id="PJ3" />
		      <Picker.Item label="Huntington" value="60" id="PJ3" />
		      <Picker.Item label="Inwood" value="98" id="PJ3" />
		      <Picker.Item label="Island Park" value="104" id="PJ3" />
		      <Picker.Item label="Islip" value="120" id="PJ3" />
		      <Picker.Item label="Jamaica" value="15" id="PJ3" />
		      <Picker.Item label="Kew Gardens" value="11" id="PJ3" />
		      <Picker.Item label="Kings Park" value="63" id="PJ3" />
		      <Picker.Item label="Lakeview" value="90" id="PJ3" />
		      <Picker.Item label="Laurelton" value="85" id="PJ3" />
		      <Picker.Item label="Lawrence" value="97" id="KO4" />
		      <Picker.Item label="Lindenhurst" value="117" id="KO4" />
		      <Picker.Item label="Little Neck" value="24" id="KO4" />
		      <Picker.Item label="Locust Manor" value="84" id="KO4" />
		      <Picker.Item label="Locust Valley" value="51" id="KO4" />
		      <Picker.Item label="Long Beach" value="105" id="KO4" />
		      <Picker.Item label="Long Island City" value="1" id="KO4" />
		      <Picker.Item label="Lynbrook" value="100" id="KO4" />
		      <Picker.Item label="Malverne" value="89" id="KO4" />
		      <Picker.Item label="Manhasset" value="26" id="KO4" />
		      <Picker.Item label="Massapequa" value="113" id="KO4" />
		      <Picker.Item label="Massapequa Park" value="114" id="KO3" />
		      <Picker.Item label="Mastic Shirley" value="127" id="KO3" />
		      <Picker.Item label="Mattituck" value="80" id="KO3" />
		      <Picker.Item label="Meadowlands" value="508" id="KO3" />
		      <Picker.Item label="Medford" value="77" id="KO3" />
		      <Picker.Item label="Merillon Av" value="41" id="KO3" />
		      <Picker.Item label="Merrick" value="109" id="KO3" />
		      <Picker.Item label="Mets-Willets Point" value="17" id="KO3" />
		      <Picker.Item label="Mineola" value="42" id="KO3" />
		      <Picker.Item label="Montauk" value="138" id="KO3" />
		      <Picker.Item label="Murray Hill" value="19" id="KO3" />
		      <Picker.Item label="Nassau Boulevard" value="36" id="OB1" />
		      <Picker.Item label="New Hyde Park" value="40" id="OB1" />
		      <Picker.Item label="Northport" value="62" id="OB1" />
		      <Picker.Item label="Nostrand Avenue" value="13" id="OB1" />
		      <Picker.Item label="Oakdale" value="122" id="OB1" />
		      <Picker.Item label="Oceanside" value="103" id="OB1" />
		      <Picker.Item label="Oyster Bay" value="53" id="OB1" />
		      <Picker.Item label="Patchogue" value="124" id="OB1" />
		      <Picker.Item label="Penn Station" value="8" id="OB1" />
		      <Picker.Item label="Pinelawn" value="70" id="OB1" />
		      <Picker.Item label="Plandome" value="27" id="OB1" />
		      <Picker.Item label="Port Jefferson" value="67" id="OB1" />
		      <Picker.Item label="Port Washington" value="28" id="OB1" />
		      <Picker.Item label="Queens Village" value="31" id="OB1" />
		      <Picker.Item label="Riverhead" value="79" id="OB1" />
		      <Picker.Item label="Rockville Centre" value="106" id="OB1" />
		      <Picker.Item label="Ronkonkoma" value="75" id="OB1" />
		      <Picker.Item label="Rosedale" value="86" id="OB1" />
		      <Picker.Item label="Roslyn" value="45" id="OB1" />
		      <Picker.Item label="Sayville" value="123" id="OB1" />
		      <Picker.Item label="Sea Cliff" value="48" id="OB1" />
		      <Picker.Item label="Seaford" value="112" id="OB1" />
		      <Picker.Item label="Smithtown" value="64" id="OB1" />
		      <Picker.Item label="Southampton" value="134" id="OB1" />
		      <Picker.Item label="Southold" value="81" id="OB1" />
		      <Picker.Item label="Speonk" value="129" id="OB1" />
		      <Picker.Item label="St. Albans" value="83" id="OB1" />
		      <Picker.Item label="St. James" value="65" id="OB1" />
		      <Picker.Item label="Stewart Manor" value="35" id="OB1" />
		      <Picker.Item label="Stony Brook" value="66" id="OB1" />
		      <Picker.Item label="Syosset" value="58" id="OB1" />
		      <Picker.Item label="Valley Stream" value="87" id="OB1" />
		      <Picker.Item label="Wantagh" value="111" id="OB1" />
		      <Picker.Item label="West Hempstead" value="92" id="OB1" />
		      <Picker.Item label="Westbury" value="55" id="OB1" />
		      <Picker.Item label="Westhampton" value="130" id="OB1" />
		      <Picker.Item label="Westwood" value="88" id="OB1" />
		      <Picker.Item label="Woodmere" value="95" id="OB1" />
		      <Picker.Item label="Woodside" value="9" id="OB1" />
		      <Picker.Item label="Wyandanch" value="71" id="OB1" />
		      <Picker.Item label="Yaphank" value="78" id="OB1" />
		  </Picker>
		)
	}
}
