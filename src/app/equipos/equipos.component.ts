import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
import { Equipo } from '../models/equipo.model';

@Component({
  selector: 'app-equipos',
  templateUrl: './equipos.component.html',
  styleUrls: ['./equipos.component.css'],
})
export class EquiposComponent implements OnInit {
  equipos: Equipo[] = []; // Lista completa de equipos
  equiposFiltrados: Equipo[] = []; // Lista filtrada que se muestra en la tabla
  terminoBusqueda: string = ''; // Término de búsqueda introducido por el usuario

  constructor(private dataService: DataService) {}

  ngOnInit(): void {
    // Obtiene la lista de equipos del servicio
    this.dataService.getEquipos().subscribe((response) => {
      this.equipos = response.equipos; // Asigna los equipos obtenidos
      this.equiposFiltrados = this.equipos; // Inicializa la lista filtrada
    });
  }

  buscar(): void {
    const termino = this.terminoBusqueda.toLowerCase(); // Convierte a minúsculas para coincidencias insensibles a mayúsculas
    this.equiposFiltrados = this.equipos.filter((equipo) =>
      equipo.nombre.toLowerCase().includes(termino) || // Busca en el nombre
      equipo.region.toLowerCase().includes(termino) || // Busca en la región
      equipo.nivel.toString().includes(termino) // Busca en el nivel
    );
  }
}


