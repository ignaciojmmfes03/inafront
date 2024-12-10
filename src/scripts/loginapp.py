from flask import Flask, jsonify, request
from flask_jwt_extended import create_access_token, JWTManager
from werkzeug.security import check_password_hash
from flask_cors import CORS
import pymysql

app = Flask(__name__)

# Configuración de JWT
app.config["JWT_SECRET_KEY"] = "2003"  # Clave secreta para JWT

# Configuración de CORS
CORS(app, resources={r"/*": {"origins": "http://localhost:4200"}}, supports_credentials=True)

# Inicializar JWT
jwt = JWTManager(app)

@app.after_request
def after_request(response):
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
    response.headers.add('Access-Control-Allow-Methods', 'GET,POST,OPTIONS')
    response.headers.add('Access-Control-Allow-Origin', 'http://localhost:4200')
    return response

@app.route('/login', methods=['POST'])
def login_user():
    try:
        data = request.get_json()
        nombre = data.get('username')
        passwd = data.get('passwd')

        if not nombre or not passwd:
            return jsonify({"message": "Faltan datos"}), 400

        connection = pymysql.connect(
            host='82.223.196.97',
            user='root',
            password='2003',
            db='inazuma_eleven',
            cursorclass=pymysql.cursors.DictCursor
        )

        try:
            with connection.cursor() as cursor:
                query = "SELECT * FROM usuarios WHERE username = %s OR email = %s"
                cursor.execute(query, (nombre, nombre))
                user = cursor.fetchone()

                if user and check_password_hash(user['passwd'], passwd):
                    token = create_access_token(identity=user['id'])
                    return jsonify({"message": "Login exitoso", "token": token, "username": user['username']}), 200
                else:
                    return jsonify({"message": "Usuario o contraseña incorrectos"}), 401
        except pymysql.MySQLError as e:
            return jsonify({"message": "Error al buscar usuario", "error": str(e)}), 500
        finally:
            connection.close()

    except Exception as e:
        return jsonify({"message": "Error en el servidor", "error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)