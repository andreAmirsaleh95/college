import { Injectable } from '@angular/core';

import firebase from 'firebase';
import 'firebase/firestore';
// Followed tutorial from http://roblouie.com/article/344/ionic-2-hide-menu-or-tabs-for-login-screen/

@Injectable()
export class LoginService {
  private _userid : string;
  private _userEvents = [];
  private _tempEvents = [];
  private _currDay =[];

  supplement = new String();
  currDose = new String();
  startDate = new Date();
  firstDay = new Date();
  preInterval = new Date();
  postInterval = new Date();
  snooze: string = new Date(0,0,0,-3,0).toISOString();
  TOD = [new String(), new String(), new String(), new String(), new String(), new String(), new String()];
  noAct_sametime: boolean = true;
  algEmail : string;

  login(uid) {
    this._userid = uid;
  }

  logout() {
    this._userid = '';
  }
  setTreatDay(day){
    this._currDay = day;
  }

  transferNewSettings(array, dose, pre, post){
    this.TOD = array;
    this.currDose = dose;
    this.preInterval.setTime(Date.parse(pre));
    this.postInterval.setTime(Date.parse(post));
  }

  get isLoggedIn(): boolean {
    return this._userid in this;
  }

  get userID(): string {
    return this._userid;
  }

  get userEvents() : any {
    //console.log(this._tempEvents);
    return this._userEvents;
  }

  setSettingListener(){
    firebase.firestore().collection('/users/' + this._userid + '/Settings/').doc('Info').get().then( (doc) => {
      var source = doc.metadata.hasPendingWrites ? "Local" : "Server";
      console.log(source, " data: ", doc && doc.data());
      this.supplement = doc.data().supplement;
      this.currDose = doc.data().currDose;
      this.startDate.setTime(Date.parse(doc.data().startDate));
      this.firstDay.setTime(Date.parse(doc.data().firstDay));
      this.preInterval.setTime(Date.parse(doc.data().preInterval));
      //console.log(this.preInterval);
      this.postInterval.setTime(Date.parse(doc.data().postInterval));
      //this.snooze = doc.data().snooze;
      //this.TOD = doc.data().TOD;
      //this.noAct_sametime = doc.data().noAct;
      this.algEmail = doc.data().algEmail;
    });
  }

  setUserEvents(data) {
    if (data != 0){
      this._userEvents = data;
    } else if(data == 0) {
      console.log('setEvents');
      //get number of days currently stored on the database
      firebase.firestore().collection('/users/' + this._userid + '/Events/').doc('Count').get().then( (doc) =>  {
        if (doc.exists) {
            //console.log('day ' +doc.data().dayCount);
            //add days to calendar array (this.eventSource) with correct format
            for(var i = 1; i<=doc.data().dayCount; i++) {
              firebase.firestore().collection('/users/' + this._userid + '/Events/').doc('Day'+i+'-Pre').get().then( (day) =>  {
                if (day.exists) {
                    this._userEvents.push({
                      doseInc : day.data().event.doseInc,
                      endTime : new Date(day.data().event.endTime), //change 5 (EST Timezone) to adjust Z = zero time zone
                      notes : day.data().event.notes,
                      startTime : new Date(day.data().event.startTime), //change 5 (EST Timezone) to adjust Z = zero time zone
                      title : day.data().event.title
                    });
                    //console.log(this._userEvents);
                }
              }).catch(function(error) {
                    console.log("Error getting document:", error);
              });
              firebase.firestore().collection('/users/' + this._userid + '/Events/').doc('Day'+i+'-Post').get().then( (day) =>  {
                if (day.exists) {
                    this._userEvents.push({
                      doseInc : day.data().event.doseInc,
                      endTime : new Date(day.data().event.endTime), //change 5 (EST Timezone) to adjust Z = zero time zone
                      notes : day.data().event.notes,
                      startTime : new Date(day.data().event.startTime), //change 5 (EST Timezone) to adjust Z = zero time zone
                      title : day.data().event.title
                    });
                    //console.log(this._userEvents);
                }
              }).catch(function(error) {
                    console.log("Error getting document:", error);
              });
            }
            for(var j = 1; j < doc.data().eventCount+1; j++) {
              //console.log("add Events");
              firebase.firestore().collection('/users/' + this._userid + '/Events/').doc('Event'+j).get().then( (day) =>  {
                if (day.exists) {
                    this._userEvents.push({
                      doseInc : day.data().event.doseInc,
                      endTime : new Date(day.data().event.endTime),
                      notes : day.data().event.notes,
                      startTime : new Date(day.data().event.startTime),
                      title : day.data().event.title
                    });
                    //console.log(this._userEvents);
                }
              }).catch(function(error) {
                    console.log("Error getting document:", error);
              });
            }
        }
      }).catch(function(error) {
            console.log("Error getting document:", error);
      });
    }
  }

  updateDB(){
    //update current date
    console.log('updateDB');
    //this function is called every time settings Info doc is changed
    var today = new Date();
    var timezoneOffset = Math.floor(today.getTimezoneOffset()/ 60);
    this._tempEvents = [];
    today.setUTCMilliseconds(0);
    today.setUTCSeconds(0);
    today.setUTCMinutes(0);

    var durPreHours = this.preInterval.getUTCHours();
    var durPreMin = this.preInterval.getUTCMinutes();
    var durPostHours = this.postInterval.getUTCHours();
    var durPostMin = this.postInterval.getUTCMinutes();
    //console.log(durPreHours, durPreMin, durPostHours, durPostMin);
    var today = new Date();
    var diff = Math.abs(today.getTime() - (this.firstDay.getTime()));
    var diffDays = Math.ceil(diff / (1000 * 3600 * 24));
    //console.log(diffDays);

    //console.log(this.TOD);
    this._tempEvents = this._userEvents.splice(0, diffDays*2);
    for (var i = diffDays + 1; i <= 30; i++){
      //console.log(today);
      var alertTime = new Date(Date.parse(this.TOD[today.getDay()]));

      //update new preInterval
      var sTime = new Date(today.getTime());
      sTime.setUTCHours(alertTime.getUTCHours());
      sTime.setMinutes(alertTime.getMinutes());
      //console.log('sTime :' + sTime.toISOString());
      var eTime = new Date(today.getTime());
      //console.log('eTime :' + eTime, durPreHours, durPreMin);
      eTime.setUTCHours(alertTime.getUTCHours() + durPreHours);
      eTime.setMinutes(alertTime.getMinutes() + durPreMin);

      var temp = {
          'doseInc' : this.currDose,
          'endTime' : eTime.toISOString().replace('Z', timezoneOffset), //change timezone in variable,
          'notes' : "",
          'startTime' : sTime.toISOString().replace('Z', timezoneOffset), //change timezone in variable,
          'title' : 'Day ' + i + ': Pre-Dosage'
      };
      firebase.firestore().collection('/users/' + this._userid + '/Events/').doc('Day'+i+'-Pre').update({
        event : temp
      }).catch(function(error){
        console.error(error);
      });
      temp.startTime = new Date(sTime.toISOString().replace('Z', timezoneOffset));
      temp.endTime = new Date(eTime.toISOString().replace('Z', timezoneOffset));
      this._tempEvents.push(temp);

      //update new postInterval
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
          'endTime' : eTime.toISOString().replace('Z', timezoneOffset), //change timezone in variable,
          'notes' : "",
          'startTime' : sTime.toISOString().replace('Z', timezoneOffset), //change timezone in variable,
          'title' : 'Day ' + i + ': Post-Dosage'
      };
      firebase.firestore().collection('/users/' + this._userid + '/Events/').doc('Day'+i+'-Post').update({
        event : temp
      }).catch(function(error){
        console.error(error);
      });
      temp.startTime = new Date(sTime.toISOString().replace('Z', timezoneOffset));
      temp.endTime = new Date(eTime.toISOString().replace('Z', timezoneOffset));
      this._tempEvents.push(temp);

      today  = new Date(today.getTime() + (24*60*60*1000));
      //console.log(today);
    }

    //get user created events from database
    //could attempt to pull these events from the previous _userEvents but posibilibity of sloppy array in long run
    firebase.firestore().collection('/users/' + this._userid + '/Events/').doc('Count').get().then( (doc) =>  {
      if (doc.exists) {
        //console.log("add Events", doc.data().eventCount);
        for(var j = 1; j < doc.data().eventCount+1; j++) {
          //console.log("add Events");
          firebase.firestore().collection('/users/' + this._userid + '/Events/').doc('Event'+j).get().then( (day) =>  {
            if (day.exists) {
                this._tempEvents.push({
                  doseInc : day.data().event.doseInc,
                  endTime : new Date(day.data().event.endTime),
                  notes : day.data().event.notes,
                  startTime : new Date(day.data().event.startTime),
                  title : day.data().event.title
                });
                //console.log(this._userEvents);
            }
          }).catch(function(error) {
                console.log("Error getting document:", error);
          });
        }
      }
    });
    this._userEvents = this._tempEvents;
  }

}
