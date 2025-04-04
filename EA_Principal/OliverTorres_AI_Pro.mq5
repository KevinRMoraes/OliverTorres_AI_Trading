//+------------------------------------------------------------------+
//|                  OliverTorres_AI_Pro.mq5                        |
//|              Robô de Trading para Mini Índice com ML            |
//+------------------------------------------------------------------+
#include <Trade/Trade.mqh>
#include <Socket.mqh>

//--- Inputs
input double RiscoPorTrade = 1.0;   // % do capital por operação
input int StopLoss_Pontos = 50;     // Stop Loss (50 pontos = R$10)
input int TakeProfit_Pontos = 150;  // Take Profit (150 pontos = R$30)

CTrade trade;
SocketClient socket;

void OnTick()
{
    //--- Lógica de negociação aqui
    double rsi = iRSI(NULL, 0, 14, PRICE_CLOSE, 0);
    if (rsi < 30 && Volume[0] > iMA(NULL, 0, 20, 0, MODE_SMA, VOLUME_TICK, 0))
    {
        double lotes = CalcularLotes(RiscoPorTrade, StopLoss_Pontos);
        trade.Buy(lotes, NULL, Ask, Bid - StopLoss_Pontos * _Point, Ask + TakeProfit_Pontos * _Point, "Compra AI");
    }
}

double CalcularLotes(double risco, int slPontos)
{
    double valorPorPonto = 0.20;
    double riscoMaximo = AccountBalance() * risco / 100;
    return NormalizeDouble(riscoMaximo / (slPontos * valorPorPonto), 2);
}
