/*========================================================
  Copyright (C) 2016 Dotwaves Corporation
  Programmer & Developer : Kambiz Asadzadeh
  E-Mail : kambiz.ceo@gmail.com | info@kambizasadzadeh.com
  Official website : https://dotwaves.com
  Official C++ refrence: https://dotwaves.ir
*=========================================================*/

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngine>
#include <QtQml>

#include <chart.h>


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QtWebEngine::initialize();//Initialize WebEngine!
    qmlRegisterType<Chart>("Interface.Nanosoft", 1, 0, "Chart");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
