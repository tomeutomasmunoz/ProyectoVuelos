#include <QtCore/QCoreApplication>
#include <socket.h>

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    socket *server = new socket();
    QObject::connect(server, &socket::closed, &app, &QCoreApplication::quit);

    return app.exec();
}
