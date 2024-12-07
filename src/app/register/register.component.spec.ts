import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpClientTestingModule } from '@angular/common/http/testing'; // Para simular las peticiones HTTP
import { RegisterComponent } from './register.component';
import { ReactiveFormsModule } from '@angular/forms'; // Importa ReactiveFormsModule para formularios reactivos

describe('RegisterComponent', () => {
  let component: RegisterComponent;
  let fixture: ComponentFixture<RegisterComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [RegisterComponent],
      imports: [
        HttpClientTestingModule, // Para simular las peticiones HTTP
        ReactiveFormsModule // Importa el módulo para formularios reactivos
      ]
    });
    fixture = TestBed.createComponent(RegisterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges(); // Detecta los cambios
  });

  it('should create', () => {
    expect(component).toBeTruthy(); // Verifica que el componente se haya creado correctamente
  });
});

