/*========================================================
  Copyright (C) 2016 Nanosoft Corporation
  Programmer & Developer : Kambiz Asadzadeh
  E-Mail : kambiz.ceo@gmail.com | kambiz@nanosoftco.com
  Official website : https://nanosoftco.com
  Official C++ refrence: https://iostream.ir
*=========================================================*/

import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    CardInfo {

        anchors.centerIn: parent

        //Example usage
        title: "Hello"
        desc: "My name is Kambiz!"

        //iconLetterText         :    //for icon_letter text
        //iconLetterTextColor    :    //for icon_letter text
        //iconLetterColor        :    //for icon_letter color
        //mouseArea              :    //for mouse area

        //edit_mouseArea              :   //for edit mouse area
        //turnOff_mouseArea           :   //for edit mouse area
        //remove_mouseArea            :   //for edit mouse area
    }

}
