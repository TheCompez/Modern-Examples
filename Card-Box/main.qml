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

   CardBox {

       anchors.centerIn: parent

       /*

       title                  :    title.text               //for title
       desc                   :    desc.text                //for desc
       image                  :    card_img.source          //for image 128 x 128 Pixel
       mouseArea              :    card_item_mouseArea      //for mouse area
       service_over_text      :    services_over_list.text  //for service title

       edit_mouseArea              :    card_menu_edit_mouseArea //for edit mouse area
       turnOff_mouseArea           :    card_menu_turnoff_mouseArea //for edit mouse area
       remove_mouseArea            :    card_menu_remove_mouseArea //for edit mouse area

       */

   }

}
