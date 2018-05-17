import { Component } from '@angular/core';
import { IonicPage, NavController, ModalController, AlertController, NavParams } from 'ionic-angular';
import { LoginService } from "../../app/login/login.service";
import moment from 'moment';

import firebase from 'firebase';
import 'firebase/firestore';

@IonicPage()
@Component({
  selector: 'page-progress',
  templateUrl: 'progress.html',
})
export class ProgressPage {
  eventSource = [];
  viewTitle: string;
  selectedDay = new Date();

  calendar = {
    mode: 'month',
    currentDate: new Date()
  };

  counter = [0];

  private db : any;

  constructor(public navCtrl: NavController, private modalCtrl: ModalController, private alertCtrl: AlertController, private loginService: LoginService ) {

    this.db = firebase.firestore();

    firebase.firestore().collection('/users/' + this.loginService.userID + '/Events/').doc('Count').get().then( (doc) =>  {
      if (doc.exists) {
          this.counter.push(doc.data().dayCount);
          this.counter.push(doc.data().eventCount);
      }
    }).catch(function(error) {
          console.log("Error getting document:", error);
    });

    //pull all past events from LoginService

    this.eventSource = this.loginService.userEvents;
    console.log(this.loginService.userEvents);

  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad ProgressPage');
  }

  addEvent() {
    console.log('Progress ' + this.loginService.userID);
    //Increment the number of user added events
    this.counter[2] += 1;
    console.log(this.counter[2]);
    let modal = this.modalCtrl.create('event-page', {selectedDay: this.selectedDay, uid : this.loginService.userID, day : this.counter[2]});
    modal.present();
    console.log("display event");
    modal.onDidDismiss(data => {
      if(data.day || data.day == 0){
        //when the user cancels on creating an event
        this.counter[2] = data.day;
      } else if (data) {
        //when the user wants to save an event
        let eventData = data;
        console.log(data);
        eventData.startTime = new Date(data.startTime);
        eventData.endTime = new Date(data.endTime);

        let events = this.eventSource;
        events.push(eventData);
        this.eventSource = [];
        setTimeout(() => {
          this.eventSource = events;
        });

        //update day count in firestore
        this.db.collection('/users/' + this.loginService.userID + '/Events/').doc('Count').set({
          dayCount : this.counter[1],
          eventCount : this.counter[2]
        });
        console.log(events);
      }
    });
  }

  //https://www.joshmorony.com/getting-familiar-with-local-notifications-in-ionic-2/
  addNotifications(event){
      let currentDate = new Date();
      let currentDay = currentDate.getDay(); // Sunday = 0, Monday = 1, etc.

  }

  onViewTitleChanged(title) {
    this.viewTitle = title;
  }

  onEventSelected(event) {
    let start = moment(event.startTime).format('LT');
    let end = moment(event.endTime).format('LT');
    let dose = event.doseInc;
    let notes = event.notes;

    let alertDetails = 'From: ' + start + '<br>To: ' + end + '<br>Dosage Increase: ' + dose + '<br>Notes: ' + notes;

    let alert = this.alertCtrl.create({
      title: '' + event.title,
      subTitle: alertDetails,
      buttons: ['OK']
    })
    alert.present();
  }

  onTimeSelected(ev) {
    this.selectedDay = ev.selectedTime;
  }

}
