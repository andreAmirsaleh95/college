import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams} from 'ionic-angular';
//import { User } from "../../models/user";
import { AngularFireAuth } from "angularfire2/auth";
import { AngularFireModule } from 'angularfire2';
import { AngularFireAuthModule } from 'angularfire2/auth';
import { AngularFirestoreModule } from 'angularfire2/firestore';
import { LoginService } from "../../app/login/login.service";
import { User } from "../../models/user";

import { AlertController } from 'ionic-angular';

import * as firebase from 'firebase';
import 'firebase/firestore';
import moment from 'moment';
import { HomePage } from "../../pages/home/home";


@IonicPage()
@Component({
  selector: 'page-register',
  templateUrl: 'register.html',
})
export class RegisterPage {

  user = { } as User;
  supplement : string;
  currDose : string;
  startDate: string = new Date().toISOString();
  firstDay: string = new Date().toISOString();
  preInterval: string = new Date(0,0,0,-4,0).toISOString();
  postInterval: string = new Date(0,0,0,-3,0).toISOString();
  snooze: string = new Date(0,0,0,-3,0).toISOString();
  TOD = [];
  algEmail: string;
  eventSource  = [];
  timezoneOffset : any;

  noAct_sametime: boolean = true;

  private db : any;

  constructor(private afAuth: AngularFireAuth, public navCtrl: NavController, public navParams: NavParams, private loginService: LoginService, private alertCtrl: AlertController) {
    this.db = firebase.firestore();
    this.TOD[0] = new Date(0,0,0,2,0).toISOString();
    this.TOD[1] = new Date(0,0,0,2,0).toISOString();
    this.TOD[2] = new Date(0,0,0,2,0).toISOString();
    this.TOD[3] = new Date(0,0,0,2,0).toISOString();
    this.TOD[4] = new Date(0,0,0,2,0).toISOString();
    this.TOD[5] = new Date(0,0,0,2,0).toISOString();
    this.TOD[6] = new Date(0,0,0,2,0).toISOString();
    this.algEmail = "";
    this.timezoneOffset = Math.floor((new Date).getTimezoneOffset()/60);
  }

  async register(){
    //submit all the information to config
    try{
      const result = await this.afAuth.auth.createUserWithEmailAndPassword(this.user.email, this.user.password);

      this.addData(result);

      //Store user id key value within Ionic
      this.loginService.login(result.uid);
      //Get the current day of treatment
      var diff = Math.abs((new Date).getTime() - (new Date(this.startDate)).getTime())
      this.loginService.setTreatDay(Math.ceil(diff /(1000 * 3600 * 24)));
      console.log(Math.ceil(diff /(1000 * 3600 * 24)));
      //console.log((new Date).valueof() - this.startDate.valueof());

      this.loginService.setUserEvents(this.eventSource);

      //go to HomePage
      this.navCtrl.popToRoot();
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
  }

  addData(result: any){
    //moment(Date.parse(this.startDated)).format('L');
    //console.log((new Date(Date.parse(this.snooze))).getMinutes());
    try{
      //console.log(this.supplement);
      //add uid/new user to users collection
      this.db.collection(`/users`).doc(result.uid).set({
        uid: result.uid,
        first: this.user.first,
        last: this.user.last,
        email: this.user.email,
      });
      //add collections for Achievements
      this.db.collection('/users/'+result.uid+'/Achievements').doc('Achieve1').set({
        image: 'hello'
      });

      //add events for Calendar
      this.db.collection('/users/'+result.uid+'/Settings/').doc('Info').get().then( (doc) =>  {
        if (doc.exists) {
            //console.log(doc.data());
            this.addEvents(result.uid);
            //console.log(temp);
            //this.loginService.setEvents(temp);
        }
      }).catch(function(error) {
            console.log("Error getting document:", error);
      });

      }catch(e){
        console.error(e);
      }

      //add collection for Settings
      //var timezoneOffset = new String(Math.floor(today.getTimezoneOffset()/60));
      //console.log(this.preInterval);
      //console.log(this.postInterval);
      this.db.collection('/users/'+result.uid+'/Settings').doc('Info').set({
        supplement : this.supplement,
        currDose : this.currDose,
        //startDate : moment(new Date(Date.parse(this.startDate))).format('L'),
        startDate : this.startDate.replace('Z', this.timezoneOffset),
        firstDay : this.firstDay.replace('Z', this.timezoneOffset),
        preInterval : this.preInterval,//.replace('Z', this.timezoneOffset),
        postInterval : this.postInterval,//.replace('Z', this.timezoneOffset),
        //snooze : (new Date(Date.parse(this.snooze))).getMinutes(),
        snooze : this.snooze.replace('Z', this.timezoneOffset),
        TOD : this.TOD,
        noAct : this.noAct_sametime,
        algEmail : this.algEmail
      });

    }catch(e){
      console.error(e);
    }

    addEvents(userid){
      this.db.collection('/users/'+userid+'/Events').doc('Count').set({
        dayCount: 30,
        eventCount: 0,
        currDay : 1
      });
      var today = new Date(); //add date here to generae older account
      today.setUTCMilliseconds(0);
      today.setUTCSeconds(0);
      today.setUTCMinutes(0);
      //console.log('Today ' + today);
      var durPreHours = (new Date(this.preInterval)).getUTCHours();
      var durPreMin = (new Date(this.preInterval)).getUTCMinutes();
      var durPostHours = (new Date(this.postInterval)).getUTCHours();
      var durPostMin = (new Date(this.postInterval)).getUTCMinutes();

      //console.log(times);
      for (var i = 1; i <= 30; i++){
        //console.log(today);
        var alertTime = new Date(this.TOD[today.getDay()]);

        //preInterval
        var sTime = new Date(today);
        sTime.setUTCHours(alertTime.getUTCHours());
        sTime.setMinutes(alertTime.getMinutes());
        //console.log('sTime :' + sTime.toISOString());
        var eTime = new Date(today);
        eTime.setUTCHours(alertTime.getUTCHours() + durPreHours);
        eTime.setMinutes(alertTime.getMinutes() + durPreMin);
        //console.log('eTime :' + eTime.toISOString());
        var temp = {
            'doseInc' : this.currDose,
            'endTime' : eTime.toISOString().replace('Z', this.timezoneOffset), //change timezone in variable,
            'notes' : "",
            'startTime' : sTime.toISOString().replace('Z', this.timezoneOffset), //change timezone in variable,
            'title' : 'Day ' + i + ': Pre-Dosage'
        };
        this.db.collection('/users/' + userid + '/Events/').doc('Day'+i+'-Pre').set({
          event : temp
        });
        temp.startTime = new Date(sTime.toISOString().replace('Z', this.timezoneOffset));
        temp.endTime = new Date(eTime.toISOString().replace('Z', this.timezoneOffset));
        this.eventSource.push(temp);

        //postInterval
        var sTime = new Date(today);
        sTime.setUTCHours(alertTime.getUTCHours() + durPreHours);
        sTime.setMinutes(alertTime.getMinutes() + durPreMin);
        //console.log('sTime :' + sTime.toISOString());
        var eTime = new Date(today);
        eTime.setUTCHours(alertTime.getUTCHours() + durPreHours + durPostHours);
        eTime.setMinutes(alertTime.getMinutes() + durPreMin + durPostMin);
        //console.log('eTime :' + eTime.toISOString());
        var temp = {
            'doseInc' : this.currDose,
            'endTime' : eTime.toISOString().replace('Z', this.timezoneOffset), //change timezone in variable,
            'notes' : "",
            'startTime' : sTime.toISOString().replace('Z', this.timezoneOffset), //change timezone in variable,
            'title' : 'Day ' + i + ': Post-Dosage'
        };
        this.db.collection('/users/' + userid + '/Events/').doc('Day'+i+'-Post').set({
          event : temp
        });
        temp.startTime = new Date(sTime.toISOString().replace('Z', this.timezoneOffset));
        temp.endTime = new Date(eTime.toISOString().replace('Z', this.timezoneOffset));
        this.eventSource.push(temp);

        today  = new Date(today.getTime() + (24*60*60*1000));
        //console.log(today);
      }
      console.log(this.eventSource);
      this.loginService.setUserEvents(this.eventSource);
    }
}
