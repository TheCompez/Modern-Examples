import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    //visibility:"Maximized"
    width: 1024
    height: 640
    title: qsTr("Hello World")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Geo {}

        Scatter {}

        GColumn {}

        Histogram {}

        LineChart{}

        Pie {}

        GTable{}

        WordTree {}

    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("Geo")
        }
        TabButton {
            text: qsTr("Scatter")
        }
        TabButton {
            text: qsTr("Column")
        }
        TabButton {
            text: qsTr("Histogram")
        }
        TabButton {
            text: qsTr("Line")
        }
        TabButton {
            text: qsTr("Pie")
        }
        TabButton {
            text: qsTr("Table")
        }
        TabButton {
            text: qsTr("Word Tree")
        }
    }
}
