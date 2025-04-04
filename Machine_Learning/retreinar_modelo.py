import pandas as pd
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import LSTM, Dense

# Carregar dados
dados = pd.read_csv('dados_miniindice.csv')

# Criar modelo
modelo = Sequential([
    LSTM(50, input_shape=(60, 5)),  # 60 velas, 5 features
    Dense(3, activation='softmax')   # BUY/SELL/HOLD
])
modelo.compile(optimizer='adam', loss='categorical_crossentropy')

# Treinar
modelo.fit(dados, epochs=10)
modelo.save('modelo_atualizado.h5')
