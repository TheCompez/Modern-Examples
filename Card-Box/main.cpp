/*========================================================
  Copyright (C) 2016 Nanosoft Corporation
  Programmer & Developer : Kambiz Asadzadeh
  E-Mail : kambiz.ceo@gmail.com | kambiz@nanosoftco.com
  Official website : https://nanosoftco.com
  Official C++ refrence: https://iostream.ir
*=========================================================*/

#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
