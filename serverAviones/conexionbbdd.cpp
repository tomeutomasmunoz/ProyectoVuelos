#include "conexionbbdd.h"
#include <QDebug>
#include <QtSql>
#include <QUuid>
#include <QSqlQuery>
#include<qjsonarray.h>
#include<qjsondocument.h>


ConexionBBDD::ConexionBBDD()
{

}
void ConexionBBDD::Conectar()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
    db.setHostName("127.0.0.1");
    db.setPort(5432);
    db.setDatabaseName("aviones");
    db.setUserName("usuario");
    db.setPassword("usuario");
    bool ok = db.open();

    if (ok)
    {
        qDebug() << "Conectado OK";

    } else {
        qDebug() << db.lastError();
    } // end if
}



QString ConexionBBDD::DevolverVuelos()
{
    QSqlQuery qu;
    qu.setForwardOnly(true);
    if (!qu.exec("SELECT * FROM vuelos ORDER BY ID DESC LIMIT 1"))return QString();

      QJsonDocument  json;
      QJsonArray     recordsArray;

      while(qu.next())
      {
         QJsonObject recordObject;
            for(int x=0; x < qu.record().count(); x++)
            {
            recordObject.insert( qu.record().fieldName(x),QJsonValue::fromVariant(qu.value(x)) );
            }
         recordsArray.push_back(recordObject);
      }
      json.setArray(recordsArray);

      return json.toJson();
    }







}










