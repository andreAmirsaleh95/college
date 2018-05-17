import React, { Component } from 'react';
import { StyleSheet, Text, View, TextInput, TouchableOpacity } from 'react-native';
import ButtonComponent, { CircleButton, RoundButton, RectangleButton } from 'react-native-button-component';


export default class ImgButton extends Component {
	render() {
		return(
			<View>
				<RectangleButton 
					style={styles.buttonContainer}>
					title={this.props.purpose}
          			<Text style={styles.buttonText}>{this.props.purpose}</Text>
        		</RectangleButton>
			</View>
		)
	};
}

const styles = StyleSheet.create({
	buttonContainer: {
		padding: 10,
		width: 300,
		height: 60,
		backgroundColor: '#2980b9',
		alignItems: 'center',
		justifyContent: 'center',
		margin: 10,
		borderColor: '#fff',
		borderWidth: 2
	},

	buttonText: {
		color: '#fff'
	}
});
