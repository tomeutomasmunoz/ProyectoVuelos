#include "socket.h"
#include "QtWebSockets/qwebsocketserver.h"
#include "QtWebSockets/qwebsocket.h"
#include <QtCore/QDebug>
#include <iostream>
#include <fstream>




socket::socket() :
    m_pWebSocketServer(new QWebSocketServer(QStringLiteral("Test Server"),
                                            QWebSocketServer::NonSecureMode, this))


{

    QStringList lista = leerConf("configuracion.txt");
    quint16 port=  lista.at(1).toUShort();
    qDebug()<<port;
    if (m_pWebSocketServer->listen(QHostAddress::Any, port))
    {
        qDebug() << "Server iniciado en puerto:" << port;
        connect(m_pWebSocketServer, &QWebSocketServer::newConnection, this, &socket::onNewConnection);
        connect(m_pWebSocketServer, &QWebSocketServer::closed, this, &socket::closed);
    } // end if
}


socket::~socket()
{
    m_pWebSocketServer->close();
    qDeleteAll(m_clients.begin(), m_clients.end());
}

QStringList socket::leerConf(QString archivo)
{
    QStringList list;
    std::ifstream conf;
    std::string linea;
    conf.open(archivo.toStdString().c_str());
    if(!conf.is_open())
    {
    while(std::getline(conf,linea))
    {
        list.append(linea.c_str());

    }
    }

    return list;


}


void socket::onNewConnection()
{
    QWebSocket *pSocket = m_pWebSocketServer->nextPendingConnection();

    qDebug() << "Socket conectado:" << pSocket;

    connect(pSocket, &QWebSocket::textMessageReceived, this, &socket::processTextMessage);
    connect(pSocket, &QWebSocket::disconnected, this, &socket::socketDisconnected);

    m_clients << pSocket;
}


void socket::processTextMessage(QString message)
{
    QWebSocket *pClient = qobject_cast<QWebSocket *>(sender());
    qDebug() << "De:" << pClient << "Mensaje recibido:" << message;
}


void socket::socketDisconnected()
{
    QWebSocket *pClient = qobject_cast<QWebSocket *>(sender());
    qDebug() << "Socket desconectado:" << pClient;

    if (pClient)
    {
        m_clients.removeAll(pClient);
        pClient->deleteLater();
    } // end if
}
