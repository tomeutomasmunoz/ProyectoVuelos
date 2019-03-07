#ifndef NUEVO_VUELO_H
#define NUEVO_VUELO_H

#include <QDialog>

namespace Ui {
class Nuevo_Vuelo;
}

class Nuevo_Vuelo : public QDialog
{
    Q_OBJECT

public:
    explicit Nuevo_Vuelo(QWidget *parent = nullptr);
    ~Nuevo_Vuelo();
    Ui::Nuevo_Vuelo *ui;

private:

};

#endif // NUEVO_VUELO_H
