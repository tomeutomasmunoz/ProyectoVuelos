#ifndef VUELO_H
#define VUELO_H

#include <QString>


class Vuelo
{
public:
    Vuelo();
    int idVuelo;
    int idCompania;
    int idDestino;
    int idPuerta;
    /*hora (?)*/
    QString info;

};

#endif // VUELO_H
