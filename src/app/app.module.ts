import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module'; // Asegúrate de que esta ruta sea correcta
import { AppComponent } from './app.component'; // Asegúrate de que esta importación sea correcta
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { InazumaComponent } from './inazuma/inazuma.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { AvisoLegalComponent } from './aviso-legal/aviso-legal.component';
import { SobreNosotrosComponent } from './sobre-nosotros/sobre-nosotros.component';
import { SupertComponent } from './supertecnicas/supertecnicas.component';
import { EquiposComponent } from './equipos/equipos.component';
import { JuegosComponent } from './juegos/juegos.component'; // Importar ReactiveFormsModule si usas formularios reactivos

@NgModule({
  declarations: [
    AppComponent,  // Declarar AppComponent aquí
    LoginComponent,
    RegisterComponent,
    InazumaComponent,
    AvisoLegalComponent,
    SobreNosotrosComponent,
    SupertComponent,
    EquiposComponent,
    JuegosComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    AppRoutingModule,  // Si tienes rutas, asegúrate de que estén bien configuradas
    ReactiveFormsModule  // Si estás usando formularios reactivos
  ],
  bootstrap: [AppComponent]  // AppComponent como el componente raíz
})
export class AppModule { }
