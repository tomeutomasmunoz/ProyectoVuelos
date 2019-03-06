#include "nuevo_vuelo.h"
#include "ui_nuevo_vuelo.h"

Nuevo_Vuelo::Nuevo_Vuelo(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Nuevo_Vuelo)
{
    ui->setupUi(this);
}

Nuevo_Vuelo::~Nuevo_Vuelo()
{
    delete ui;
}
