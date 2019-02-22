#include "mainwindow.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QFile file(":/style.qss");
    file.open(QFile::ReadOnly);
    QString styleSheet = QLatin1String(file.readAll());
    setStyleSheet(styleSheet);

    QApplication a(argc, argv);
    MainWindow w;
    w.show();

    return a.exec();
}
