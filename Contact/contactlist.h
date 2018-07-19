//
//  File : contactlist.h
//  Class or Function (ContactList)
//
//  Created by Kambiz Asadzadeh on 2018/7/19.
//  Copyright © 2018 Kambiz Asadzadeh. All rights reserved.
//  Official Website : http://kambizasadzadeh.com
//  Powered by : Dotwaves LLC (http://dotwaves.com)
//


#ifndef CONTACTLIST_H
#define CONTACTLIST_H

#include <QObject>

//Namespace Contact
namespace Contact {

  class ContactList;
  class ContactList : public QObject
  {
    Q_OBJECT

    Q_PROPERTY ( QString name    READ name   WRITE setName   NOTIFY nameChanged   )
    Q_PROPERTY ( QString family  READ family WRITE setFamily NOTIFY familyChanged )
    Q_PROPERTY ( QString phone   READ phone  WRITE setPhone  NOTIFY phoneChanged  )
    Q_PROPERTY ( QString device  READ device WRITE setDevice NOTIFY deviceChanged )
    Q_PROPERTY ( QString avatar  READ avatar WRITE setAvatar NOTIFY avatarChanged )
    Q_PROPERTY ( QString color   READ color  WRITE setColor  NOTIFY colorChanged  )
    Q_PROPERTY ( QString url     READ url  WRITE setUrl      NOTIFY urlChanged  )

  public:
    ContactList(QObject *parent=0);
    ContactList(
        const QString &name,
        const QString &family,
        const QString &phone,
        const QString &device,
        const QString &avatar,
        const QString &color,
        const QString &url,
        QObject *parent=0
        );

    ~ContactList();

    QString name    () const;
    QString family  () const;
    QString phone   () const;
    QString device  () const;
    QString url     () const;

    void setName    (const QString &name);
    void setFamily  (const QString &family);
    void setPhone   (const QString &phone);
    void setDevice  (const QString &device);
    void setUrl     (const QString &url);


    //Avatar of user

    QString avatar  () const;
    void setAvatar  (const QString &image);

    //Color of user
    QString color   () const;
    void setColor   (const QString &color);

  signals:
    void nameChanged    ();
    void familyChanged  ();
    void phoneChanged   ();
    void deviceChanged  ();
    void avatarChanged  ();
    void colorChanged   ();
    void urlChanged     ();

  private:
    QString m_name;
    QString m_family;
    QString m_phone;
    QString m_device;
    QString m_avatar;
    QString m_color;
    QString m_url;
  };

}


#endif // CONTACTLIST_H
