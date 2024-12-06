import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
import { Juego } from '../models/juego.model';

@Component({
  selector: 'app-juegos',
  templateUrl: './juegos.component.html',
  styleUrls: ['./juegos.component.css'],
})
export class JuegosComponent implements OnInit {
  juegos: Juego[] = []; // Todos los juegos cargados
  juegosFiltrados: Juego[] = []; // Juegos filtrados
  terminoBusqueda: string = ''; // Término de búsqueda

  constructor(private dataService: DataService) {}

  ngOnInit(): void {
    // Carga los juegos al inicializar el componente
    this.dataService.getJuegos().subscribe((response) => {
      this.juegos = response.juegos; // Asigna los datos de la API a la variable `juegos`
      this.juegosFiltrados = this.juegos; // Inicialmente muestra todos los juegos
    });
  }

  buscar(): void {
    const termino = this.terminoBusqueda.toLowerCase(); // Convierte el término de búsqueda a minúsculas
    this.juegosFiltrados = this.juegos.filter((juego) =>
      juego.nombre.toLowerCase().includes(termino) ||
      juego.consolas.toLowerCase().includes(termino) ||
      juego.sinopsis.toLowerCase().includes(termino)
    );
  }
}
