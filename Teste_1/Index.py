import requests
import zipfile
import os
from bs4 import BeautifulSoup

pagina_gov = requests.get(url="https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos")
soup = BeautifulSoup(pagina_gov.text, features="html.parser")
links = soup.select(".internal-link")
links_anexo = []

if not os.path.exists("Web_Scraping"):
    os.mkdir("Web_Scraping")

for link in links:
    href = link.get("href")
    if "Anexo" in href and href.endswith(".pdf"):
        links_anexo.append(href)

for link in links_anexo:
    pagina_pdf = requests.get(url=link)
    nome_arquivo = link.split("/")[-1]
    if pagina_pdf.status_code == 200:
        with open(f"Web_Scraping/{nome_arquivo}", 'wb') as arquivo:
            arquivo.write(pagina_pdf.content)
        print(f"Arquivo {nome_arquivo} baixado com sucesso!")
    else:
        print(f"Falha no download. Status code: {pagina_pdf.status_code}")
        exit()

diretorio_arquivos = f"{os.getcwd()}/Web_Scraping"
arquivos_pdf = [arquivo for arquivo in os.listdir(diretorio_arquivos) if arquivo.endswith('.pdf')]
with zipfile.ZipFile("./Web_Scraping/Anexos.zip", 'w') as zipf:
    for arquivo in arquivos_pdf:
        nome_arquivo = arquivo.split("/")[-1]
        zipf.write(f"./Web_Scraping/{arquivo}", nome_arquivo)