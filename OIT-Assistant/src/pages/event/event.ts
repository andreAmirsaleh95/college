import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams, ViewController } from 'ionic-angular';
import moment from 'moment';

import firebase from 'firebase';
import 'firebase/firestore';

@IonicPage({name: 'event-page'})
@Component({
  selector: 'page-event',
  templateUrl: 'event.html',
})
export class EventPage {

  event = { startTime: new Date().toISOString(),
            endTime: new Date().toISOString(),
            doseInc: "",
            notes: ""};
  minDate = new Date().toISOString();
  private uid : string;

  private db : any;

  constructor(public navCtrl: NavController, private navParams: NavParams, public viewCtrl: ViewController) {

    let preselectedDate = moment(this.navParams.get('selectedDay')).format();
    this.uid = this.navParams.get('uid');
    this.event.startTime = preselectedDate;
    this.event.endTime = preselectedDate;

    this.db = firebase.firestore();

    console.log('Event '+this.uid);
    console.log('Event # ' + this.navParams.get('day'));
  }

  cancel() {
    this.viewCtrl.dismiss({day : this.navParams.get('day') - 1});
  }

  save() {
    console.log(this.event);
    this.db.collection('/users/'+this.uid+'/Events').doc('Event'+this.navParams.get('day')).set({
      event : this.event
    });
    this.viewCtrl.dismiss(this.event);
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad EventPage');
  }

}
