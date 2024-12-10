import pymysql

# Conectar a la base de datos
def conectar():
    try:
        miConexion = pymysql.connect(
            host='82.223.196.97',
            user='root',
            passwd='2003',
            db='inazuma_eleven'
        )
        print("Conexión exitosa.")
        return miConexion
    except pymysql.MySQLError as e:
        print(f"Error al conectar a la base de datos: {e.args[1]} (Código: {e.args[0]})")
        return None

# Ejecutar una consulta genérica
def ejecutar_consulta(sql, parametros=None):
    conexion = conectar()
    if conexion:
        try:
            with conexion.cursor(pymysql.cursors.DictCursor) as cursor:
                cursor.execute(sql, parametros)
                resultados = cursor.fetchall()
            return resultados
        except pymysql.MySQLError as e:
            print(f"Error al realizar la consulta: {e.args[1]} (Código: {e.args[0]})")
            return None
        finally:
            conexion.close()
    else:
        print("No se pudo conectar a la base de datos.")
        return None

# Función para obtener jugadores
def obtener_jugadores():
    sql = "SELECT * FROM jugadores"
    jugadores = ejecutar_consulta(sql)
    if jugadores:
        print("Jugadores encontrados:")
        for jugador in jugadores:
            print(jugador["nombre"], "-", jugador["posicion"], "-", jugador["afinidad"])
    else:
        print("No se encontraron jugadores o ocurrió un error.")

# Función para obtener equipos
def obtener_equipos():
    sql = "SELECT * FROM equipos"
    equipos = ejecutar_consulta(sql)
    if equipos:
        print("Equipos encontrados:")
        for equipo in equipos:
            print(equipo["nombre"], "-", equipo["region"], "-", equipo["nivel"])
    else:
        print("No se encontraron equipos o ocurrió un error.")

# Función para obtener supertécnicas
def obtener_supertecnicas():
    sql = "SELECT * FROM supertecnicas"
    supertecnicas = ejecutar_consulta(sql)
    if supertecnicas:
        print("Supertécnicas encontradas:")
        for tecnica in supertecnicas:
            print(tecnica["nombre"], "-", tecnica["afinidad"], "-", tecnica["pts"], "-", tecnica["tipo"])
    else:
        print("No se encontraron supertécnicas o ocurrió un error.")

# Función para obtener juegos
def obtener_juegos():
    sql = "SELECT * FROM juegos"
    juegos = ejecutar_consulta(sql)
    if juegos:
        print("Juegos encontrados:")
        for juego in juegos:
            print(juego["nombre"], "-", juego["publicacion"], "-", juego["consolas"])
    else:
        print("No se encontraron juegos o ocurrió un error.")

# Función para obtener usuarios
def obtener_usuarios():
    sql = "SELECT * FROM usuarios"
    usuarios = ejecutar_consulta(sql)
    if usuarios:
        print("Usuarios encontrados:")
        for usuario in usuarios:
            print(usuario["username"], "-", usuario["email"])
    else:
        print("No se encontraron usuarios o ocurrió un error.")

def borrarJugadores():
  id_jugador=19
  conexion = conectar()

  try:
    with conexion.cursor() as cursor:
      cursor.execute(f"SELECT * from jugadores where id_jugador = {id_jugador}")
      jugador = cursor.fetchone()
      cursor.execute(f"DELETE FROM jugadores where id_jugador = {jugador[0]}")
      conexion.commit()
      print(f"Jugador {jugador[0]} eliminado")
  except:
     print("No se encontraron usuarios o ocurrió un error.")

# Ejecutar todas las funciones
if __name__ == "__main__":
    print("Obteniendo jugadores...")
    obtener_jugadores()

    print("\nObteniendo equipos...")
    obtener_equipos()

    print("\nObteniendo supertécnicas...")
    obtener_supertecnicas()

    print("\nObteniendo juegos...")
    obtener_juegos()

    print("\nObteniendo usuarios...")
    obtener_usuarios()

    print("\nJugador a borrar")
    borrarJugadores()



