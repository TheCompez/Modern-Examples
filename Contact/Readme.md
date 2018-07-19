# Qt Quick and C++ Integration
** Data [ContactList] Demo **
===================================
This example show you that how to create your custom data from C++ and invoke them into QML User Interface.

Usage : 

```
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "contactlist.h"

using namespace Contact;

int main(int argc, char *argv[])
{
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QGuiApplication app(argc, argv);

     QList<QObject*> dataList;
     dataList.append(new ContactList("کامبیز",
                                    "اسدزاده",
                                    "09140000000",
                                    "Apple iPhone",
                                    "https://avatars0.githubusercontent.com/u/4066299?s=460&v=4",
                                    "#00D397",
                                    "https://github.com/Kambiz-Asadzadeh"));

     dataList.append(new ContactList("حامد",
                                    "مصافی",
                                    "09350000000",
                                    "Samsung Galaxy",
                                    "https://avatars2.githubusercontent.com/u/13809362?s=460&v=4",
                                    "#E83B0B",
                                    "https://github.com/HamedMasafi"));

     dataList.append(new ContactList("بهنام",
                                    "صباغی",
                                    "09190000000",
                                    "Google Nexus",
                                    "https://avatars3.githubusercontent.com/u/17690495?s=460&v=4",
                                    "#E15504",
                                    "https://github.com/FONQRI"));

     dataList.append(new ContactList("آرش",
                                    "میلانی",
                                    "09140000000",
                                    "Apple iPhone",
                                    "https://avatars3.githubusercontent.com/u/586816?s=460&v=4",
                                    "#3650F7",
                                    "https://github.com/arashmilani"));

     dataList.append(new ContactList("سروش",
                                    "ربیعی",
                                    "09190000000",
                                    "Google Nexus",
                                    "https://avatars0.githubusercontent.com/u/920670?s=460&v=4",
                                    "#8C56EA",
                                    "https://github.com/soroush"));


  QQmlApplicationEngine engine;
  QQmlContext *ctxt = engine.rootContext();

  qmlRegisterType<ContactList>("api.dotwaves.qml", 1, 0, "Data");

  ctxt->setContextProperty("contactModel", QVariant::fromValue(dataList));
  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

  if (engine.rootObjects().isEmpty())
    return -1;

  return app.exec();
}


```

**Note:**
Make sure that you have libeay32 and ssleay32 libs inside your application.


Module importation in QML
```
import api.dotwaves.qml 1.0
```
