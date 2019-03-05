#ifndef CONEXIONBBDD_H
#define CONEXIONBBDD_H
#include <qstring.h>


class ConexionBBDD
{
public:
    ConexionBBDD();
    void Conectar();
    QString DevolverVuelos();


};

#endif // CONEXIONBBDD_H
