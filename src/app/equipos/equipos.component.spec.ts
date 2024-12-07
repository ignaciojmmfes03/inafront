import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpClientTestingModule } from '@angular/common/http/testing'; // Para pruebas HTTP
import { EquiposComponent } from './equipos.component';
import { DataService } from '../data.service'; // Si tu componente depende de algún servicio, por ejemplo, DataService
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core'; // Para manejar componentes hijos no relevantes
import { FormsModule } from '@angular/forms'; // Si el componente usa formularios

describe('EquiposComponent', () => {
  let component: EquiposComponent;
  let fixture: ComponentFixture<EquiposComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [EquiposComponent], // Declara el componente que vas a probar
      imports: [
        HttpClientTestingModule, // Importa el módulo para simular HTTP requests
        FormsModule, // Si se usan formularios en el componente
      ],
      providers: [
        DataService, // Proveer servicios que el componente pueda usar
      ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA], // Para evitar errores con componentes hijos
    }).compileComponents(); // Compila los componentes antes de ejecutar las pruebas
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EquiposComponent); // Crea la instancia del componente
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
