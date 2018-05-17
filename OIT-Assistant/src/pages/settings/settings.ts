import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { LoginService } from "../../app/login/login.service";

import firebase from 'firebase';

import { AlertController } from 'ionic-angular';

import 'firebase/firestore';

@IonicPage()
@Component({
  selector: 'page-settings',
  templateUrl: 'settings.html',
})
export class SettingsPage {

  supplement : string;
  currDose : string;
  //startDate: string = new Date().toISOString();
  //firstDay: string = new Date().toISOString();
  preInterval: string = new Date(0,0,0,-4,0).toISOString();
  postInterval: string = new Date(0,0,0,-3,0).toISOString();
  snooze: string = new Date(0,0,0,-3,0).toISOString();
  TOD = [new String(), new String(), new String(), new String(), new String(), new String(), new String()];
  noAct_sametime: boolean = true;
  algEmail : string;

  private db : any;

  constructor(public navCtrl: NavController, public navParams: NavParams, private loginService: LoginService, private alertCtrl: AlertController ) {

    //console.log(this.LoginService.firstDay());

    this.db = firebase.firestore();
    this.db.collection('/users/' + this.loginService.userID + '/Settings/').doc('Info').get().then( (doc) =>  {
      if (doc.exists) {
          //console.log(doc.data());
          this.supplement = doc.data().supplement;
          this.currDose = doc.data().currDose;
          //this.startDate = doc.data().startDate;
          //this.firstDay = doc.data().firstDay
          this.preInterval = doc.data().preInterval;
          this.postInterval = doc.data().postInterval;
          this.snooze = doc.data().snooze;
          this.TOD = doc.data().TOD;
          this.noAct_sametime = doc.data().noAct;
          this.algEmail = doc.data().algEmail;
      }
    }).catch(function(error) {
          console.log("Error getting document:", error);
    });
  }

  update(){

    try{
      this.db.collection('/users/'+this.loginService.userID+'/Settings').doc('Info').set({
        supplement : this.supplement,
        currDose : this.currDose,
        //startDate : moment(new Date(Date.parse(this.startDate))).format('L'),
        startDate : this.startDate,
        firstDay : this.firstDay,
        preInterval : this.preInterval,
        postInterval : this.postInterval,
        //snooze : (new Date(Date.parse(this.snooze))).getMinutes(),
        snooze : this.snooze,
        TOD : this.TOD,
        noAct : this.noAct_sametime,
        algEmail : this.algEmail
      });

      //need to set TOD specfically so loginService gets the new data
      this.loginService.transferNewSettings(this.TOD, this.currDose, this.preInterval, this.postInterval);
      this.loginService.updateDB();

    }catch(e){
      console.error(e);
      let alertDetails = e;
      let alert = this.alertCtrl.create({
        title: "Oops!",
        subTitle: alertDetails,
        buttons: ['OK']
      })
      alert.present();
    }
    let alert = this.alertCtrl.create({
      title: "Update",
      subTitle: "Your Assistant has updated your info.",
      buttons: ['OK']
    })
    alert.present();
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad SettingsPage');
  }

}
