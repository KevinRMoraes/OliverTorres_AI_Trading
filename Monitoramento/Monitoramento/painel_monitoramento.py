import streamlit as st
import pandas as pd

st.title("📊 Painel do Robô de Trading")
st.metric("Assertividade", "85%")
st.metric("Profit Factor", "2.3")

if st.button("Atualizar Dados"):
    st.success("Dados atualizados com sucesso!")
