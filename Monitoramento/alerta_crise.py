import requests
import json

def verificar_crise():
    api_key = "f44ca3b497454843992f22aba7c900f5"  # Obtenha em https://newsapi.org/
    url = f"https://newsapi.org/v2/everything?q=guerra OR crise OR eleições&apiKey={api_key}"
    
    try:
        response = requests.get(url)
        news = json.loads(response.text)
        if news['totalResults'] > 10:  # Muitas notícias = crise
            with open("alerta_crise.txt", "w") as f:
                f.write("PAUSAR_ROBO")
    except Exception as e:
        print("Erro ao verificar notícias:", e)

verificar_crise()
