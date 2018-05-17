import { Component } from '@angular/core';
import { LoginService } from "./login.service";
import { NavController } from "ionic-angular/index";

import firebase from 'firebase';
import 'firebase/firestore';
import { AngularFireAuth } from "angularfire2/auth";
import { AlertController } from 'ionic-angular';

import { User } from "../../models/user";
import { RegisterPage } from "../../pages/register/register"
// Followed tutorial from http://roblouie.com/article/344/ionic-2-hide-menu-or-tabs-for-login-screen/
@Component({
  templateUrl: 'login.html'
})
export class LoginComponent {

  user = { } as User;
  currDay = [];

  constructor(private afAuth: AngularFireAuth, private loginService: LoginService, private nav: NavController, private alertCtrl: AlertController) {
    
  }

  async login() {
    try{
      const result = await this.afAuth.auth.signInWithEmailAndPassword(this.user.email, this.user.password);

      //Store user id key value within Ionic
      this.loginService.login(result.uid);
      //set current day of treatment within LoginService
      firebase.firestore().collection('/users/' + result.uid + '/Settings/').doc('Info').get().then( (doc) =>  {
        if (doc.exists) {
          this.currDay.push(doc.data().currDay);
        }
      });

      //load all the calendar events to the loginService
      this.loginService.setUserEvents(0);
      console.log(this.loginService.userEvents);
      this.loginService.setSettingListener();

      this.nav.pop();
      console.log(result);
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

  register(){
    this.nav.push(RegisterPage);
  }
}
