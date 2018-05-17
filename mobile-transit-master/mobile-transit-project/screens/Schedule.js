import React from 'react';
import { 
  StyleSheet, 
  Text, 
  View,
  WebView,
  Picker, 
  Alert,
} from 'react-native'; 

export default class ScheduleScreen extends React.Component {
  static navigationOptions = {
    title: 'Schedule',
  };

  getUrl(value) {
    if (value=="44") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/OysterBayOB1.pdf"
    } else if (value=="137") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/MontaukMY3.pdf";
    }
    else if (value=="115") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/BabylonBY4.pdf";
    }
    else if (value=="12") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/CityTerminalCT2.pdf";
    }
    else if (value=="21") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortWashingtonPW1.pdf";
    }
    else if (value=="118") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/BabylonBY5.pdf";
    }
    else if (value=="107") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/BabylonBY1.pdf";
    }
    else if (value=="119") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/MontaukMY1.pdf";
    }
    else if (value=="22") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortWashingtonPW2.pdf";
    }
    else if (value=="33") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/HempsteadHM1.pdf";
    }
    else if (value=="110") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/BabylonBY2.pdf";
    }
    else if (value=="126") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/MontaukMY3.pdf";
    }
    else if (value=="32") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/HempsteadHM1.pdf";
    }
    else if (value=="68") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/RonkonkomaKO1.pdf";
    }
    else if (value=="73") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/RonkonkomaKO3.pdf";
    }
    else if (value=="135") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/MontaukMY3.pdf";
    }
    else if (value=="20") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortWashingtonPW1.pdf";
    }
    else if (value=="54") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortJeffersonPJ2.pdf";
    }
    else if (value=="96") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/FarRockawayFR3.pdf";
    }
    else if (value=="74") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/RonkonkomaKO3.pdf";
    }
    else if (value=="101") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/LongBeachLB2.pdf";
    }
    else if (value=="59") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortJeffersonPJ4.pdf";
    }
    else if (value=="116") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/BabylonBY4.pdf";
    }
    else if (value=="38") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/HempsteadHM2.pdf";
    }
    else if (value=="72") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/RonkonkomaKO2.pdf";
    }
    else if (value=="23") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortWashingtonPW2.pdf";
    }
    else if (value=="136") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/MontaukMY3.pdf";
    }
    else if (value=="14") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/CityTerminalCT2.pdf";
    }
    else if (value=="102") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/LongBeachLB2.pdf";
    }
    else if (value=="43") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/OysterBayOB1.pdf";
    }
    else if (value=="99") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/FarRockawayFR3.pdf";
    }
    else if (value=="69") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/RonkonkomaKO1.pdf";
    }
    else if (value=="34") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/HempsteadHM1.pdf";
    }
    else if (value=="18") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortWashingtonPW1.pdf";
    }
    else if (value=="10") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Branch2/ForestHillsKewGardBranch.pdf";
    }
    else if (value=="108") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/BabylonBY1.pdf";
    }
    else if (value=="37") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/HempsteadHM2.pdf";
    }
    else if (value=="93") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/FarRockawayFR3.pdf";
    }
    else if (value=="50") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/OysterBayOB2.pdf";
    }
    else if (value=="47") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/OysterBayOB2.pdf";
    }
    else if (value=="49") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/OysterBayOB2.pdf";
    }
    else if (value=="25") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortWashingtonPW3.pdf";
    }
    else if (value=="121") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/MontaukMY1.pdf";
    }
    else if (value=="61") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortJeffersonPJ5.pdf";
    }
    else if (value=="82") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/RonkonkomaKO4.pdf";
    }
    else if (value=="46") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/OysterBayOB1.pdf";
    }
    else if (value=="132") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/MontaukMY3.pdf";
    }
    else if (value=="39") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/HempsteadHM2.pdf";
    }
    else if (value=="91") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/WestHempsteadWM1.pdf";
    }
    else if (value=="94") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/FarRockawayFR3.pdf";
    }
    else if (value=="56") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortJeffersonPJ3.pdf";
    }
    else if (value=="30") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/HempsteadHM1.pdf";
    }
    else if (value=="2") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/HPA-LICMF.pdf";
    }
    else if (value=="60") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortJeffersonPJ4.pdf";
    }
    else if (value=="98") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/FarRockawayFR3.pdf";
    }
    else if (value=="104") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/LongBeachLB2.pdf";
    }
    else if (value=="120") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/MontaukMY1.pdf";
    }
    else if (value=="15") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Branch2/CityTerminalBranch.pdf";
    }
    else if (value=="11") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Branch2/ForestHillsKewGardBranch.pdf";
    }
    else if (value=="63") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortJeffersonPJ5.pdf";
    }
    else if (value=="90") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/WestHempsteadWM1.pdf";
    }
    else if (value=="85") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/FarRockawayFR1.pdf";
    }
    else if (value=="97") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/FarRockawayFR3.pdf";
    }
    else if (value=="117") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/BabylonBY4.pdf";
    }
    else if (value=="24") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortWashingtonPW2.pdf";
    }
    else if (value=="84") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/FarRockawayFR1.pdf";
    }
    else if (value=="51") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/OysterBayOB3.pdf";
    }
    else if (value=="105") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/LongBeachLB2.pdf";
    }
    else if (value=="1") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/HPA-LICMF.pdf";
    }
    else if (value=="100") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/LongBeachLB1.pdf";
    }
    else if (value=="89") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/WestHempsteadWM1.pdf";
    }
    else if (value=="26") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortWashingtonPW4.pdf";
    }
    else if (value=="113") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/BabylonBY3.pdf";
    }
    else if (value=="114") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/BabylonBY3.pdf";
    }
    else if (value=="127") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/MontaukMY3.pdf";
    }
    else if (value=="80") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/RonkonkomaKO4.pdf";
    }
    else if (value=="77") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/RonkonkomaKO4.pdf";
    }
    else if (value=="41") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortJeffersonPJ1.pdf";
    }
    else if (value=="109") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/BabylonBY2.pdf";
    }
    else if (value=="17") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortWashingtonPW1.pdf";
    }
    else if (value=="42") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortJeffersonPJ1.pdf";
    }
    else if (value=="138") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/MontaukMY3.pdf";
    }
    else if (value=="19") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortWashingtonPW1.pdf";
    }
    else if (value=="36") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/HempsteadHM2.pdf";
    }
    else if (value=="40") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortJeffersonPJ1.pdf";
    }
    else if (value=="62") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortJeffersonPJ5.pdf";
    }
    else if (value=="13") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/CityTerminalCT2.pdf";
    }
    else if (value=="122") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/MontaukMY1.pdf";
    }
    else if (value=="103") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/LongBeachLB2.pdf";
    }
    else if (value=="53") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/OysterBayOB3.pdf";
    }
    else if (value=="124") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/MontaukMY2.pdf";
    }
    else if (value=="8") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/CityTerminalCT1.pdf";
    }
    else if (value=="70") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/RonkonkomaKO2.pdf";
    }
    else if (value=="27") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortWashingtonPW4.pdf";
    }
    else if (value=="67") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortJeffersonPJ1.pdf";
    }
    else if (value=="28") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortWashingtonPW4.pdf";
    }
    else if (value=="31") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/HempsteadHM1.pdf";
    }
    else if (value=="79") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/RonkonkomaKO4.pdf";
    }
    else if (value=="106") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/BabylonBY1.pdf";
    }
    else if (value=="75") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/RonkonkomaKO3.pdf";
    }
    else if (value=="86") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/FarRockawayFR1.pdf";
    }
    else if (value=="45") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/OysterBayOB1.pdf";
    }
    else if (value=="123") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/MontaukMY2.pdf";
    }
    else if (value=="48") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/OysterBayOB2.pdf";
    }
    else if (value=="112") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/BabylonBY3.pdf";
    }
    else if (value=="64") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortJeffersonPJ6.pdf";
    }
    else if (value=="134") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/MontaukMY3.pdf";
    }
    else if (value=="81") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/RonkonkomaKO4.pdf";
    }
    else if (value=="129") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/MontaukMY3.pdf";
    }
    else if (value=="83") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/WestHempsteadWM1SAB.pdf";
    }
    else if (value=="65") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortJeffersonPJ6.pdf";
    }
    else if (value=="35") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/HempsteadHM2.pdf";
    }
    else if (value=="66") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortJeffersonPJ6.pdf";
    }
    else if (value=="58") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortJeffersonPJ4.pdf";
    }
    else if (value=="87") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/FarRockawayFR2.pdf";
    }
    else if (value=="111") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/BabylonBY2.pdf";
    }
    else if (value=="92") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/WestHempsteadWM1.pdf";
    }
    else if (value=="55") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/PortJeffersonPJ2.pdf";
    }
    else if (value=="130") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/MontaukMY3.pdf";
    }
    else if (value=="88") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/WestHempsteadWM1.pdf";
    }
    else if (value=="95") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/FarRockawayFR3.pdf";
    }
    else if (value=="9") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/CityTerminalCT1.pdf";
    }
    else if (value=="71") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/RonkonkomaKO2.pdf";
    }
    else if (value=="78") {
      stationUrl = "http://web.mta.info/lirr/Timetable/Station2/RonkonkomaKO4.pdf";
    } else {
      // Alert.alert('Station Not Found.\nPlease try again.');
      stationUrl = "null";
    };

    if (stationUrl != "null"){
      return (stationUrl);
    }
  }

  render() {
    const { params } = this.props.navigation.state;
    console.log(params.station);
    var value = params.station;
    var stationUrl = this.getUrl(value);
    console.log(value);

    return (
      <WebView 
        source={{uri: stationUrl}}
        style={{marginTop: 20}} />
    );
  }
}