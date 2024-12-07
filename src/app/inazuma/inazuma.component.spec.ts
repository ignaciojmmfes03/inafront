import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpClientTestingModule } from '@angular/common/http/testing'; // Para simular peticiones HTTP
import { InazumaComponent } from './inazuma.component';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core'; // Opcional: si hay componentes hijos no relevantes
import { DataService } from '../data.service'; // Servicio que podría estar siendo usado en el componente
import { FormsModule } from '@angular/forms'; // Si el componente usa formularios

describe('InazumaComponent', () => {
  let component: InazumaComponent;
  let fixture: ComponentFixture<InazumaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [InazumaComponent], // Declara el componente que se probará
      imports: [
        HttpClientTestingModule, // Importa el módulo para simular peticiones HTTP
        FormsModule, // Si usa formularios en su HTML
      ],
      providers: [
        DataService, // Proveer cualquier servicio que el componente use
      ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA], // Para evitar errores con componentes hijos
    }).compileComponents(); // Asegúrate de compilar los componentes antes de ejecutar las pruebas
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InazumaComponent); // Crea el componente de prueba
    component = fixture.componentInstance; // Instancia el componente
    fixture.detectChanges(); // Detecta los cambios iniciales
  });

  it('should create', () => {
    expect(component).toBeTruthy(); // Verifica que el componente se haya creado correctamente
  });

  it('should have a defined component', () => {
    expect(component).toBeDefined(); // Verifica que la instancia del componente no sea null
  });
});
