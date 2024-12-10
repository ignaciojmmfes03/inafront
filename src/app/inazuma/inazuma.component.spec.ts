import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { InazumaComponent } from './inazuma.component';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { DataService } from '../data.service';
import { FormsModule } from '@angular/forms';

describe('InazumaComponent', () => {
  let component: InazumaComponent;
  let fixture: ComponentFixture<InazumaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [InazumaComponent],
      imports: [
        HttpClientTestingModule,
        FormsModule,
      ],
      providers: [
        DataService,
      ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    }).compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InazumaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('should have a defined component', () => {
    expect(component).toBeDefined();
  });
});
