#ifndef SOCKET_H
#define SOCKET_H

#include <QtCore/QObject>
#include <QtCore/QList>
#include <QByteArray>

class QWebSocketServer;
class QWebSocket;


class socket : public QObject
{
    Q_OBJECT

public:
    explicit socket(quint16 port, bool debug=false);
    ~socket();

signals:
    void closed();

private slots:
    void onNewConnection();
    void processTextMessage(QString message);
    void socketDisconnected();

private:
    QWebSocketServer *m_pWebSocketServer;
    QList<QWebSocket *> m_clients;
    bool m_debug;
};

#endif
