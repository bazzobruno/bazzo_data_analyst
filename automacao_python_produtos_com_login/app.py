from flask import Flask, render_template, request, redirect, url_for, session
import sqlite3

app = Flask(__name__)
app.secret_key = 'sua_chave_secreta'

def conectar():
    return sqlite3.connect('dados.db')

def inicializar():
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS dados (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            codigo TEXT, marca TEXT, tipo TEXT,
            categoria TEXT, preco_unitario REAL,
            custo REAL, obs TEXT
        )
    ''')
    conn.commit()
    conn.close()

@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        if request.form['usuario'] == 'harbor_L@bazzo.lab' and request.form['senha'] == 'lksidjushs':
            session['usuario'] = 'harbor'
            return redirect(url_for('formulario'))
        else:
            return render_template('login.html', erro='Login inválido.')
    return render_template('login.html')

@app.route('/formulario', methods=['GET', 'POST'])
def formulario():
    if 'usuario' not in session:
        return redirect(url_for('login'))
    conn = conectar()
    cursor = conn.cursor()
    if request.method == 'POST':
        cursor.execute('''
            INSERT INTO dados (codigo, marca, tipo, categoria, preco_unitario, custo, obs)
            VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', (
            request.form['codigo'],
            request.form['marca'],
            request.form['tipo'],
            request.form['categoria'],
            float(request.form['preco_unitario']),
            float(request.form['custo']),
            request.form['obs']
        ))
        conn.commit()
    cursor.execute('SELECT * FROM dados')
    dados = cursor.fetchall()
    conn.close()
    return render_template('form.html', dados=dados)

if __name__ == '__main__':
    inicializar()
    app.run(debug=True)
