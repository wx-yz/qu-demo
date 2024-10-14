from fastapi import FastAPI, Response
import requests

app = FastAPI()

@app.head('/')
async def main(response: Response):
    r = requests.head('https://raw.githubusercontent.com/ramith/mylocal-data/refs/heads/main/ents/country.tsv')
    # response.headers = r.headers
    for key, value in r.headers.items():
        print(key, value)
        response.headers[key] = value
    return ""
