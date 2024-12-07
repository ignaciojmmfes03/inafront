import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DataService {
  getData(getData: any) {
    throw new Error('Method not implemented.');
  }
  private apiurl = 'http://localhost:5000';

  constructor(private http: HttpClient) {}

  // Obtener jugadores
  getJugadores(): Observable<any> {
    return this.http.get<any>(`${this.apiurl}/jugadores`);
  }

  // Obtener supertecnicas
  getSupertecnicas(): Observable<any> {
    return this.http.get<any>(`${this.apiurl}/supertecnicas`);
  }

  // Obtener equipos
  getEquipos(): Observable<any> {
    return this.http.get<any>(`${this.apiurl}/equipos`);
  }

  // Obtener juegos
  getJuegos(): Observable<any> {
    return this.http.get<any>(`${this.apiurl}/juegos`);
  }

  // Obtener usuarios
  getUsuarios(): Observable<any> {
    return this.http.get<any>(`${this.apiurl}/usuarios`);
  }
}
