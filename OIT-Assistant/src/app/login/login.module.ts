import { NgModule } from '@angular/core';
import { IonicModule } from 'ionic-angular';

import { LoginComponent } from "./login.component";
// Followed tutorial from http://roblouie.com/article/344/ionic-2-hide-menu-or-tabs-for-login-screen/
@NgModule({
  imports: [IonicModule],
  declarations: [LoginComponent],
  entryComponents: [LoginComponent]
})
export class LoginModule {}
