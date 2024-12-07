import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpClientTestingModule } from '@angular/common/http/testing'; // Para simular las peticiones HTTP
import { SupertComponent } from './supertecnicas.component';
import { DataService } from '../data.service'; // Si el componente depende de un servicio como DataService
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core'; // Para manejar componentes hijos no relevantes
import { FormsModule } from '@angular/forms'; // Si el componente usa formularios

describe('SupertecnicasComponent', () => {
  let component: SupertComponent;
  let fixture: ComponentFixture<SupertComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [SupertComponent], // Declara el componente que vas a probar
      imports: [
        HttpClientTestingModule, // Para simular las peticiones HTTP
        FormsModule, // Si se usan formularios en el componente
      ],
      providers: [
        DataService, // Proveer el servicio que el componente podría utilizar
      ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA], // Para evitar errores con componentes hijos
    }).compileComponents(); // Compila los componentes antes de ejecutar las pruebas
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SupertComponent); // Crea la instancia del componente
    component = fixture.componentInstance; // Asigna el componente a la variable
    fixture.detectChanges(); // Detecta los cambios iniciales en el componente
  });

  it('should create', () => {
    expect(component).toBeTruthy(); // Verifica que el componente se haya creado correctamente
  });

  it('should have a defined component', () => {
    expect(component).toBeDefined(); // Verifica que la instancia del componente no sea undefined
  });
});
