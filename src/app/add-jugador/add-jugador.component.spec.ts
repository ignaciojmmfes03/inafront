import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddJugadorComponent } from './add-jugador.component';

describe('AddJugadorComponent', () => {
  let component: AddJugadorComponent;
  let fixture: ComponentFixture<AddJugadorComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AddJugadorComponent]
    });
    fixture = TestBed.createComponent(AddJugadorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
