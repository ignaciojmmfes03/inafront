import { Supertecnica } from "./supertecnica.model";

export interface Jugador {
e: any;
equipo_nombre: string;
jugador_nombre: any;
supert: any;
id_jugador: number;
nombre: string;
posicion: string;
afinidad: string;
obtencion: string;
equipo: string; // Referencia al id de la tabla 'equipos'
genero: string;
imagen_url: string;
supertecnicas?: Supertecnica[]; // Relación con supertecnicas
}



