/* Example: Combobox [Dropdown] Component for QML and C++
 * Author: Kambiz Asadzadeh
 * Back-end: C++
 * Front-End: QML, JavaScript
 * Official website : https://nanosoftco.com
 * Official Iranian C++ website : https://iostream.ir
*/


#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QtQml>

//Include My class
#include "dropdown.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<Dropdown>("Component.Nanosoft", 1, 0, "MyComponent");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
