from flask import Flask

# Création de l'application Flask
app = Flask(__name__)

# Définir une route de base
@app.route('/')
def hello_world():
    return 'Hello, World!'

# Lancer l'application
if __name__ == '__main__':
    app.run(debug=True)