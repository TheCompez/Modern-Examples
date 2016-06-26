#ifndef MAP_H
#define MAP_H

#include <QObject>

#define UI Q_INVOKABLE //Pass to QML

#include <QString>

class Map : public QObject
{

    Q_OBJECT

public:
    Map();

    UI QString key(QString k);
    UI float lat(float x);
    UI float lng(float y);
    UI float zoom(float val);

};

#endif // MAP_H
