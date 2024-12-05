import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
import { Jugador } from '../models/jugador.model';

@Component({
  selector: 'app-inazuma',
  templateUrl: './inazuma.component.html',
  styleUrls: ['./inazuma.component.css'],
})
export class InazumaComponent implements OnInit {
  jugadores: Jugador[] = []; // Todos los jugadores
  jugadoresFiltrados: Jugador[] = []; // Jugadores mostrados en el buscador
  terminoBusqueda: string = ''; // Texto del buscador

  constructor(private dataService: DataService) {}

  ngOnInit(): void {
    this.dataService.getJugadores().subscribe((response) => {
      this.jugadores = response.jugadores;
      this.jugadoresFiltrados = [...this.jugadores]; // Inicialmente, todos los jugadores están filtrados
    });
  }

  // Método para filtrar los jugadores por el término de búsqueda
  buscar(): void {
    const termino = this.terminoBusqueda.toLowerCase();

    this.jugadoresFiltrados = this.jugadores.filter((jugador) => {
      const nombreIncluye = jugador.nombre.toLowerCase().includes(termino);
      const afinidadIncluye = jugador.afinidad.toLowerCase().includes(termino);
      const posicionIncluye = jugador.posicion?.toLowerCase().includes(termino) || false; // Manejo de undefined
      const equipoIncluye = jugador.equipo?.toLowerCase().includes(termino) || false; // Manejo de undefined
      const generoIncluye = jugador.genero.toLowerCase().includes(termino);
      const supertIncluye = jugador.supert?.some((tecnica: string) =>
        tecnica.toLowerCase().includes(termino)
      ) || false; // Verifica si alguna supertécnica coincide

      return (
        nombreIncluye ||
        afinidadIncluye ||
        posicionIncluye ||
        equipoIncluye ||
        generoIncluye ||
        supertIncluye
      );
    });
  }

}
