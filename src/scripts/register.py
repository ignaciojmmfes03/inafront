from flask import Flask, request, jsonify
import pymysql
from flask_cors import CORS

app = Flask(__name__)

# Configuración de CORS
CORS(app, resources={r"/*": {"origins": "http://localhost:4200"}}, supports_credentials=True)

app.secret_key = '2003'

# Función para conectar a la base de datos
def create_connection():
    try:
        connection = pymysql.connect(
            host='82.223.196.97',
            user='root',
            password='2003',
            db='inazuma_eleven',
            charset='utf8mb4'
        )
        return connection
    except pymysql.MySQLError as e:
        print(f"Error al conectar a la base de datos: {e}")
        return None

@app.after_request
def after_request(response):
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
    response.headers.add('Access-Control-Allow-Methods', 'GET,POST,OPTIONS')
    response.headers.add('Access-Control-Allow-Origin', 'http://localhost:4200')
    return response

@app.route('/register', methods=['POST'])
def register_user():
    try:
        data = request.get_json()

        nombre = data.get('username')
        email = data.get('email')
        passwd = data.get('passwd')

        if not nombre or not email or not passwd:
            return jsonify({"message": "Faltan datos"}), 400

        connection = create_connection()
        if connection:
            try:
                cursor = connection.cursor()
                check_query = "SELECT * FROM usuarios WHERE username = %s OR email = %s"
                cursor.execute(check_query, (nombre, email))
                existing_user = cursor.fetchone()

                if existing_user:
                    return jsonify({"message": "El usuario o correo ya está registrado"}), 409

                insert_query = "INSERT INTO usuarios (username, email, passwd) VALUES (%s, %s, %s)"
                cursor.execute(insert_query, (nombre, email, passwd))
                connection.commit()
                return jsonify({"message": "Usuario registrado correctamente"}), 201
            except pymysql.MySQLError as e:
                connection.rollback()
                return jsonify({"message": "Error al registrar usuario"}), 500
            finally:
                cursor.close()
                connection.close()
        else:
            return jsonify({"message": "No se pudo conectar a la base de datos"}), 500
    except Exception as e:
        return jsonify({"message": "Error en el servidor"}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
