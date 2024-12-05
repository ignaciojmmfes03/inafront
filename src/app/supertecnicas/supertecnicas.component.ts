import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service'; // Servicio para manejar la conexión con la base de datos

@Component({
  selector: 'app-supert',
  templateUrl: './supertecnicas.component.html',
  styleUrls: ['./supertecnicas.component.css'],
})
export class SupertComponent implements OnInit {
  supertecnicas: any[] = []; // Array para almacenar las supertécnicas cargadas desde la base de datos

  constructor(private dataService: DataService) {}

  ngOnInit(): void {
    this.cargarSupertecnicas(); // Cargar las supertécnicas al inicializar el componente
  }

  // Método para cargar las supertécnicas desde la base de datos
  private cargarSupertecnicas(): void {
    this.dataService.getSupertecnicas().subscribe(
      (response: any) => {
        console.log('Supertécnicas obtenidas:', response);
        this.supertecnicas = response.supertecnicas || []; // Asignar los datos obtenidos
      },
      (error: any) => {
        console.error('Error al cargar las supertécnicas:', error);
      }
    );
  }
}

