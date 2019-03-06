#include "listar_vuelos.h"
#include "ui_listar_vuelos.h"

Listar_Vuelos::Listar_Vuelos(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Listar_Vuelos)
{
    ui->setupUi(this);
}

Listar_Vuelos::~Listar_Vuelos()
{
    delete ui;
}
