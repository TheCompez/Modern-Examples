/* Example: How to use Webegine and C++
 * Author: Kambiz Asadzadeh
 * Back-end: C++
 * Front-End: HTML, QML, JavaScript
 * Api: Google Developer Api
*/

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QtWebEngine>

//Include STL
#include <memory>
//Include My map class
#include "map.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QtWebEngine::initialize();//Initialize WebEngine!


    qmlRegisterType<Map>("Interface.Dotwaves", 1, 0, "Map");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
