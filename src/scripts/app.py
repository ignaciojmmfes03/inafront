from flask import Flask, jsonify, request
import pymysql
from flask_cors import CORS

app = Flask(__name__)

# Habilitar CORS para permitir solicitudes desde localhost:4200
CORS(app, resources={r"/*": {"origins": "http://localhost:4200"}})

# Función para conectarse a la base de datos
def conectar():
  try:
      # Establecer la conexión a la base de datos
      miConexion = pymysql.connect(
          host='82.223.196.97',
          user='root',
          passwd='2003',
          db='inazuma_eleven',
          cursorclass=pymysql.cursors.DictCursor  # Devuelve los resultados como diccionarios
      )
      return miConexion
  except pymysql.MySQLError as e:
      print("Error al conectar a la base de datos:", e)
      return None

@app.before_request
def handle_preflight():
  if request.method == 'OPTIONS':
      # Permite las solicitudes preflight
      response = jsonify({"message": "preflight request handled"})
      response.headers.add('Access-Control-Allow-Origin', 'http://localhost:4200')
      response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
      response.headers.add('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
      return response

# Ruta raíz
@app.route('/', methods=['GET'])
def inicio():
  return jsonify({"message": "Bienvenido a la API de Inazuma Eleven"}), 200

# Ruta para obtener jugadores
@app.route('/jugadores', methods=['GET'])
def obtener_jugadores():
  conexion = conectar()
  if not conexion:
      return jsonify({"message": "No se pudo conectar a la base de datos"}), 500
  try:
      with conexion.cursor() as cursor:
          cursor.execute("""select j.nombre, j.posicion, j.afinidad, j.obtencion, j.genero, e.nombre, st.nombre, j.imagen_url
                        from inazuma_eleven.jugadores j
                        left join inazuma_eleven.equipos e
                        on j.equipo = e.id_equipo
                        left join inazuma_eleven.st_jugadores stj
                        on j.id_jugador = stj.id_jugador
                        left join inazuma_eleven.supertecnicas st
                        on stj.id_st = st.id_st;""")
          jugadores = cursor.fetchall()
          if jugadores:
              return jsonify({"jugadores": jugadores}), 200
          else:
              return jsonify({"message": "No se encontraron jugadores"}), 404
  except pymysql.MySQLError as e:
      return jsonify({"message": "Error al obtener los jugadores", "error": str(e)}), 500
  finally:
      conexion.close()

# Ruta para obtener super técnicas
@app.route('/supertecnicas', methods=['GET'])
def obtener_supertecnicas():
  conexion = conectar()
  if not conexion:
      return jsonify({"message": "No se pudo conectar a la base de datos"}), 500
  try:
      with conexion.cursor() as cursor:
          cursor.execute("SELECT * FROM supertecnicas")
          supertecnicas = cursor.fetchall()
          if supertecnicas:
              return jsonify({"supertecnicas": supertecnicas}), 200
          else:
              return jsonify({"message": "No se encontraron super técnicas"}), 404
  except pymysql.MySQLError as e:
      return jsonify({"message": "Error al obtener las super técnicas", "error": str(e)}), 500
  finally:
      conexion.close()


@app.route('/jugadores/<int:id_jugador>', methods=['DELETE'])
def eliminar_jugador(id_jugador):
    conexion = conectar()
    try:
        with conexion.cursor() as cursor:
            cursor.execute(f"SELECT id_jugador from jugadores where id_jugador = {id_jugador}")
            jugador = cursor.fetchone()
            if jugador:
                cursor.execute(f"DELETE FROM jugadores where id_jugador = {jugador[0]}")
                conexion.commit()
                return '', 204  # Eliminación exitosa
            else:
                return jsonify({'message': 'Jugador no encontrado'}), 404
    except Exception as e:
        return jsonify({'message': 'Error al eliminar el jugador', 'error': str(e)}), 500
    finally:
        conexion.close()




@app.route('/jugadores', methods=['POST'])
def agregar_jugador():
    try:
        # Obtener los datos del jugador enviados como JSON
        data = request.get_json()

        # Verificar que los datos estén completos
        if not data:
            return jsonify({'error': 'No se recibieron datos'}), 400

        nombre = data.get('nombre')
        posicion = data.get('posicion')
        afinidad = data.get('afinidad')
        obtencion = data.get('obtencion')
        genero = data.get('genero')
        imagen_url = data.get('imagen_url')

        # Verificar que todos los campos requeridos estén presentes
        if not all([nombre, posicion, afinidad, obtencion, genero, imagen_url]):
            return jsonify({'error': 'Faltan campos obligatorios'}), 400

        # Establecer la conexión a la base de datos
        conexion = conectar()
        if not conexion:
            return jsonify({'error': 'No se pudo conectar a la base de datos'}), 500

        try:
            # Insertar el jugador en la base de datos
            with conexion.cursor() as cursor:
                query = """
                    INSERT INTO jugadores (nombre, posicion, afinidad, obtencion, genero, imagen_url)
                    VALUES (%s, %s, %s, %s, %s, %s)
                """
                cursor.execute(query, (nombre, posicion, afinidad, obtencion, genero, imagen_url))
                conexion.commit()

            return jsonify({'message': 'Jugador agregado correctamente'}), 201

        except Exception as e:
            conexion.rollback()
            return jsonify({'error': f'Error al agregar jugador: {str(e)}'}), 500
        finally:
            conexion.close()

    except Exception as e:
        return jsonify({'error': f'Error al procesar la solicitud: {str(e)}'}), 500



# Ruta para obtener equipos
@app.route('/equipos', methods=['GET'])
def obtener_equipos():
  conexion = conectar()
  if not conexion:
      return jsonify({"message": "No se pudo conectar a la base de datos"}), 500
  try:
      with conexion.cursor() as cursor:
          cursor.execute("SELECT * FROM equipos")
          equipos = cursor.fetchall()
          if equipos:
              return jsonify({"equipos": equipos}), 200
          else:
              return jsonify({"message": "No se encontraron equipos"}), 404
  except pymysql.MySQLError as e:
      return jsonify({"message": "Error al obtener los equipos", "error": str(e)}), 500
  finally:
      conexion.close()

# Ruta para obtener juegos
@app.route('/juegos', methods=['GET'])
def obtener_juegos():
  conexion = conectar()
  if not conexion:
      return jsonify({"message": "No se pudo conectar a la base de datos"}), 500
  try:
      with conexion.cursor() as cursor:
          cursor.execute("SELECT * FROM juegos")
          juegos = cursor.fetchall()
          if juegos:
              return jsonify({"juegos": juegos}), 200
          else:
              return jsonify({"message": "No se encontraron juegos"}), 404
  except pymysql.MySQLError as e:
      return jsonify({"message": "Error al obtener los juegos", "error": str(e)}), 500
  finally:
      conexion.close()

# Ruta para obtener usuarios
@app.route('/usuarios', methods=['GET'])
def obtener_usuarios():
  conexion = conectar()
  if not conexion:
      return jsonify({"message": "No se pudo conectar a la base de datos"}), 500
  try:
      with conexion.cursor() as cursor:
          cursor.execute("SELECT id, username, email FROM usuarios")
          usuarios = cursor.fetchall()
          if usuarios:
              return jsonify({"usuarios": usuarios}), 200
          else:
              return jsonify({"message": "No se encontraron usuarios"}), 404
  except pymysql.MySQLError as e:
      return jsonify({"message": "Error al obtener los usuarios", "error": str(e)}), 500
  finally:
      conexion.close()


@app.route('/login', methods=['POST'])
def login():
    data = request.json
    username = data.get('username')
    passwd = data.get('passwd')

    # Conexión a la base de datos
    conexion = conectar()
    if not conexion:
        return jsonify({"message": "No se pudo conectar a la base de datos"}), 500

    try:
        with conexion.cursor() as cursor:
            # Consulta para verificar si el usuario existe y coincide la contraseña
            query = "SELECT id FROM usuarios WHERE username = %s AND passwd = %s"
            cursor.execute(query, (username, passwd))
            user = cursor.fetchone()

            if user:
                # Inicio de sesión exitoso
                return jsonify({"message": "Login exitoso", "user_id": user['id']}), 200
            else:
                # Credenciales incorrectas
                return jsonify({"message": "Usuario o contraseña incorrectos"}), 401
    except Exception as e:
        return jsonify({"message": "Error al procesar la solicitud", "error": str(e)}), 500
    finally:
        conexion.close()





# Iniciar la aplicación
if __name__ == "__main__":
  app.run(debug=True, host='0.0.0.0', port=5000)
