QT += qml quick webengine

CONFIG += c++11

SOURCES += main.cpp \
    map.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    map.h
