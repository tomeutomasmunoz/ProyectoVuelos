#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QMessageBox>
#include <QtWebSockets/QtWebSockets>
#include <QTcpSocket>
#include <QDebug>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
    void Conectar();

private:
    Ui::MainWindow *ui;
    QTcpSocket *socket;

public slots:

private slots:
    void on_pushButton_3_clicked();
    void on_pushButton_2_clicked();
};

#endif // MAINWINDOW_H
