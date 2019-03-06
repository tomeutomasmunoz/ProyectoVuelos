#ifndef LISTAR_VUELOS_H
#define LISTAR_VUELOS_H

#include <QDialog>

namespace Ui {
class Listar_Vuelos;
}

class Listar_Vuelos : public QDialog
{
    Q_OBJECT

public:
    explicit Listar_Vuelos(QWidget *parent = nullptr);
    ~Listar_Vuelos();

private:
    Ui::Listar_Vuelos *ui;
};

#endif // LISTAR_VUELOS_H
