/* Example: Combobox [Dropdown] Component for QML and C++
 * Author: Kambiz Asadzadeh
 * Back-end: C++
 * Front-End: QML, JavaScript
 * Official website : https://nanosoftco.com
 * Official Iranian C++ website : https://iostream.ir
*/


import QtQuick 2.7
import QtQuick.Window 2.2
import Component.Nanosoft 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    MyComponent {
        id:mycom
    }

    Dropdown {
        id: comboBoxType
        dwidth: 230
        dheight: 35
        title.text: "-لطفا انتخاب کنید-"

        item.model: mycom.listItem();

        onTitle_textChanged: {
            if(comboBoxType.title.text == "سه") {
                console.log("Item 3 is selected!");
            } else {
                console.log("This is not my item!");
            }
        }

        anchors.centerIn: parent


    }


}
