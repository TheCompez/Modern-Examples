#include "dropdown.h"
#include <QStringList>

Dropdown::Dropdown()
{

}

QStringList Dropdown::listItem() {

    QStringList qstr;
        qstr << "یک"
             << "دو"
             << "سه"
             << "چهار"
             << "پنج";
    return qstr;
}
