import { TestBed } from '@angular/core/testing';
import { HttpClientTestingModule } from '@angular/common/http/testing'; // Para simular peticiones HTTP
import { DataService } from './data.service'; // Asegúrate de importar el servicio

describe('DataService', () => {
  let service: DataService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule], // Importa el módulo para manejar las peticiones HTTP
      providers: [DataService], // Asegúrate de proporcionar el servicio que vas a probar
    });
    service = TestBed.inject(DataService); // Inyecta el servicio en la prueba
  });

  it('should be created', () => {
    expect(service).toBeTruthy(); // Verifica que el servicio se haya creado correctamente
  });
});

