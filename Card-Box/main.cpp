/*========================================================
  Copyright (C) 2016 Dotwaves Corporation
  Programmer & Developer : Kambiz Asadzadeh
  E-Mail : kambiz.ceo@gmail.com | info@kambizasadzadeh.com
  Official website : https://dotwaves.com
  Official C++ refrence: https://dotwaves.ir
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
