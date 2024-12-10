import { Component } from '@angular/core';
import { NgForm } from '@angular/forms';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-add-jugador',
  templateUrl: './add-jugador.component.html',
  styleUrls: ['./add-jugador.component.css']
})
export class AddJugadorComponent {
  successMessage: string = '';
  errorMessage: string = '';

  constructor(private http: HttpClient) {}

  // Método que se ejecuta al enviar el formulario
  onSubmit(form: NgForm) {
    if (form.invalid) {
      return; // No hacer nada si el formulario es inválido
    }

    const jugadorData = {
      nombre: form.value.nombre,
      posicion: form.value.posicion,
      afinidad: form.value.afinidad,
      obtencion: form.value.obtencion,
      genero: form.value.genero,
      imagen_url: form.value.imagen_url
    };

    console.log('Jugador a agregar:', jugadorData); // Verificación en consola

    // Enviar los datos al servidor
    this.http.post('http://localhost:5000/jugadores', jugadorData, {
      headers: { 'Content-Type': 'application/json' }
    }).subscribe(
      response => {
        console.log('Jugador agregado:', response);
        this.successMessage = 'Jugador agregado correctamente!';
        this.errorMessage = '';
        form.reset();
      },
      error => {
        console.error('Error al agregar el jugador:', error);
        this.errorMessage = 'Error al agregar el jugador. Intenta nuevamente.';
        this.successMessage = '';
      }
    );
  }

}
