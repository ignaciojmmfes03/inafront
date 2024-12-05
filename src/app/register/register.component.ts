import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent {
  form: FormGroup;

  constructor(private http: HttpClient, private router: Router) {
    this.form = new FormGroup({
      username: new FormControl('', Validators.required),
      email: new FormControl('', [Validators.required, Validators.email]),
      passwd: new FormControl('', [Validators.required, Validators.minLength(4)]) // Contraseña mínima de 6 caracteres
    });
  }

  onSubmit() {
    if (this.form.valid) {
      const formData = this.form.value;

      // Realizar la petición POST al servidor Flask para el registro
      this.http.post('http://localhost:4200/register', formData)
        .subscribe(
          (response: any) => {
            console.log('Registro exitoso', response);
            if (response.message === 'Usuario registrado correctamente') {
              this.router.navigate(['/inazuma']);
            } else {
              alert('Error al registrar: ' + response.message);
            }
          },
          (error) => {
            console.error('Error en el registro:', error);
            alert('Error al registrarse. Inténtalo de nuevo.');
          }
        );
    } else {
      alert('Formulario inválido. Completa todos los campos correctamente.');
    }
  }
}
