#include "conexionbbdd.h"

#include <QDebug>
#include <QtSql>


void ConexionBBDD::conectar()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
    db.setHostName("127.0.0.1");
    db.setPort(5432);
    db.setDatabaseName("test");
    db.setUserName("usuario");
    db.setPassword("usuario");
    bool ok = db.open();

    if (ok)
    {
        qDebug() << "Conectado OK";
    } else {
        qDebug() << "Error de conexion";
    } // end if
}







