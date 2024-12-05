import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
import { Equipo } from '../models/equipo.model';

@Component({
  selector: 'app-equipos',
  templateUrl: './equipos.component.html',
  styleUrls: ['./equipos.component.css'],
})
export class EquiposComponent implements OnInit {
  equipos: Equipo[] = [];

  constructor(private dataService: DataService) {}

  ngOnInit(): void {
    this.dataService.getEquipos().subscribe((response) => {
      this.equipos = response.equipos; // Asigna los datos de la API a la variable `equipos`
    });
  }
}

