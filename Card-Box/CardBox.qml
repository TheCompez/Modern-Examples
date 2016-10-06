/*========================================================
  Copyright (C) 2016 Nanosoft Corporation
  Programmer & Developer : Kambiz Asadzadeh
  E-Mail : kambiz.ceo@gmail.com | kambiz@nanosoftco.com
  Official website : https://nanosoftco.com
  Official C++ refrence: https://iostream.ir
*=========================================================*/

import QtQuick 2.4
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0


Item {

    id: card_general

    property alias title                  :    title.text               //for title
    property alias desc                   :    desc.text                //for desc
    property alias image                  :    card_img.source          //for image 128 x 128 Pixel
    property alias mouseArea              :    card_item_mouseArea      //for mouse area
    property alias service_over_text      :    services_over_list.text  //for service title

    property alias edit_mouseArea              :    card_menu_edit_mouseArea //for edit mouse area
    property alias turnOff_mouseArea           :    card_menu_turnoff_mouseArea //for edit mouse area
    property alias remove_mouseArea            :    card_menu_remove_mouseArea //for edit mouse area


    width: 190
    height: 340

    property int turn: 0 // turning on/off status 0 is Enable / 1 is Disable

    Rectangle {
        id: card_body
        width: 190
        height: 340
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        radius: 2

        Behavior on scale { NumberAnimation { duration: 300 } }
        Behavior on color {ColorAnimation{}}

        layer.enabled: true
        layer.effect: DropShadow {
            horizontalOffset: 0;
            radius: 8
            samples: 16
            source: card_item
            color: "#20000000"
            verticalOffset: 0;
            transparentBorder: true
            spread: 0
        }



    }

    Rectangle {
        id: card_item
        width: 190
        height: 340
        anchors.verticalCenter: card_body.verticalCenter
        anchors.horizontalCenter: card_body.horizontalCenter
        radius: 2

        Behavior on scale { NumberAnimation { duration: 300 } }
        Behavior on color {ColorAnimation{}}

        Rectangle {
            id: card_overlay
            x: 1
            y: 0
            width: 190
            height: 190
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            Behavior on scale { NumberAnimation { duration: 300 } }
            Behavior on color {ColorAnimation{}}
            Image {
                id: card_img
                width: 128
                height: 128
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Behavior on scale { NumberAnimation { duration: 300 } }
                source: "data:image/png;base64,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"
            }
        }

        Item {
            id: card_info
            x: 0
            y: 191
            width: 190
            height: 105

            Text {
                id: title
                x: 15
                y: 14
                width: 150
                height: 21
                text: qsTr("Static pages")
                anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 16
            }

            Label {
                id: desc
                x: 20
                y: 41
                width: 150
                height: 32
                color: "#888888"
                text: qsTr("Module for configurating static pages")
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 12

            }
        }

        Rectangle {
            id: card_foot
            x: 0
            y: 309
            width: 188
            height: 30
            color: "#f6f6f6"
            anchors.horizontalCenter: parent.horizontalCenter

            Item {
                id: services_over
                anchors.fill: parent

                Label {
                    id: services_over_list
                    x: 8
                    y: 0
                    width: 122
                    height: 30
                    color: "#337AB7"
                    text: qsTr("C, C++")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                    font.pixelSize: 11
                    anchors.leftMargin: 10
                }

                Rectangle {
                    id: card_set_link
                    x: 132
                    y: 0
                    width: 58
                    height: 30
                    color: "#00000000"

                    Image {
                        id: card_set_menu_image
                        width: 16
                        height: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        source: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAo0lEQVQ4je2QoW5CQRBFV1YgEBUVT1QiEch+E/0CQj2CEMQLSZMV7Jt77lNNRUvCx4Fhk9WkooIjT04mM5PSg39ARMxsH21vcs7T6sdxfAH2tvtSSld9zvlJ0gegYRjmCfgCLsBF0qqGwLZ64FC97WXjfxLw3QxY11DSrgk/m8HvjT8lSQvbv7b7iHiuYSmlAwRI0mtz2uS23Tki3v78pw/u4Apxdnnr/rNMIgAAAABJRU5ErkJggg=="
                    }

                    MouseArea {
                        id: card_set_link_mouseArea
                        anchors.fill: parent
                        hoverEnabled: enabled
                        cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor

                        onHoveredChanged: {

                            if(turn == 1) {
                                if(card_set_link_mouseArea.containsMouse) {
                                    //WHITE
                                    card_set_menu_image.source = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAeUlEQVQ4je3QIQ9BYRiG4S8KgiAIJ4iiIPpN/AKjC2aC2TThVBOw+XGX8m2ebIJw7njtDc/eUrr+IExwwRaD8BEOOKIJ72GDFtOCq0+rONyFn8IX4feCW8A6Dvfh5/Bl+LNghkedOozDps5sMQ7v13UvzH/+064vegPGUKs4zKIEzQAAAABJRU5ErkJggg=="
                                }
                                else {
                                    //WHITE
                                    card_set_menu_image.source = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAeUlEQVQ4je3QIQ9BYRiG4S8KgiAIJ4iiIPpN/AKjC2aC2TThVBOw+XGX8m2ebIJw7njtDc/eUrr+IExwwRaD8BEOOKIJ72GDFtOCq0+rONyFn8IX4feCW8A6Dvfh5/Bl+LNghkedOozDps5sMQ7v13UvzH/+064vegPGUKs4zKIEzQAAAABJRU5ErkJggg=="
                              }


                            } else {

                                if(card_set_link_mouseArea.containsMouse) {
                                    //BLUE
                                    card_set_menu_image.source = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAtklEQVQ4je2QIQvCUBSFL7sbGAwGg2HBaDQY/U36C0S7QcQwBMHg2PO8ohhU8B9ZBnv3vTqLezOLwbAvfhwO516ihn8gKwYMOYSQJZ3yjvdaeqzthmETSl3s/b5sBcosGKIiLUNibc4MKRlSBrCzKhdCVpVnbbeVD2AmtZcrMeylLjDzj4K1Dx5l5wu0m3oPuVOk7IghN4ZNKCu6fmrqYoYohihSeb8+7dl+r3uEuhj/9J0NX/ICK1NpmTXqGhQAAAAASUVORK5CYII="
                                }
                                else {
                                    //GRAY
                                    card_set_menu_image.source = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAo0lEQVQ4je2QoW5CQRBFV1YgEBUVT1QiEch+E/0CQj2CEMQLSZMV7Jt77lNNRUvCx4Fhk9WkooIjT04mM5PSg39ARMxsH21vcs7T6sdxfAH2tvtSSld9zvlJ0gegYRjmCfgCLsBF0qqGwLZ64FC97WXjfxLw3QxY11DSrgk/m8HvjT8lSQvbv7b7iHiuYSmlAwRI0mtz2uS23Tki3v78pw/u4Apxdnnr/rNMIgAAAABJRU5ErkJggg=="
                              }


                            }




                     }

                        onClicked: {

                            if(card_menu_in.visible == false){
                            card_menu_in.visible = true
                            card_menu_in.opacity = 0.8
                                anim_open.start();
                            card_item_mouseArea.hoverEnabled = false
                          }else if(card_menu_in.visible == true){
                                card_menu_in.visible = false
                                card_menu_in.opacity = 0.0
                                card_item_mouseArea.hoverEnabled = true
                              }

                        }

                    }
                }
            }
        }

        MouseArea {
            id: card_item_mouseArea
            anchors.bottomMargin: 36
            anchors.fill: parent

            hoverEnabled: true
            cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor

            onHoveredChanged: {

                if(card_item_mouseArea.containsMouse) {
                card_overlay.color = "#e6e6e6"
                    card_img.source = "data:image/png;base64,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"
                }

                else {
                    card_overlay.color = "#ffffff"
                    card_img.source = "data:image/png;base64,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"

                }
         }

            onPressedChanged: {

            card_img.scale = 0.8

            }

            onClicked: {

            card_img.scale = 1.0

            }

        }
    }


    Rectangle {
        id: card_menu_in
        x: 0
        width: 190
        height: 305
        color: "#ffffff"
        opacity: 0.0
        visible: false
        y: 0

        NumberAnimation on x{
        id: anim_open
        running: true
        from: 50
        to: 0
        duration: 200

        }


        Rectangle {
            id: card_menu_edit
            x: -3
            y: 112
            width: 190
            height: 36
            color: "#00000000"
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: card_menu_edit_text
                color: "#333333"
                text: qsTr("Edit")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                font.pixelSize: 14
                Behavior on scale { NumberAnimation{}}
                Behavior on color {ColorAnimation{}}
            }

            MouseArea {
                id: card_menu_edit_mouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor

                onHoveredChanged: {

                    if(card_menu_edit_mouseArea.containsMouse) {
                        card_menu_edit.color = "#337AB7"
                        card_menu_edit_text.color = "#ffffff"
                    }

                    else {
                        card_menu_edit.color = "transparent"
                        card_menu_edit_text.color = "#333333"
                    }
             }
                onPressedChanged: {

                card_menu_edit_text.scale = 0.8

                }

                onClicked: {

                card_menu_edit_text.scale = 1.0

                }
            }
        }

        Rectangle {
            id: card_menu_turnoff
            x: -2
            y: 148
            width: 190
            height: 36
            color: "#00000000"
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: card_menu_turnoff_text
                color: "#333333"
                text: ("Turn off")
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 14
                Behavior on scale { NumberAnimation{}}
                Behavior on color {ColorAnimation{}}
            }

            MouseArea {
                id: card_menu_turnoff_mouseArea
                x: 1
                y: 3
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor

                onHoveredChanged: {

                    if(card_menu_turnoff_mouseArea.containsMouse) {
                        card_menu_turnoff.color = "#337AB7"
                        card_menu_turnoff_text.color = "#ffffff"
                    }

                    else {
                        card_menu_turnoff.color = "transparent"
                        card_menu_turnoff_text.color = "#333333"
                    }
             }
                onPressedChanged: {

                card_menu_turnoff_text.scale = 0.8

                }
                onClicked: {
                    card_menu_turnoff_text.scale = 1.0
                    if (turn === 1){
                        turn = 0
                        card_foot.color = "#f6f6f6"
                        services_over_list.text = "Link"
                        services_over_list.color = "#337AB7"
                        card_menu_turnoff_text.text = "Turn off"
                        card_set_menu_image.source = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAo0lEQVQ4je2QoW5CQRBFV1YgEBUVT1QiEch+E/0CQj2CEMQLSZMV7Jt77lNNRUvCx4Fhk9WkooIjT04mM5PSg39ARMxsH21vcs7T6sdxfAH2tvtSSld9zvlJ0gegYRjmCfgCLsBF0qqGwLZ64FC97WXjfxLw3QxY11DSrgk/m8HvjT8lSQvbv7b7iHiuYSmlAwRI0mtz2uS23Tki3v78pw/u4Apxdnnr/rNMIgAAAABJRU5ErkJggg=="
                        card_item_mouseArea.enabled = true
                        card_info.enabled = false
                        card_overlay.enabled = false
                        card_info.opacity = 1.0
                        card_overlay.opacity = 1.0


                    } else if (turn === 0){
                        turn = 1
                        card_foot.color = "#F54C48"
                        services_over_list.text = "Off"
                        services_over_list.color = "#ffffff"
                        card_menu_turnoff_text.text = "Turn on"
                        card_set_menu_image.source = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAeUlEQVQ4je3QIQ9BYRiG4S8KgiAIJ4iiIPpN/AKjC2aC2TThVBOw+XGX8m2ebIJw7njtDc/eUrr+IExwwRaD8BEOOKIJ72GDFtOCq0+rONyFn8IX4feCW8A6Dvfh5/Bl+LNghkedOozDps5sMQ7v13UvzH/+064vegPGUKs4zKIEzQAAAABJRU5ErkJggg=="
                        card_item_mouseArea.enabled = false
                        card_info.opacity = 0.5
                        card_overlay.opacity = 0.5

                    }


                }
            }
        }

        Rectangle {
            id: card_menu_remove
            x: 5
            y: 182
            width: 190
            height: 36
            color: "#00000000"
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: card_menu_remove_text
                color: "#333333"
                text: qsTr("Remove")
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 14
                Behavior on scale { NumberAnimation{}}
                Behavior on color {ColorAnimation{}}
            }

            MouseArea {
                id: card_menu_remove_mouseArea
                x: 1
                y: 3
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor

                onHoveredChanged: {
                    if(card_menu_remove_mouseArea.containsMouse) {
                        card_menu_remove.color = "#337AB7"
                        card_menu_remove_text.color = "#ffffff"
                    }

                    else {
                        card_menu_remove.color = "transparent"
                        card_menu_remove_text.color = "#333333"
                    }
             }
                onPressedChanged: {

                card_menu_remove_text.scale = 0.8

                }

                onClicked: {

                card_menu_remove_text.scale = 1.0

                }
            }
        }
    }

    Rectangle {
        id: card_body_border
        width: 190
        height: 340
        color: "#00000000"
        border.color: "#cccccc"
        radius: 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

}

