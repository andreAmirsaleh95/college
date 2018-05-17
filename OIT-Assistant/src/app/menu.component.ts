import { Component, ViewChild } from '@angular/core';
import { Nav, Platform } from 'ionic-angular';
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

import { HomePage } from '../pages/home/home';
import { ProgressPage } from '../pages/progress/progress';
import { StatisticsPage } from '../pages/statistics/statistics';
import { AchievementsPage } from '../pages/achievements/achievements';
import { SettingsPage } from '../pages/settings/settings';

import firebase from 'firebase';
import 'firebase/firestore';

import { LoginService } from "./login/login.service";
import { LoginComponent } from "./login/login.component";
import { NavController } from "ionic-angular/index";
import { AngularFireAuth } from "angularfire2/auth";

import { User } from "../models/user";
import { RegisterPage } from "../pages/register/register"

@Component({
  templateUrl: 'menu.html'
})
export class MenuComponent {
  @ViewChild(Nav) nav: Nav;

  rootPage: any = HomePage;

  pages: Array<{title: string, component: any}>;

  constructor(public platform: Platform, public statusBar: StatusBar, public splashScreen: SplashScreen, private afAuth: AngularFireAuth, public navCtrl: NavController, private loginService: LoginService) {
    // used for an example of ngFor and navigation
    this.pages = [
      { title: 'Home', component: HomePage },
      { title: 'Progress Calendar', component: ProgressPage },
      { title: 'Game Achievements', component: AchievementsPage },
      { title: 'Settings', component: SettingsPage }
    ];

  }

  logoutUser(): any {
    this.afAuth.auth.signOut();
    this.navCtrl.push(LoginComponent);
    console.log("signOut");
  }

  openPage(page) {
    // Reset the content nav to have just this page
    // we wouldn't want the back button to show in this scenario
    this.nav.setRoot(page.component);
  }
}
