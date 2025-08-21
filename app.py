from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.get("/")
def home():
    return jsonify(
        app="proqsmart-demo",
        message="Hello from EC2 via GitHub Actions CI/CD!",
        env=os.getenv("APP_ENV", "dev")
    )

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
