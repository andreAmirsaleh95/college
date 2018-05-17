import { Component, ViewChild } from '@angular/core';
import { NavController, NavParams } from 'ionic-angular';
import { LoginService } from '../../app/login/login.service';
import { InAppBrowser } from '@ionic-native/in-app-browser'
import { User } from '../../models/user';
import { TimerComponent } from '../../models/timer/timer';

import firebase from 'firebase';
import 'firebase/firestore';

declare let unityARCaller: any;

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {

  @ViewChild(TimerComponent) timer: TimerComponent
  @ViewChild(TimerComponent) gamer: TimerComponent

  private db : any;
  public user = {} as User;
  greeting : string;
  setBool = 0;
  private nextInterval : number = 120;
  game = {seconds: 10800,
          runTimer: false,
          hasStarted: false,
          hasFinished: false,
          secondsRemaining: 10800,
          displayTime: this.getSecondsAsDigitalClock(10800)}

  constructor(public navCtrl: NavController, public navParams: NavParams, private loginService: LoginService, private iab: InAppBrowser) {

    this.db = firebase.firestore();

    console.log(this.loginService.userID);

    //get user info from firebase
    this.db.collection('users').doc(this.loginService.userID).get().then( (doc) =>  {
      if (doc.exists) {
          console.log(doc.data());
          this.user = doc.data();
          //console.log(this.user);
          this.greeting = "Hello " + this.user.first + ", Welcome to the OIT Assistant";
      }
    }).catch(function(error) {
          console.log("Error getting document:", error);
    });

    //Day Counter
    this.db.collection('/users/' + this.loginService.userID + '/Settings/').doc('Info').get().then( (doc) =>  {
      if (doc.exists) {
        var today = new Date();
        var first = new Date(Date.parse(doc.data().firstDay));
        var diff = Math.abs(today.getTime() - (first.getTime()));
        this.days = Math.ceil(diff / (1000 * 3600 * 24))+1;

        //nextInterval Timer
        console.log(doc.data().TOD);
        var today = new Date();
        var tom = new Date();
        const now = new Date();
        if(now.getDay() == 6){
          tom.setTime(Date.parse(doc.data().TOD[0]));
        }else{
          tom.setTime(Date.parse(doc.data().TOD[now.getDay()+1]));
        }
        tom.setYear(today.getYear()+1900);
        tom.setMonth(today.getMonth());
        tom.setUTCDate(today.getUTCDate() + 1);
        console.log(today);
        console.log(tom);
        //tom.setTime(today.getTime() + (24*60*60*1000))
        var d = Math.abs(tom.getTime() - (today.getTime()));
        this.nextInterval = Math.floor(d/(1000));

        //Game Timer
        if(this.nextInterval == 0){
          var pre = new Date();
          var post = new Date();
          pre.setTime(Date.parse(doc.data().preInterval));
          post.setTime(Date.parse(doc.data().postInterval));
          var hours = (pre.getUTCHours()+ post.getUTCHours()) * 3600;
          var min = (pre.getUTCMinutes()+ post.getUTCMinutes()) * 60;
          this.game.secondsRemaining = hours + min;
          this.game.seconds = hours + min;
          this.game.hasStarted = true;
          this.game.runTimer = true;
          console.log(this.game);
          this.timerTick();
        }
      }
    }).catch(function(error) {
          console.log("Error getting document:", error);
    });


  }

  ngOnInit() {
    setTimeout(() => {
      this.timer.startTimer(this.nextInterval);
    }, 1000)
  }

  timerTick() {
      setTimeout(() => {
          if (!this.game.runTimer) { return; }
          this.game.secondsRemaining--;
          this.game.displayTime = this.getSecondsAsDigitalClock(this.game.secondsRemaining);
          if (this.game.secondsRemaining > 0) {
              this.timerTick();
          }
          else {
              this.game.hasFinished = true;
          }
      }, 1500);
  }

  getSecondsAsDigitalClock(inputSeconds: number) {
      var sec_num = parseInt(inputSeconds.toString(), 10); // don't forget the second param
      var hours   = Math.floor(sec_num / 3600);
      var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
      var seconds = sec_num - (hours * 3600) - (minutes * 60);
      var hoursString = '';
      var minutesString = '';
      var secondsString = '';
      hoursString = (hours < 10) ? "0" + hours : hours.toString();
      minutesString = (minutes < 10) ? "0" + minutes : minutes.toString();
      secondsString = (seconds < 10) ? "0" + seconds : seconds.toString();
      return hoursString + ':' + minutesString + ':' + secondsString;
  }


  //Unity Game
  openUnity() {
      const browser = this.iab.create('https://oitlaunchgame.firebaseapp.com/');
  }

}
