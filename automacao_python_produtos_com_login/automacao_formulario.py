import socket
import os
import signal
import subprocess
import pyautogui
import time
import pandas as pd

# Encerra processos na porta 5000 se existirem
def matar_processo_na_porta(porta=5000):
    proc = subprocess.Popen(["lsof", "-i", f":{porta}"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out, err = proc.communicate()
    lines = out.decode().splitlines()
    for line in lines[1:]:
        parts = line.split()
        pid = int(parts[1])
        os.kill(pid, signal.SIGKILL)

matar_processo_na_porta()

APP_PATH = "app.py"
CSV_PATH = "produtos.csv"

# Lê CSV
tabela = pd.read_csv(CSV_PATH)

# Inicia app Flask
subprocess.Popen(["python3", APP_PATH])
time.sleep(3)

# Abre navegador
os.system(f"open -a 'Google Chrome' 'http://127.0.0.1:5000/'")
time.sleep(4)

# Login - DEBUG DE PRINTS ATIVOS
email = "harbor_L@bazzo.lab"
senha = "lksidjushs"
print("Digitando login:", email, "senha:", senha)

pyautogui.press('tab')
time.sleep(1.2)
pyautogui.hotkey('ctrl', 'a'); pyautogui.press('backspace')
pyautogui.write(email)
time.sleep(1.2)
pyautogui.press('tab')
time.sleep(1.2)
pyautogui.hotkey('ctrl', 'a'); pyautogui.press('backspace')
pyautogui.write(senha)
time.sleep(1.2)
pyautogui.press('tab')
time.sleep(1.2)
pyautogui.press('enter')
time.sleep(3.5)

# Campo código
pyautogui.press('tab')
time.sleep(2.0)

# Cria janela visual simples

for i, linha in enumerate(tabela.index):
    cod = str(tabela.loc[linha, "codigo"])
    marca = str(tabela.loc[linha, "marca"])
    tipo = str(tabela.loc[linha, "tipo"])
    cat = str(tabela.loc[linha, "categoria"])
    preco = str(tabela.loc[linha, "preco_unitario"])
    custo = str(tabela.loc[linha, "custo"])
    obs = "" if pd.isna(tabela.loc[linha, "obs"]) else str(tabela.loc[linha, "obs"])

    for valor in [cod, marca, tipo, cat, preco, custo, obs]:
        pyautogui.hotkey('ctrl', 'a'); pyautogui.press('backspace')
        pyautogui.write(valor)
        pyautogui.press('tab')
        time.sleep(0.8)

    pyautogui.press('enter')
    time.sleep(2.5)
    pyautogui.press('tab')
    time.sleep(1.5)

    

