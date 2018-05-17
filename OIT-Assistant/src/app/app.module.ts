import { BrowserModule } from '@angular/platform-browser';
import { ErrorHandler, NgModule } from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';
import { LocalNotifications } from '@ionic-native/local-notifications';
import { InAppBrowser } from '@ionic-native/in-app-browser';

import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';
import { ProgressPage } from '../pages/progress/progress';
import { StatisticsPage } from '../pages/statistics/statistics';
import { AchievementsPage } from '../pages/achievements/achievements';
import { SettingsPage } from '../pages/settings/settings';
import { RegisterPage } from "../pages/register/register";
import { MenuComponent } from './menu.component';

import { LoginService } from './login/login.service';
import { LoginModule } from './login/login.module';
import { LoginComponent } from './login/login.component';

import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';
import { TimerComponent } from '../models/timer/timer';

import { NgCalendarModule  } from 'ionic2-calendar';

import { AngularFireModule } from 'angularfire2';
import { AngularFireAuthModule} from 'angularfire2/auth'
import { AngularFirestoreModule } from 'angularfire2/firestore';
import { FIREBASE_CONFIG } from './app.firebase.config';
import { IonicStorageModule } from '@ionic/storage';
//import { UserProvider } from '../providers/user/user';

@NgModule({
  declarations: [
    MyApp,
    HomePage,
    ProgressPage,
    StatisticsPage,
    AchievementsPage,
    SettingsPage,
    RegisterPage,
    MenuComponent,
    TimerComponent
  ],
  imports: [
    NgCalendarModule,
    BrowserModule,
    IonicModule.forRoot(MyApp),
    LoginModule,
    AngularFireModule.initializeApp(FIREBASE_CONFIG),
    AngularFireAuthModule,
    AngularFirestoreModule,
    IonicStorageModule.forRoot()
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    HomePage,
    ProgressPage,
    StatisticsPage,
    AchievementsPage,
    SettingsPage,
    MenuComponent,
    RegisterPage,
    TimerComponent
  ],
  providers: [
    StatusBar,
    SplashScreen,
    LocalNotifications,
    {provide: ErrorHandler, useClass: IonicErrorHandler},
    LoginService,
    InAppBrowser
  ]
})
export class AppModule {}
