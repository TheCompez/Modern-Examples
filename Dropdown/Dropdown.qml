/* Example: Combobox [Dropdown] Component for QML and C++
 * Author: Kambiz Asadzadeh
 * Back-end: C++
 * Front-End: QML, JavaScript
 * Official website : https://nanosoftco.com
 * Official Iranian C++ website : https://iostream.ir
*/

import QtQuick 2.5
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Item {

    id: icomboBox
    property int clickSignal: 1
    signal selected() //Create signal
    signal press() //Create signal

    property alias title                  :    box_title
    property alias dwidth                 :    icomboBox.width
    property alias dheight                :    icomboBox.height
    property alias arrow_icon             :    box_arrow
    property string list_item             :    ""
    property alias item : crepeater
    signal title_textChanged();



    width: dwidth
    height: dheight

    MouseArea {
        id: mouseAreaFill
        anchors.fill: parent
        hoverEnabled: false

        onClicked: {
            clickSignal = 1
            drop_down_general.visible = false
            drop_down_container.visible = false
            drop_down_container_border.visible = false
            drop_down_items.visible = false

            drop_down_general.opacity = 0.0
            drop_down_container.opacity = 0.0
            drop_down_container_border.opacity = 0.0
            drop_down_items.opacity = 0.0
        }
    }

    Rectangle {
        id: boxItem
        x: 8
        y: 8
        width: dwidth
        height: dheight
        border.color: "#cccccc"
        border.width: 1
        color: boxItem.enabled ?  "#ffffff" : "#e7e7e7"

        Text {
            id: box_title
            color: "#333333"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            font.pixelSize: 14
            onTextChanged:title_textChanged()

        }

        Image {
            id: box_arrow
            x: 200
            y: 8
            width: 16
            height: 16
            sourceSize.height: 16
            sourceSize.width: 16
            source: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAm0lEQVQ4T7WSwQ3CMAxF8zNJR+IQ59oyAYxSNmivdoZiE6MigiCNS1HUnP2enhXDNT408u5YATMP3nsNIcxWqVkgIpNzrl9AVZ1ijOeapCr4hDNkSVaCAs7pZsmXoISJaFgKttZ5Cyw4r2BJnoJf8JYEzDwCuLyG5pxtfVtRcoOI6F64VoKU0klVOyIa/zlrEbkCuB97ynuKmgseb/hi8xzRhq8AAAAASUVORK5CYII="
        }

        MouseArea {
            id: mouseAreaBoxItem
            anchors.rightMargin: 0
            anchors.bottomMargin: -1
            anchors.leftMargin: 0
            anchors.topMargin: 1
            anchors.fill: parent
            hoverEnabled: enabled
            cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor

            onPressed: press()

            onClicked: {
                if(clickSignal == 1) {
                    box_arrow.source = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAqElEQVQ4T6WSwQ3DIAxF/SfpSr3ga9MJ2lGaDdKrzVCdBFegUqEEEiJ8RP9/PxuDBguDfhoP8N5fQwgXZp7P0KjqE8AHqmrRaGYLM997QlR1IaJb1EJEXgAevSGl2czmtIPVY5Ok1BHR2zk3/Zd4FFIzpxHKmVshLfMmoDZOEgHTr1HCLptW72DVMes35ipBVu9hHxJkgYgkXGaO/16t8VPuubw9zTDBF2nAYfMAU2ChAAAAAElFTkSuQmCC"
                    clickSignal = 0

                    drop_down_general.visible = true
                    drop_down_container.visible = true
                    drop_down_container_border.visible = true
                    drop_down_items.visible = true

                    drop_down_general.opacity = 1.0
                    drop_down_container.opacity = 1.0
                    drop_down_container_border.opacity = 1.0
                    drop_down_items.opacity = 1.0

                } else {
                    box_arrow.source = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAm0lEQVQ4T7WSwQ3CMAxF8zNJR+IQ59oyAYxSNmivdoZiE6MigiCNS1HUnP2enhXDNT408u5YATMP3nsNIcxWqVkgIpNzrl9AVZ1ijOeapCr4hDNkSVaCAs7pZsmXoISJaFgKttZ5Cyw4r2BJnoJf8JYEzDwCuLyG5pxtfVtRcoOI6F64VoKU0klVOyIa/zlrEbkCuB97ynuKmgseb/hi8xzRhq8AAAAASUVORK5CYII="
                    clickSignal = 1
                    drop_down_general.visible = false
                    drop_down_container.visible = false
                    drop_down_container_border.visible = false
                    drop_down_items.visible = false

                    drop_down_general.opacity = 0.0
                    drop_down_container.opacity = 0.0
                    drop_down_container_border.opacity = 0.0
                    drop_down_items.opacity = 0.0
                }
            }
        }
    }
    Rectangle {
        id: drop_down_general
        x: 8
        y: 42
        width: dwidth
        height: mainscroll.height
        color: "#ffffff"
        opacity: 0
        visible: false
        Behavior on opacity { NumberAnimation{duration: 200}}
    }
    Rectangle {
        id: drop_down_container
        x: 8
        y: 51
        width: dwidth
        height: column_list.height
        color: "#ffffff"

        Behavior on color {ColorAnimation{}}
        anchors.horizontalCenter: drop_down_general.horizontalCenter
        anchors.verticalCenter: drop_down_general.verticalCenter
        Behavior on opacity { NumberAnimation{duration: 200}}

        opacity: 0
        visible: false

        layer.enabled: true
        layer.effect: DropShadow {
            horizontalOffset: 0;
            radius: 16
            samples: 32
            source: drop_down_container
            color: "#20000000"
            verticalOffset: 0;
            transparentBorder: true
            spread: 0
        }

    }
    Item {
        id: drop_down_items
        x: 8
        y: 51
        width: dwidth
        height: column_list.height
        anchors.horizontalCenter: drop_down_container.horizontalCenter
        anchors.verticalCenter: drop_down_container.verticalCenter
        opacity: 0
        visible: false

        ScrollView {
            id:mainscroll
            width: dwidth
            height: column_list.height
            horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
            verticalScrollBarPolicy: Qt.ScrollBarAsNeeded

            onHeightChanged: {
                if(mainscroll.height >= 800){
                    mainscroll.verticalScrollBarPolicy = Qt.ScrollBarAlwaysOn
                    mainscroll.height = column_list.height / 2.4
                    drop_down_items.height = mainscroll.height
                    drop_down_container.height = mainscroll.height
                    drop_down_container_border.height = mainscroll.height

                }
            }

            Column {
                id:column_list


                Repeater {
                    id: crepeater
                    Rectangle {
                        id:itm_rec
                        width: dwidth
                        height: 44
                        anchors.horizontalCenterOffset: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                        Behavior on color {ColorAnimation{}}

                        Text {
                            id:itm_text
                            property alias cdata : itm_text
                            objectName: "events"
                            color: "#333333"
                            anchors.leftMargin: 20
                            anchors.topMargin: 20
                            anchors.bottomMargin: 20
                            anchors.rightMargin: 20
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignRight
                            anchors.fill: parent
                            font.pixelSize: 14

                            text: list_item === "" ? modelData : list_item
                            Behavior on scale { NumberAnimation{}}

                        }

                        MouseArea {

                            id: mouseAreaItem
                            anchors.fill: parent
                            hoverEnabled: enabled
                            cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
                          //  onClicked: areaClicked()

                            onPressedChanged: {

                                itm_text.scale = 0.8

                            }

                           // onClicked: icomboBox.selected()

                            onClicked: {
                                box_title.text = modelData
                                itm_text.scale = 1.0
                                //After select an item
                                clickSignal = 1
                                drop_down_general.visible = false
                                drop_down_container.visible = false
                                drop_down_container_border.visible = false
                                drop_down_items.visible = false

                                drop_down_general.opacity = 0.0
                                drop_down_container.opacity = 0.0
                                drop_down_container_border.opacity = 0.0
                                drop_down_items.opacity = 0.0

                                box_arrow.source = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAm0lEQVQ4T7WSwQ3CMAxF8zNJR+IQ59oyAYxSNmivdoZiE6MigiCNS1HUnP2enhXDNT408u5YATMP3nsNIcxWqVkgIpNzrl9AVZ1ijOeapCr4hDNkSVaCAs7pZsmXoISJaFgKttZ5Cyw4r2BJnoJf8JYEzDwCuLyG5pxtfVtRcoOI6F64VoKU0klVOyIa/zlrEbkCuB97ynuKmgseb/hi8xzRhq8AAAAASUVORK5CYII="
                            }




                            onHoveredChanged: {
                                if(mouseAreaItem.containsMouse) {
                                    itm_rec.color = "#48cfad"
                                    itm_text.color = "#ffffff"

                                } else {
                                    itm_rec.color = "#ffffff"
                                    itm_text.color = "#333333"
                                }

                            }
                        }


                    }
                }



            }
        }

    }

    Rectangle {
        id: drop_down_container_border
        x: 10
        y: 5
        width: dwidth
        height: column_list.height
        color: "#00000000"
        anchors.verticalCenter: drop_down_container.verticalCenter
        anchors.horizontalCenter: drop_down_container.horizontalCenter
        opacity: 0
        visible: false
        border.color: "#cccccc"
        border.width: 1


    }




}

