from flask import Flask
import socket

app = Flask(__name__)

@app.get("/")
def root():
    return "Hello World"

@app.get("/hostname")
def hostname():
    return socket.gethostname()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)