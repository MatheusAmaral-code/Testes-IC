from flask import Flask, request, jsonify
import pandas as pd
from flask_cors import CORS
app = Flask(__name__)
CORS(app)

csv_path = "../Dados/Relatorio_cadop.csv"
df = pd.read_csv(csv_path, encoding="utf-8", sep=";").fillna("")

@app.route('/buscar', methods=['GET'])
def search():
    query = request.args.get("q", "").lower()
    if not query:
        return jsonify({"error": "Parâmetro de busca ausente"}), 400

    filtered = df[df.apply(lambda row: row.astype(str).str.lower().str.contains(query).any(), axis=1)]

    return jsonify(filtered.to_dict(orient="records"))

if __name__ == "main":
    app.run(debug=True)