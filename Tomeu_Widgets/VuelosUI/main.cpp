#include <QApplication>
#include <QFile>
#include "mainwindow.h"

int main(int argc, char *argv[])
{


    QApplication a(argc, argv);
    MainWindow w;

    QFile file("/home/usuario/TrabajoGrupo/ProyectoVuelos/Tomeu_Widgets/VuelosUI/qss/style.qss");
    if (file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        w.setStyleSheet(file.readAll());
        file.close();
    }
    w.show();

    return a.exec();
}
