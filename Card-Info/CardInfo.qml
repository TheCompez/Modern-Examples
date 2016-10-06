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

    property alias iconLetterText         :    icon_letter_text.text    //for icon_letter text
    property alias iconLetterTextColor    :    icon_letter_text.color   //for icon_letter text
    property alias iconLetterColor        :    icon_letter.color        //for icon_letter color
    property alias mouseArea              :    card_item_mouseArea      //for mouse area

    property alias edit_mouseArea              :    card_menu_edit_mouseArea //for edit mouse area
    property alias turnOff_mouseArea           :    card_menu_turnoff_mouseArea //for edit mouse area
    property alias remove_mouseArea            :    card_menu_remove_mouseArea //for edit mouse area


    width: 190
    height: 300

    property int turn: 0 // turning on/off status 0 is Enable / 1 is Disable

    Rectangle {
        id: card_body
        width: 190
        height: 300
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
        height: 300
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

            Rectangle {
                id: icon_letter
                width: 150
                height: 150
                color: "#87cefa"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Behavior on scale { NumberAnimation { duration: 300 } }

                Text {
                    id: icon_letter_text
                    color: "#ffffff"
                    text: qsTr("K")
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 90
                }
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

        MouseArea {
            id: card_item_mouseArea
            anchors.bottomMargin: 36
            anchors.fill: parent

            hoverEnabled: true
            cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor

            onHoveredChanged: {

                if(card_item_mouseArea.containsMouse) {
                    card_overlay.color = "#e6e6e6"
                }

                else {
                    card_overlay.color = "#ffffff"

                }
            }

            onPressedChanged: {

                icon_letter.scale = 0.8

            }

            onClicked: {

                icon_letter.scale = 1.0

            }

        }
    }


    Rectangle {
        id: card_menu_in
        x: 5
        width: 190
        height: 305
        color: "#ffffff"
        opacity: 0
        visible: false
        y: 5

        NumberAnimation on x{
            id: anim_open
            running: true
            from: 50
            to: 5
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
        height: 300
        color: "#00000000"
        border.color: "#cccccc"
        radius: 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

}

