import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { InazumaComponent } from './inazuma/inazuma.component';
import { AvisoLegalComponent } from './aviso-legal/aviso-legal.component';
import { SobreNosotrosComponent } from './sobre-nosotros/sobre-nosotros.component';
import { SupertComponent } from './supertecnicas/supertecnicas.component';
import { EquiposComponent } from './equipos/equipos.component';
import { JuegosComponent } from './juegos/juegos.component';

const routes: Routes = [
  { path: '', redirectTo: '/register', pathMatch: 'full'},
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'aviso-legal', component: AvisoLegalComponent },
  { path: 'sobre-nosotros', component: SobreNosotrosComponent},
  { path: 'inazuma', component: InazumaComponent,},
  { path: 'supertecnicas', component: SupertComponent},
  { path: 'equipos', component: EquiposComponent},
  { path: 'juegos', component: JuegosComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}

