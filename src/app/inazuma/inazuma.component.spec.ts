import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InazumaComponent } from './inazuma.component';

describe('InazumaComponent', () => {
  let component: InazumaComponent;
  let fixture: ComponentFixture<InazumaComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [InazumaComponent]
    });
    fixture = TestBed.createComponent(InazumaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
