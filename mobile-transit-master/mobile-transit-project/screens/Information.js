import React from 'react';
import { 
  StyleSheet, 
  Text, 
  View,
  WebView
} from 'react-native'; 

export default class InformationScreen extends React.Component {
  static navigationOptions = {
    title: 'Information',
  };

  render() {
    const jsCode = "window.postMessage(document.getElementsById('railDiv'))";

    const { params } = this.props.navigation.state;
    return (
      <WebView
        source={{uri: "http://www.mta.info/"}}
        injectedJavaScript={"console.log('hi')"} />
    );
  }
}
