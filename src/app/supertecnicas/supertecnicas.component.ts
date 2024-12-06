import { Supertecnica } from './../models/supertecnica.model';
import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service'; // Servicio para manejar la conexión con la base de datos

@Component({
selector: 'app-supert',
templateUrl: './supertecnicas.component.html',
styleUrls: ['./supertecnicas.component.css'],
})
export class SupertComponent implements OnInit {
supertecnicas: any[] = []; // Array para almacenar las supertécnicas cargadas desde la base de datos
supertecnicasFiltradas: any[] = [];
terminoBusqueda: any;
  jugadoresFiltrados: any;

constructor(private dataService: DataService) {}

ngOnInit(): void {
  this.cargarSupertecnicas(); // Cargar las supertécnicas al inicializar el componente
}

// Método para cargar las supertécnicas desde la base de datos
private cargarSupertecnicas(): void {
  this.dataService.getSupertecnicas().subscribe(
    (response: any) => {
      console.log('Supertécnicas obtenidas:', response);
      this.supertecnicas = response.supertecnicas || [];
      this.supertecnicasFiltradas = [...this.supertecnicas]; // Copiar todas inicialmente
    },
    (error: any) => {
      console.error('Error al cargar las supertécnicas:', error);
    }
  );
}
buscar(): void {
  const termino = this.terminoBusqueda.toLowerCase();

  this.supertecnicasFiltradas = this.supertecnicas.filter((tecnica) => {
    const nombreIncluye = tecnica.nombre.toLowerCase().includes(termino);
    const afinidadIncluye = tecnica.afinidad.toLowerCase().includes(termino);
    const tipoIncluye = tecnica.tipo.toLowerCase().includes(termino);
    const puntosIncluye = tecnica.pts.toString().includes(termino); // Convertir a string para comparar
    const obtencionIncluye = tecnica.obtencion_juego.toLowerCase().includes(termino);

    return (
      nombreIncluye ||
      afinidadIncluye ||
      tipoIncluye ||
      puntosIncluye ||
      obtencionIncluye
    );
  });
}

}
