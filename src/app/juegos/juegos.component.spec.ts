import { TestBed } from '@angular/core/testing';
import { HttpClientTestingModule } from '@angular/common/http/testing'; // Importa el módulo de pruebas HTTP
import { DataService } from '../data.service'; // Si depende de este servicio

describe('JugadoresService', () => {
  let service: DataService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule], // Importa HttpClientTestingModule para los tests
      providers: [DataService], // Asegúrate de proveer las dependencias del servicio
    });
    service = TestBed.inject(DataService); // Inyecta el servicio a probar
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
