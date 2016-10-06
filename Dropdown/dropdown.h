#ifndef DROPDOWN_H
#define DROPDOWN_H

#include <QObject>

class Dropdown : public QObject
{

    Q_OBJECT

public:
    Dropdown();
    Q_INVOKABLE QStringList listItem();
};

#endif // DROPDOWN_H
