#include "socket.h"
#include "QtWebSockets/qwebsocketserver.h"
#include "QtWebSockets/qwebsocket.h"
#include <QtCore/QDebug>


socket::socket(quint16 port, bool debug) :
    m_pWebSocketServer(new QWebSocketServer(QStringLiteral("Test Server"),
                                            QWebSocketServer::NonSecureMode, this)),
    m_debug(debug)

{
    if (m_pWebSocketServer->listen(QHostAddress::Any, port)) {

            if (m_debug)
                qDebug() << "Server iniciado en puerto" << port;
            connect(m_pWebSocketServer, &QWebSocketServer::newConnection,
                    this, &socket::onNewConnection);
            connect(m_pWebSocketServer, &QWebSocketServer::closed, this, &socket::closed);
        }
}


socket::~socket()
{
    m_pWebSocketServer->close();
    qDeleteAll(m_clients.begin(), m_clients.end());
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
