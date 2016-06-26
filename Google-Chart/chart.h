#ifndef CHART_H
#define CHART_H

#include <QObject>
#define UI Q_INVOKABLE //!Pass to QML

class Chart : public QObject
{

    Q_OBJECT

public:
    Chart();

};

#endif // CHART_H
