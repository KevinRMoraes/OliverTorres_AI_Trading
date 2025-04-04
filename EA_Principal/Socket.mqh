//+------------------------------------------------------------------+
//|                  Socket.mqh - Comunicação TCP/IP                |
//+------------------------------------------------------------------+
#include <WinAPI/WinAPI.mqh>

class SocketClient
{
private:
    int socket;
public:
    bool Connect(string host, int port)
    {
        socket = SocketCreate();
        if (socket == INVALID_HANDLE) return false;
        return SocketConnect(socket, host, port);
    }

    void Send(string data)
    {
        SocketSend(socket, data);
    }

    string Receive()
    {
        uchar buffer[1024];
        int received = SocketReceive(socket, buffer, 1024);
        return CharArrayToString(buffer, 0, received);
    }

    void Close()
    {
        SocketClose(socket);
    }
};
//+------------------------------------------------------------------+
