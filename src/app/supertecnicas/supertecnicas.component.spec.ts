import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SupertecnicasComponent } from './supertecnicas.component';

describe('SupertecnicasComponent', () => {
  let component: SupertecnicasComponent;
  let fixture: ComponentFixture<SupertecnicasComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [SupertecnicasComponent]
    });
    fixture = TestBed.createComponent(SupertecnicasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
