import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.3

//My Custom registered module
import api.dotwaves.qml 1.0
import "./Ui" as UI

Window {
    visible: true
    minimumWidth: 640
    width: 640
    height: 480
    title: qsTr("C++ & Qt Quick (Contact List)")

    Data { id:data; }

    property string language: "persian"

    //This is concept function for change the language font.
    function fontloder () {
        if(language == "persian") {
            contentFont.source = "qrc:/Resources/fonts/Vazir-FD.ttf"
        } else if (language == "english") {
            contentFont.source = "qrc:/Resources/fonts/OpenSans-Regular.ttf";
        }
    }

    FontLoader {
        id:fontAwesomeSolid
        source: "qrc:/Resources/fonts/fa-solid-900.ttf"
    }

    FontLoader {
        id:contentFont
    }

    function loadData() {
        listView.model = contactModel;
    }

    Component.onCompleted: { fontloder(); loadData(); }

    ListView {
            id: listView
            anchors.fill: parent
            snapMode: ListView.SnapOneItem
            anchors.topMargin: 50
            anchors.bottomMargin: 10
            clip: true
            spacing: 1
            focus: true
            layoutDirection: Qt.RightToLeft
            flickableDirection: Flickable.HorizontalAndVerticalFlick

            add: Transition {
                NumberAnimation { properties: "x,y"; from: 100; duration: 1000; easing.type: Easing.OutElastic  }
            }

            delegate: Rectangle {
                id: backItem
                color: "#ffffff"
                border.color: "#ededed"
                border.width: 0
                width: parent.width - 50
                height: 72
                anchors.horizontalCenter: parent.horizontalCenter

                Behavior on scale {
                    NumberAnimation {
                        duration: 64
                    }
                }

                scale: mouseArea.containsMouse ? 1.02 : 1.0
                z: mouseArea.containsMouse ? 2 : 0

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: enabled
                }

                layer.enabled: mouseArea.containsMouse ? true : false
                layer.effect: DropShadow {
                    horizontalOffset: 0
                    radius: mouseArea.containsMouse ? 32 : 6
                    samples: mouseArea.containsMouse ? 16 : 32
                    source: backItem
                    color: mouseArea.containsMouse ? "#10000000" : "#20000000"
                    verticalOffset: 0
                    transparentBorder: true
                    spread: 0
                }

                Rectangle {
                    width: parent.width
                    height: 1
                    color: "#f2f2f2"
                }

                RowLayout {
                    width: parent.width
                    anchors.verticalCenter: parent.verticalCenter
                    layoutDirection: Qt.RightToLeft

                    Item {
                        width: 20
                        height: parent.height
                    }

                    Rectangle {
                        id:circleLight
                        width: 24
                        height: 24
                        radius: 12
                        color: model.modelData.color

                    }

                    Item {
                        width: 20
                        height: parent.height
                    }

                    Rectangle {
                        width: 48
                        height: 48
                        color: "#f1f1f1"
                        border.color: "#ccc"
                        border.width: 1
                        radius: 24
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                        UI.Avatar {
                            id:userImage
                            width: 48
                            height: 48
                            source: model.modelData.avatar
                        }

                        //                    Text {
                        //                        id:firstWord
                        //                        text: dataTitle.text.charAt(0) // Get first character from string (0).
                        //                        anchors.centerIn: parent
                        //                        font.capitalization: Font.AllUppercase
                        //                        font.weight: Font.Bold
                        //                        font.family: contentFont.name
                        //                        font.pixelSize: 24
                        //                        color: "#677ae4"

                        //                    }
                    }

                    Item {
                        width: 5
                        height: parent.height
                    }

                    Column {

                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        Layout.minimumWidth: 100

                        Text {
                            id: dataTitle
                            text: model.modelData.name + " " + model.modelData.family
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            font.family: contentFont.name
                            font.weight: Font.Bold
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            color: model.modelData.color
                            font.pixelSize:14
                            activeFocusOnTab: true
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        Text {
                            id: deviceType
                            text: model.modelData.device
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            anchors.horizontalCenter: parent.horizontalCenter

                            color: "#777"
                        }

                    }

                    Item {
                        width: 10
                        height: parent.height
                    }

                    RowLayout {

                        layoutDirection: Qt.RightToLeft

                        spacing: 5

                        Text {
                            id: phoneIcon
                            text: "\uf095"
                            color: "#6463c5"
                            font.pixelSize: 14
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.family: fontAwesomeSolid.name
                            verticalAlignment: Text.AlignVCenter
                        }

                        Text {
                            id: phoneValue
                            text: model.modelData.phone
                            color: "#526069"
                            font.pixelSize: 12
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                            font.family: contentFont.name
                        }
                    }




                    Rectangle {
                        id: viewRow
                        width: 72
                        height: 32
                        border.width: 1
                        radius: 24
                        border.color: "#e7e7e7"
                        color: mouseAreaViewRow.containsMouse ? "#e7e7e7" : "white"
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                        MouseArea {
                            id: mouseAreaViewRow
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                Qt.openUrlExternally(model.modelData.url);
                            }
                        }

                        Text {
                            id: viewRowText
                            text: qsTr("گیت‌هاب")
                            anchors.centerIn: parent
                            color: "#727c8d"
                            font.pixelSize: 12
                            scale: mouseAreaViewRow.containsPress ? 0.9 : 1.0

                            Behavior on scale {
                                NumberAnimation {
                                }
                            }

                            font.family: contentFont.name
                        }
                    }

                    Item {
                        width: 15
                        height: parent.height
                    }
                }
            }
        }


}
