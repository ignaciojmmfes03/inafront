import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Jugador } from '../models/jugador.model';

@Component({
  selector: 'app-inazuma',
  templateUrl: './inazuma.component.html',
  styleUrls: ['./inazuma.component.css'],
})
export class InazumaComponent implements OnInit {
  jugadores: Jugador[] = [];
  jugadoresFiltrados: Jugador[] = [];
  terminoBusqueda: string = '';
  jugadorService: any;

  constructor(private http: HttpClient) {}

  ngOnInit(): void {
    this.obtenerJugadores();
  }

  obtenerJugadores(): void {
    this.http.get<{ jugadores: Jugador[] }>('http://localhost:5000/jugadores').subscribe((response) => {
      console.log('Jugadores obtenidos:', response.jugadores);  // Verifica la respuesta
      this.jugadores = response.jugadores;
      this.jugadoresFiltrados = [...this.jugadores];
    });
  }

  eliminar_jugador(id_jugador: number): void {
    if (confirm('¿Estás seguro de que deseas eliminar este jugador?')) {
      this.jugadorService.eliminar_jugador(id_jugador).subscribe({
        next: () => {
          alert('Jugador eliminado exitosamente');
          this.obtenerJugadores(); // Vuelve a cargar la lista desde el servidor
        },
        error: (err: any) => {
          console.error('Error al eliminar el jugador:', err);
          alert('No se pudo eliminar el jugador. Por favor, inténtalo de nuevo.');
        }
      });
    }
  }




  // Método para filtrar jugadores según el texto de búsqueda
  buscar(): void {
    const termino = this.terminoBusqueda.toLowerCase();

    this.jugadoresFiltrados = this.jugadores.filter((jugador) => {
      const nombreIncluye = jugador.nombre.toLowerCase().includes(termino);
      const afinidadIncluye = jugador.afinidad.toLowerCase().includes(termino);
      const posicionIncluye = jugador.posicion?.toLowerCase().includes(termino) || false;
      const equipoIncluye = jugador.equipo?.toLowerCase().includes(termino) || false;
      const generoIncluye = jugador.genero.toLowerCase().includes(termino);

      return (
        nombreIncluye || afinidadIncluye || posicionIncluye || equipoIncluye || generoIncluye
      );
    });
  }
}
