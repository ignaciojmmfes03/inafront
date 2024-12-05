import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  form: FormGroup;

  constructor(private http: HttpClient, private router: Router) {
    this.form = new FormGroup({
      username: new FormControl('', Validators.required),
      passwd: new FormControl('', [Validators.required, Validators.minLength(4)]) // Contraseña mínima de 6 caracteres
    });
  }

  onSubmit() {
    if (this.form.valid) {
      const formData = this.form.value;

      // Realizar la petición POST al servidor Flask para el registro
      this.http.post('http://localhost:5000/login', formData)
        .subscribe(
          (response: any) => {
            console.log('login exitoso', response);
            if (response.message === 'Usuario registrado correctamente') {
              this.router.navigate(['/inazuma']);
            } else {
              alert('Error al loguear: ' + response.message);
            }
          },
          (error) => {
            console.error('Error en el logueo:', error);
            alert('Error al loguearse. Inténtalo de nuevo.');
          }
        );
    } else {
      alert('Formulario inválido. Completa todos los campos correctamente.');
    }
  }
}