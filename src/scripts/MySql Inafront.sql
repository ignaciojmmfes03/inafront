CREATE DATABASE inazuma_eleven;

USE inazuma_eleven;

CREATE TABLE jugadores (
	id_jugador int auto_increment PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    posicion VARCHAR(255),
    afinidad VARCHAR(255),
    obtencion TEXT,
    equipo int  REFERENCES equipos(id_equipo),
    genero VARCHAR(255),
    imagen_url TEXT
);

CREATE TABLE st_jugadores (
	id_st int REFERENCES supertecnicas(id_st),
    id_jugador int REFERENCES jugadores(id_jugador),
    primary key(id_st, id_jugador)
);

CREATE TABLE supertecnicas (
	id_st int auto_increment primary key,
    nombre VARCHAR(255),
    afinidad VARCHAR(255),
    pts INT,
    tipo VARCHAR(255),
    obtencion_juego TEXT
);

CREATE TABLE equipos (
	id_equipo int auto_increment PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    region TEXT,
    nivel INT,
    recompensas_posibles TEXT,
    modo_de_juego TEXT
);

CREATE TABLE juegos(
	id_juego int auto_increment PRIMARY KEY,
	nombre VARCHAR(255),
	publicacion date,
	consolas text,
	sinopsis text
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    passwd VARCHAR(255) NOT NULL
);

/*consultas*/

SELECT * FROM inazuma_eleven.supertecnicas;

delete from inazuma_eleven.usuarios where id = 1;

select * from inazuma_eleven.equipos;

select * from inazuma_eleven.jugadores;


select * from inazuma_eleven.juegos;

select * from inazuma_eleven.usuarios;


/*inserts equipos*/

insert into inazuma_eleven.equipos(nombre, region ,nivel, recompensas_posibles, modo_de_juego) values ('Los Devoratofu', 'Tokio', 12, 'Bolas de Arroz, Ficha azul', 'Mete el primer gol');
insert into inazuma_eleven.equipos(nombre, region ,nivel, recompensas_posibles, modo_de_juego) values ('Hiro Squad', 'Fukuoka', 39, 'Leche, Ficha amarilla', 'Róbale el balón al equipo rival');
insert into inazuma_eleven.equipos(nombre, region ,nivel, recompensas_posibles, modo_de_juego) values ('Swifties', 'Tokio' , 34 , 'Barrita, Ficha roja', 'Marca dos goles al equipo rival');
insert into inazuma_eleven.equipos(nombre, region ,nivel, recompensas_posibles, modo_de_juego) values ('Los Rascabalones', 'Osaka' , 25 , 'Agua medicinal, Pinchito supremo', 'Mete el primer gol');
insert into inazuma_eleven.equipos(nombre, region ,nivel, recompensas_posibles, modo_de_juego) values ('Amos de los Elementos', 'Tokio' , 26 , 'Bola de Arroz, Ficha azul, Agua Mineral', 'Róbale el balón al equipo rival');
insert into inazuma_eleven.equipos(nombre, region ,nivel, recompensas_posibles, modo_de_juego) values ('Los Rockandgoles', 'Kioto' ,16, 'Ficha amarilla, Ficha azul, Ficha roja', 'Que no te quiten el balón');
insert into inazuma_eleven.equipos(nombre, region ,nivel, recompensas_posibles, modo_de_juego) values ('Banda del Rey Mono', 'Nara', 14, 'Galletas de Ciervo, Agua Mineral', 'Mete el primer gol');
insert into inazuma_eleven.equipos(nombre, region ,nivel, recompensas_posibles, modo_de_juego) values ('Enemigos del peine', 'Ehime', 30, 'Agua Mineral, Pinchito supremo, Ficha amarilla', 'Róbale el balón al equipo rival');
insert into inazuma_eleven.equipos(nombre, region ,nivel, recompensas_posibles, modo_de_juego) values ('Los Gacelas', 'Nara', 15, 'Ficha amarilla, Bolas de Arroz, Barrita', 'Que no te quiten el balón');
insert into inazuma_eleven.equipos(nombre, region ,nivel, recompensas_posibles, modo_de_juego) values ('Plan Maestro', 'Okinawa', 45, 'Bolas de Arroz, Agua Mineral, Chocolate', 'Róbale el balón al equipo rival');
insert into inazuma_eleven.equipos(nombre, region ,nivel, recompensas_posibles, modo_de_juego) values ('Gemas Valiosas', 'Fuji', 50, 'Ficha amarilla, Pinchito supremo, Agua Mineral', 'Marca tres goles al equipo rival');
insert into inazuma_eleven.equipos(nombre, region ,nivel, recompensas_posibles, modo_de_juego) values ('Comiendo Perdices', 'Osaka', 32, 'Bolas de Arroz, Barrita, Fichas amarillas', 'Que no te quiten el balón');


/*inserts supertécnicas*/

insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Remate dragón', 'Bosque', 'Comprar en tienda', 33, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Tornado de fuego', 'Fuego', 'Comprar en tienda', 33, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Cañón de meteoritos', 'Fuego', 'Comprar en tienda', 50, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Espejismo de balón', 'Bosque', 'Comprar en tienda', 23, 'Regate');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Gravitación', 'Tierra', 'Exclusiva en jugadores que la aprendan', 17, 'Defensa');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Olor embriagador', 'Bosque', 'Comprar en tienda', 36, 'Defensa');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Lecho de Rosas', 'Bosque', 'Comprar en tienda', 35, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('La Tierra', 'Tierra', 'Exclusiva en jugadores que la aprendan', 70, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Rapidez+', '--', 'En cofres', 0, 'Talento');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Zigzag chispeante', 'Aire', 'En tiendas', 27, 'Regate');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Súper relámpago', 'Aire', 'En tiendas', 51, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Gran Lobo', 'Bosque', 'Cadena de partidos', 67, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Ataque cóndor', 'Aire', 'En tiendas', 24, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Paisaje helado', 'Aire', 'En tiendas', 25, 'Defensa');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Tornado inverso', 'Aire', 'En tiendas', 35, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Balón iceberg', 'Aire', 'Premio en torneo', 33, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Cabezazo megatón', 'Tierra', 'Historia', 51, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Ultratécnica', '--', 'En tiendas', 0, 'Talento');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Superelástico', 'Tierra', 'En tiendas', 56, 'Regate');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Sorteo de balón', 'Tierra', 'En tiendas', 36, 'Regate');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Despeje de fuego', 'Fuego', 'En tiendas', 17, 'Portero');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Barrido defensivo', 'Bosque', 'En tiendas', 10, 'Defensa');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Gravedad', 'Bosque', 'En tiendas', 17, 'Defensa');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Bloqueo doble', 'Aire', 'En tiendas', 47, 'Portero');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Balón rodante', 'Bosque', 'En tiendas', 33, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Armadillo circense', 'Fuego', 'En tiendas', 36, 'Regate');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Tornado venenoso', 'Bosque', 'En tiendas', 36, 'Regate');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Patín aéreo', 'Aire', 'En tiendas', 42, 'Regate');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Carga elemental', '--', 'Cadena de partidos', 0, 'Talento');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Lanzallamas', 'Fuego', 'En tiendas', 42, 'Portero');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Cortafuegos', 'Fuego', 'En tiendas', 22, 'Defensa');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Combustión', 'Fuego', 'En tiendas', 22, 'Portero');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Giro bobina', 'Aire', 'En tiendas', 15, 'Defensa');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Jaula de piedra', 'Tierra', 'En tiendas', 42, 'Defensa');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Cometa', 'Fuego', 'En tiendas', 47, 'Defensa');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Psicorremate', 'Bosque', 'En tiendas', 20, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Bola de fango', 'Tierra', 'En tiendas', 24, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Fénix oscuro', 'Bosque', 'En tiendas', 67, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Ignición', 'Tierra', 'Cofre modo historia', 39, 'Regate');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Remate combinado', 'Fuego', 'En tiendas', 44, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Paipay gigante', 'Aire', 'En tiendas', 36, 'Regate');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Dúo magma', 'Bosque', 'En tiendas', 44, 'Defensa');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Equilibrismo', 'Aire', 'En tiendas', 15, 'Regate');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Hojarasca', 'Aire', 'En tiendas', 27, 'Portero');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Niebla venenosa', 'Aire', 'En tiendas', 17, 'Defensa');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Espejismo', 'Bosque', 'En tiendas', 25, 'Regate');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Bombazo', 'Fuego', 'En tiendas', 30, 'Defensa');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Lluvia de meteoros', 'Fuego', 'Exclusiva en jugadores que la aprendan', 14, 'Regate');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Mejor garantía', '--', 'Cadena de partidos', 0, 'Talento');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Corte volcánico', 'Fuego', 'En tiendas', 36, 'Defensa');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Llamarada atómica', 'Fuego', 'Historia', 33, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Neo tiro galáctico', 'Fuego', 'Exclusiva en jugadores que la aprendan', 70, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Remate serpiente', 'Tierra', 'En tiendas', 17, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Regate topo', 'Tierra', 'En tiendas', 30, 'Regate');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Disparo cósmico', 'Bosque', 'En tiendas', 28, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Engaño yoyó', 'Bosque', 'En tiendas', 33, 'Defensa');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Ciclón doble', 'Aire', 'En tiendas', 42, 'Defensa');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Entrada tormenta', 'Aire', 'En tiendas', 37, 'Regate');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Danza del viento', 'Aire', 'En tiendas', 57, 'Regate');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Golpes de luz', 'Tierra', 'En tiendas', 42, 'Portero');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Espada de Odín', 'Tierra', 'Historia', 55, 'Tiro');
insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('Muralla infinita', 'Tierra', 'En tiendas', 57, 'Portero');

/* insert into inazuma_eleven.supertecnicas(nombre, afinidad, obtencion_juego, pts, tipo) values('');*/


-- insertar jugador
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, genero, imagen_url)
values ('Alexis Mach', 'delantero', 'Fire', 'Federación de Fútbol, Tokio Norte', (select id_equipo from inazuma_eleven.equipos where nombre = 'Los Devoratofu' LIMIT 1), '♂', 'https://pbs.twimg.com/profile_images/1826519308572196865/vCwC-bhP_400x400.jpg');
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, genero, imagen_url)
values ('Hiroto Carson', 'delantero', 'Fire', 'Instituto Raimon', 
        (select id_equipo from inazuma_eleven.equipos where nombre = 'Hiro Squad' LIMIT 1), '♂', 
        'https://static.wikia.nocookie.net/inazuma-eleven/images/b/b2/%28TG%29_Narukami_Kenya_versus_sprite_%28S%29_%282%29.png/revision/latest?cb=20230803154108');


-- 1
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, genero, imagen_url)
values ('Anna Swift', 'delantero', 'Fire', 'Instituto Raimon', 
        (select id_equipo from inazuma_eleven.equipos where nombre = 'Swifties' LIMIT 1), '♀', 'url');

-- 2
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, genero, imagen_url)
values ('Amundsen Scott Amundsen', 'delantero', 'Aire', 'Pachanga en el Centro de Liocott', 
        (select id_equipo from inazuma_eleven.equipos where nombre = 'Los Rockandgoles' LIMIT 1), '♂', 'url');

-- 3
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, genero, imagen_url)
values ('Bolt Leighton Bolt', 'defensa', 'Aire', 'Contactos', 
        (select id_equipo from inazuma_eleven.equipos where nombre = 'Amos de los Elementos' LIMIT 1), '♂', 'url');

-- 4
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, genero, imagen_url)
values ('Ee Earl Bird', 'portero', 'Bosque', 'Pachanga en el Centro de Liocott', 
        (select id_equipo from inazuma_eleven.equipos where nombre = 'Los Rockandgoles' LIMIT 1), '♂', 'url');

-- 5
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, genero, imagen_url)
values ('Fanfair Pomponius Fanfair', 'centrocampista', 'Bosque', 'Bolas con ficha azul en el Barrio de tiendas', 
        (select id_equipo from inazuma_eleven.equipos where nombre = 'Los Gacelas' LIMIT 1), '♂', 'url');

-- 6
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, genero, imagen_url)
values ('Firefoot Blazer Firefoot', 'portero', 'Fuego', 'Bolas con fichas rojas', 
        (select id_equipo from inazuma_eleven.equipos where nombre = 'Amos de los Elementos' LIMIT 1), '♂', 'url');

-- 7
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, genero, imagen_url)
values ('Gleeson Dextra Gleeson', 'delantera', 'Bosque', 'Bolas con ficha amarilla de la Zona de tiendas del Área japonesa', 
        (select id_equipo from inazuma_eleven.equipos where nombre = 'Los Devoratofu' LIMIT 1), '♀', 'url');

-- 8
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, genero, imagen_url)
values ('Jarret May Jarret', 'delantera', 'Bosque', 'Bolas con la ficha azul en el Centro de Liocott', 
        (select id_equipo from inazuma_eleven.equipos where nombre = 'Los Rockandgoles' LIMIT 1), '♀', 'url');

-- 9
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, genero, imagen_url)
values ('Mann T. T. Mann', 'centrocampista', 'Fuego', 'Bolas con ficha roja de la Zona de tiendas del Área japonesa', 
        (select id_equipo from inazuma_eleven.equipos where nombre = 'Los Devoratofu' LIMIT 1), '♂', 'url');

-- 10
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, genero, imagen_url)
values ('Pentam Ian Bick', 'defensa', 'Aire', 'Pachanga', 
        (select id_equipo from inazuma_eleven.equipos where nombre = 'Enemigos del peine' LIMIT 1), '♂', 'url');

-- 11
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, genero, imagen_url)
values ('Slinka Chauncey Slinka', 'centrocampista', 'Bosque', 'Contactos', 
        (select id_equipo from inazuma_eleven.equipos where nombre = 'Amos de los Elementos' LIMIT 1), '♀', 'url');

-- 12
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, genero, imagen_url)
values ('Steady Eddy Steady', 'delantero', 'Montaña', 'Contactos', 
        (select id_equipo from inazuma_eleven.equipos where nombre = 'Banda del Rey Mono' LIMIT 1), '♂', 'url');

-- 13
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, genero, imagen_url)
values ('Vinyl Gram Vineela', 'centrocampista', 'Bosque', 'Pachanga', 
        (select id_equipo from inazuma_eleven.equipos where nombre = 'Los Devoratofu' LIMIT 1), '♂', 'url');

-- 14
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, genero, imagen_url)
values ('Weath Gustav Wheathervane', 'defensa', 'Aire', 'Bolas con fichas azules del Área de Costail', 
        (select id_equipo from inazuma_eleven.equipos where nombre = 'Amos de los Elementos' LIMIT 1), '♂', 'url');

-- 15
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, genero, imagen_url)
values ('Windrush Zip Windrush', 'delantero', 'Aire', 'Contactos', 
        (select id_equipo from inazuma_eleven.equipos where nombre = 'Los Rascabalones' LIMIT 1), '♂', 'url');
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, imagen_url)
values ('', '', '', '', (select id_equipo from inazuma_eleven.equipos where nombre = ''), 'url');
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, imagen_url)
values ('', '', '', '', (select id_equipo from inazuma_eleven.equipos where nombre = ''), 'url');
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, imagen_url)
values ('', '', '', '', (select id_equipo from inazuma_eleven.equipos where nombre = ''), 'url');
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, imagen_url)
values ('', '', '', '', (select id_equipo from inazuma_eleven.equipos where nombre = ''), 'url');
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, imagen_url)
values ('', '', '', '', (select id_equipo from inazuma_eleven.equipos where nombre = ''), 'url');
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, imagen_url)
values ('', '', '', '', (select id_equipo from inazuma_eleven.equipos where nombre = ''), 'url');
insert into inazuma_eleven.jugadores(nombre, posicion, afinidad, obtencion, equipo, imagen_url)
values ('', '', '', '', (select id_equipo from inazuma_eleven.equipos where nombre = ''), 'url');


/*inserts juegos*/

INSERT INTO inazuma_eleven.juegos (nombre, publicacion, consolas, sinopsis)
VALUES ('Inazuma Eleven', '2008-06-15', 'Nintendo DS', 
'Inazuma Eleven sigue a Mark Evans, portero y capitán del equipo de fútbol de la escuela Raimon. 
Aunque el equipo está a punto de disolverse, Mark reúne a nuevos jugadores para participar en el Torneo de Fútbol Frontier. 
A lo largo del juego, el equipo enfrenta a rivales poderosos mientras utiliza técnicas especiales de fútbol. 
La jugabilidad combina estrategia y gestión de equipo con partidos llenos de acción, donde los personajes 
pueden realizar movimientos impresionantes para ganar los encuentros.');

INSERT INTO inazuma_eleven.juegos (nombre, publicacion, consolas, sinopsis)
VALUES ('Inazuma Eleven 2 Tormenta de Fuego', '2009-10-01', 'Nintendo DS', 
'Inazuma Eleven 2 continúa la historia de Mark Evans y el equipo Raimon después de ganar el Torneo de Fútbol Frontier. 
En esta entrega, la Tierra es atacada por un misterioso grupo de alienígenas llamado Academia Alius, 
quienes utilizan su superioridad en el fútbol para destruir escuelas. 
Mark y su equipo deben viajar por Japón, enfrentando a los equipos alienígenas y descubriendo el origen de esta amenaza. 
El juego introduce nuevas técnicas especiales y mejoras en la jugabilidad, 
mientras los personajes desarrollan sus habilidades para salvar el mundo a través del fútbol.');

INSERT INTO inazuma_eleven.juegos(nombre, publicacion, consolas, sinopsis)
VALUES ('Inazuma Eleven 2 Ventisca Eterna', '2009-10-01', 'Nintendo DS', 
'Inazuma Eleven 2 continúa la historia de Mark Evans y el equipo Raimon después de 
ganar el Torneo de Fútbol Frontier. En esta entrega, la Tierra es atacada por un misterioso 
grupo de alienígenas llamado Academia Alius, quienes utilizan su superioridad en el fútbol para destruir escuelas. 
Mark y su equipo deben viajar por Japón, enfrentando a los equipos alienígenas y descubriendo el origen de esta amenaza. 
El juego introduce nuevas técnicas especiales y mejoras en la jugabilidad, 
mientras los personajes desarrollan sus habilidades para salvar el mundo a través del fútbol.');

INSERT INTO inazuma_eleven.juegos(nombre, publicacion, consolas, sinopsis)
VALUES ('Inazuma Eleven 3 Fuego Explosivo', '2010-07-01', 'Nintendo DS, Nintendo 3DS', 
'Después de que el Raimon derrotara a la Academia Alius, se anuncia un torneo 
llamado Fútbol Frontier Internacional en el que jugarán a nivel mundial contra varios equipos de otros países. 
La mayoría de los chicos del Raimon son seleccionados junto con varios estudiantes de otras escuelas, 
más dos nuevos amigos, un nuevo entrenador y una nueva gerente que representarán a Japón bajo el nombre de Inazuma Japón. 
Durante la historia, los chicos enfrentarán varias situaciones y dificultades pero su optimismo es enorme 
y no se dejan caer ante nada. Mark y los demás deberán ganar el torneo para convertirse en el mejor equipo a nivel mundial.');

INSERT INTO inazuma_eleven.juegos(nombre, publicacion, consolas, sinopsis)
VALUES ('Inazuma Eleven 3 Rayo Celeste', '2010-07-01', 'Nintendo DS, Nintendo 3DS', 
'Después de que el Raimon derrotara a la Academia Alius, 
se anuncia un torneo llamado Fútbol Frontier Internacional en el que 
jugarán a nivel mundial contra varios equipos de otros países. 
La mayoría de los chicos del Raimon son seleccionados junto con varios estudiantes de otras escuelas, 
más dos nuevos amigos, un nuevo entrenador y una nueva gerente que representarán a Japón bajo el nombre de Inazuma Japón. 
Durante la historia, los chicos enfrentarán varias situaciones y dificultades 
pero su optimismo es enorme y no se dejan caer ante nada. Mark y los demás deberán ganar 
el torneo para convertirse en el mejor equipo a nivel mundial.');

INSERT INTO inazuma_eleven.juegos(nombre, publicacion, consolas, sinopsis)
VALUES ('Inazuma Eleven 3 ¡La Amenaza del Ogro!', '2010-12-16', 'Nintendo DS, Nintendo 3DS', 
'Después de que el Raimon derrotara a la Academia Alius, 
se anuncia un torneo llamado Fútbol Frontier Internacional en el que 
jugarán a nivel mundial contra varios equipos de otros países. 
La mayoría de los chicos del Raimon son seleccionados junto con varios estudiantes de otras escuelas, 
más dos nuevos amigos, un nuevo entrenador y una nueva gerente que representarán a Japón bajo el nombre de Inazuma Japón. 
Durante la historia, los chicos enfrentarán varias situaciones y dificultades 
pero su optimismo es enorme y no se dejan caer ante nada. Mark y los demás deberán ganar 
el torneo para convertirse en el mejor equipo a nivel mundial.');


INSERT INTO inazuma_eleven.juegos(nombre, publicacion, consolas, sinopsis)
VALUES ('Inazuma Eleven GO Luz', '2012-12-13', 'Nintendo 3DS', 
'La historia de este juego se sitúa 10 años después de que Inazuma Japón ganara el torneo Fútbol Frontier Internacional. 
En esta ocasión, la historia se centrará en un nuevo protagonista llamado Arion Sherwind, 
quien llega de Okinawa para unirse al Club de fútbol del Raimon. Sin embargo, 
se entera que el fútbol está siendo controlado por una organización llamada el 
Sector Quinto liderado por Alex Zabel quien manda a un equipo llamado los Caballeros 
Templarios capitaneado por Victor Blade, con el fin de acabar con el Club de fútbol de una vez por todas.');

INSERT INTO inazuma_eleven.juegos(nombre, publicacion, consolas, sinopsis)
VALUES ('Inazuma Eleven GO Sombra', '2012-12-13', 'Nintendo 3DS', 
'La historia de este juego se sitúa 10 años después de que Inazuma Japón ganara el torneo Fútbol Frontier Internacional. 
En esta ocasión, la historia se centrará en un nuevo protagonista llamado Arion Sherwind, 
quien llega de Okinawa para unirse al Club de fútbol del Raimon. Sin embargo, 
se entera que el fútbol está siendo controlado por una organización llamada el 
Sector Quinto liderado por Alex Zabel quien manda a un equipo llamado los Caballeros 
Templarios capitaneado por Victor Blade, con el fin de acabar con el Club de fútbol de una vez por todas.');

INSERT INTO inazuma_eleven.juegos(nombre, publicacion, consolas, sinopsis)
VALUES ('Inazuma Eleven GO Chrono Stones Llamarada', '2012-12-13', 'Nintendo 3DS', 
'La historia comienza 3 meses después del Camino Imperial. Arion vuelve al Raimon, pero se da cuenta de que todo ha cambiado. '
'Los miembros del club ya no son jugadores de fútbol, de hecho, no hay ningún club de fútbol en la escuela. '
'JP está en otro club diferente a Arion. ¿Es una broma? Eso es lo que Arion supone. '
'Entonces aparece Fei Rune, un chico llegado del futuro, acompañado de un robot en forma de oso llamado Clark von Wunderbar, y le explican todo lo sucedido. '
'En el futuro, hay una organización llamada El Dorado, que desea destruir el fútbol a toda costa. Le asignan ésta misión a Alfa, y su equipo, Protocolo Omega. '
'Después, Wonderbot y Fei le muestran la Caravana Inazuma MT con la que deberán viajar por el tiempo para recuperar el fútbol. '
'Eventualmente, el club de fútbol del Raimon regresa, Mark es secuestrado y visitan a David Evans años atrás. Ahora, con la ayuda de David, '
'los chicos deberán viajar a varias épocas y reunir las auras de personajes históricos para formar el equipo definitivo. '
'Durante la aventura, se les unirán nuevos y viejos amigos quienes ayudarán a derrotar a la amenaza.');

INSERT INTO inazuma_eleven.juegos(nombre, publicacion, consolas, sinopsis)
VALUES ('Inazuma Eleven GO Chrono Stones Trueno', '2012-12-13', 'Nintendo 3DS', 
'La historia comienza 3 meses después del Camino Imperial. Arion vuelve al Raimon, pero se da cuenta de que todo ha cambiado. '
'Los miembros del club ya no son jugadores de fútbol, de hecho, no hay ningún club de fútbol en la escuela. '
'JP está en otro club diferente a Arion. ¿Es una broma? Eso es lo que Arion supone. '
'Entonces aparece Fei Rune, un chico llegado del futuro, acompañado de un robot en forma de oso llamado Clark von Wunderbar, y le explican todo lo sucedido. '
'En el futuro, hay una organización llamada El Dorado, que desea destruir el fútbol a toda costa. Le asignan ésta misión a Alfa, y su equipo, Protocolo Omega. '
'Después, Wonderbot y Fei le muestran la Caravana Inazuma MT con la que deberán viajar por el tiempo para recuperar el fútbol. '
'Eventualmente, el club de fútbol del Raimon regresa, Mark es secuestrado y visitan a David Evans años atrás. Ahora, con la ayuda de David, '
'los chicos deberán viajar a varias épocas y reunir las auras de personajes históricos para formar el equipo definitivo. '
'Durante la aventura, se les unirán nuevos y viejos amigos quienes ayudarán a derrotar a la amenaza.');

INSERT INTO inazuma_eleven.juegos(nombre, publicacion, consolas, sinopsis)
VALUES ('Inazuma Eleven Go Galaxy Big Bang', '2013-12-13', 'Nintendo 3DS', 
'Se anuncia el torneo mundial Fútbol Frontier Internacional Visión 2 y los equipos que han participado en el Camino Imperial '
'se reúnen en el Estadio Camino Imperial con el fin de ser elegidos para representar a Japón. '
'Astero Black anuncia que solo seleccionará a 11 jugadores para formar el equipo de Inazuma Japón. '
'Entre los seleccionados son Arion, Victor y Riccardo. Para la sorpresa de todos, los siguientes 8 seleccionados son desconocidos y para empeorar las cosas, son unos novatos. '
'Durante el torneo, el trío del Raimon deberán enseñarles a jugar fútbol y lograr clasificar al mundial. '
'Después de muchos esfuerzos, logran ganar las clasificatorias de Asia pero se enteran que en realidad no hay ningún torneo mundial. '
'En realidad, son las clasificatorias de un torneo galáctico llamado Gran Celesta Galaxy. '
'Los chicos deberán viajar al espacio representando a la Tierra bajo el nombre del Earth Eleven y ganar el torneo o si no, la tierra será destruída.');

INSERT INTO inazuma_eleven.juegos(nombre, publicacion, consolas, sinopsis)
VALUES ('Inazuma Eleven Go Galaxy Supernova', '2013-12-13', 'Nintendo 3DS', 
'Se anuncia el torneo mundial Fútbol Frontier Internacional Visión 2 y los equipos que han participado en el Camino Imperial '
'se reúnen en el Estadio Camino Imperial con el fin de ser elegidos para representar a Japón. '
'Astero Black anuncia que solo seleccionará a 11 jugadores para formar el equipo de Inazuma Japón. '
'Entre los seleccionados son Arion, Victor y Riccardo. Para la sorpresa de todos, los siguientes 8 seleccionados son desconocidos y para empeorar las cosas, son unos novatos. '
'Durante el torneo, el trío del Raimon deberán enseñarles a jugar fútbol y lograr clasificar al mundial. '
'Después de muchos esfuerzos, logran ganar las clasificatorias de Asia pero se enteran que en realidad no hay ningún torneo mundial. '
'En realidad, son las clasificatorias de un torneo galáctico llamado Gran Celesta Galaxy. '
'Los chicos deberán viajar al espacio representando a la Tierra bajo el nombre del Earth Eleven y ganar el torneo o si no, la tierra será destruída.');

INSERT INTO inazuma_eleven.juegos(nombre, publicacion, consolas, sinopsis)
VALUES ('Inazuma Eleven Victory Road', '2025-06-14', 'Switch, PS4, PS5, PC', 
'???????????????????????????????????????????????????????????????????????????');


-- Ver TODOS los jugadores y su equipo
select j.nombre as 'Jugador', e.nombre as 'equipo'
from inazuma_eleven.jugadores j
inner join inazuma_eleven.equipos e
on j.equipo = e.id_equipo;

-- Ver supertecnica de TODOS los jugadores
select j.nombre as 'Jugador', st.nombre as 'Supertécnica'
from inazuma_eleven.jugadores j
inner join inazuma_eleven.st_jugadores stj
on j.id_jugador = stj.id_jugador
inner join inazuma_eleven.supertecnicas st
on stj.id_st = st.id_st;

-- Ver supertecnica de UN jugador
Select st.nombre
from inazuma_eleven.st_jugadores stj
inner join inazuma_eleven.supertecnicas st
on stj.id_st = st.id_st
where stj.id_jugador = (select id_jugador from inazuma_eleven.jugadores where nombre = 'Alexis');



select * from inazuma_eleven.st_jugadores;
            

-- Añadir supertecnica a  jugador           
insert into inazuma_eleven.st_jugadores values(
	(select id_st from inazuma_eleven.supertecnicas where nombre = 'Súper relámpago, Zigzag chispeante, Rapidez+, Gran Lobo'),
    (select id_jugador from inazuma_eleven.jugadores where nombre = 'Alexis Mach'));

-- Eliminar supertecnica de jugador
delete from inazuma_eleven.st_jugadores stj where(
	stj.id_jugador = (select id_jugador from inazuma_eleven.jugadores where nombre = 'Alexis Mach') AND
    stj.id_st = (select id_st from inazuma_eleven.supertecnicas where nombre = 'Súper relámpago')
);

-- Insertar imagenes a jugadores
update inazuma_eleven.jugadores
set imagen_url = 'https://w7.pngwing.com/pngs/291/133/png-transparent-inazuma-eleven-go-2-chrono-stone-inazuma-eleven-go-3-galaxy-inazuma-eleven-3-inazuma-eleven-video-game-human-fictional-character.png' 
where id_jugador = 17;