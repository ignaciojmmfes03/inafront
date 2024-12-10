from flask import Flask, request, jsonify
from flask_jwt_extended import create_access_token
from werkzeug.security import generate_password_hash, check_password_hash
import pymysql
from datetime import timedelta

app = Flask(__name__)

# Configuración de JWT
app.config["JWT_SECRET_KEY"] = "2003"  # Clave secreta para JWT
app.config["JWT_ACCESS_TOKEN_EXPIRES"] = timedelta(hours=1)  # Expiración del token

# Función para conectarse a la base de datos
def conectar():
    try:
        miConexion = pymysql.connect(
            host='82.223.196.97',
            user='root',
            passwd='2003',
            db='inazuma_eleven'
        )
        return miConexion
    except pymysql.MySQLError as e:
        print("Error al conectar a la base de datos:", e)
        return None

# Ruta para registrar un nuevo usuario
@app.route('/register', methods=['POST'])
def register():
    # Obtener datos del cuerpo de la solicitud
    data = request.get_json()

    # Validar los datos (username y password)
    username = data.get("username")
    password = data.get("passwd")

    if not username or not password:
        return jsonify({"message": "Nombre de usuario y contraseña son requeridos"}), 400

    # Conectar a la base de datos
    conexion = conectar()
    if conexion:
        try:
            # Comprobar si el nombre de usuario ya existe
            with conexion.cursor(pymysql.cursors.DictCursor) as cursor:
                cursor.execute("SELECT * FROM usuarios WHERE username = %s", (username,))
                user_exists = cursor.fetchone()
                if user_exists:
                    return jsonify({"message": "El nombre de usuario ya está en uso"}), 400

                # Hash de la contraseña antes de almacenarla
                hashed_password = generate_password_hash(password)

                # Insertar el nuevo usuario en la base de datos
                cursor.execute("INSERT INTO usuarios (username, password) VALUES (%s, %s)", (username, hashed_password))
                conexion.commit()

                # Crear el token JWT para el usuario recién registrado
                access_token = create_access_token(identity=username)

                return jsonify({
                    "message": "Usuario registrado con éxito",
                    "access_token": access_token
                }), 201

        except pymysql.MySQLError as e:
            return jsonify({"message": "Error al registrar el usuario", "error": str(e)}), 500
        finally:
            conexion.close()
    else:
        return jsonify({"message": "No se pudo conectar a la base de datos"}), 500

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5000)
