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
      username: new FormControl('', Validators.required), // Nombre de usuario
      passwd: new FormControl('', [Validators.required, Validators.minLength(4)]) // Contraseña con validación mínima
    });
  }

  onSubmit() {
    if (this.form.valid) {
      const formData = this.form.value;
      this.http.post('http://localhost:5000/register', formData).subscribe(
        (response: any) => {
          console.log('registro exitoso', response);
          if (response.message === 'registro exitoso') {
            this.router.navigate(['/login']);
          } else {
            alert('Error al registrar: ' + response.message);
          }
        },
        (error) => {
          console.error('Error en el registro:', error);
          alert('Error al loguearse. Inténtalo de nuevo.');
        }
      );
    } else {
      alert('Formulario inválido. Completa todos los campos correctamente.');
    }
  }
}
