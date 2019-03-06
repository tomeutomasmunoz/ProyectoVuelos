#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "nuevo_vuelo.h"
#include "listar_vuelos.h"

using namespace std;

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::Conectar(){

    QMessageBox *msgBox = new QMessageBox(this);

    // Iniciar WebSocket

    socket = new QTcpSocket(this);

    // Poner IP y PUERTO
    socket->connectToHost("google.com", 80);

    if(socket->waitForConnected(3000)){
        msgBox->setText("Conectado");
        msgBox->open();
        socket->close();

        // Enviar

        /*socket->write("Esto es una prueba");
        socket->waitForBytesWritten(1000);
        socket->waitForReadyRead(3000);
        msgBox->setText(socket->readAll());
        socket->close();*/

    } else {
        msgBox->setText("No conectado");
        msgBox->open();
    }




    // Recibir

    // Cerrar


}

void MainWindow::on_pushButton_3_clicked()
{
    Nuevo_Vuelo nv;
    nv.setModal(true);
    nv.exec();
}

void MainWindow::on_pushButton_2_clicked()
{
    Listar_Vuelos lv;
    lv.setModal(true);
    lv.exec();
}
