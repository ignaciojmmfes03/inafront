import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
import { Juego } from '../models/juego.model';

@Component({
  selector: 'app-juegos',
  templateUrl: './juegos.component.html',
  styleUrls: ['./juegos.component.css'],
})
export class JuegosComponent implements OnInit {
  juegos: Juego[] = [];

  constructor(private dataService: DataService) {}

  ngOnInit(): void {
    this.dataService.getJuegos().subscribe((response) => {
      this.juegos = response.juegos; // Asigna los datos de la API a la variable `juegos`
    });
  }
}

