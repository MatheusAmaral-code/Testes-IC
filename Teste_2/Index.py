import pdfplumber
import pandas as pd
import zipfile
import os

pdf_path = "../Teste_1/Web_Scraping/Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf"
data = []

if not os.path.exists("CSV_Extraido"):
    os.mkdir("CSV_Extraido")

with pdfplumber.open(pdf_path) as pdf:
    header = False
    for page in pdf.pages:
        tables = page.extract_table()
        if tables:
            if not header:
                tables[0][3] = "Seg. Odontológica"
                tables[0][4] = "Seg. Ambulatorial"
                data.append(tables[0])
                header = True
            for row in tables[1:]:
                if row[3] == "OD": 
                    row[3] = "Seg. Odontológica"
                if row [4] == "AMB":
                    row[4] = "Seg. Ambulatorial"
                data.append(row)

df = pd.DataFrame(data)
df = df.dropna(how="all")

diretorio_saida = "./CSV_Extraido/"
csv_filename = os.path.join(diretorio_saida, "Rol_Procedimentos.csv")
df.to_csv(csv_filename, index=False, header=False, encoding="utf-8")

zip_filename = os.path.join(diretorio_saida, "Teste_Matheus_Amaral.zip")
with zipfile.ZipFile(zip_filename, "w", zipfile.ZIP_DEFLATED) as zipf:
    zipf.write(csv_filename, os.path.basename(csv_filename))