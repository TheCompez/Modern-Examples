//
//  File : contactlist.cpp
//  Class or Function (ContactList)
//
//  Created by Kambiz Asadzadeh on 2018/7/19.
//  Copyright © 2018 Kambiz Asadzadeh. All rights reserved.
//  Official Website : http://kambizasadzadeh.com
//  Powered by : Dotwaves LLC (http://dotwaves.com)
//


#include "contactlist.h"

using namespace Contact;

ContactList::ContactList(QObject *parent)
  : QObject(parent)
{
}

ContactList::ContactList(

    const QString &name,
    const QString &family,
    const QString &phone,
    const QString &device,
    const QString &avatar,
    const QString &color,
    const QString &url,
    QObject *parent

    )

  : QObject(parent),

    m_name    (name),
    m_family  (family),
    m_phone   (phone),
    m_device  (device),
    m_avatar  (avatar),
    m_color   (color),
    m_url     (url)
{
}

ContactList::~ContactList() {}

QString ContactList::name() const
{
  return m_name;
}

void ContactList::setName(const QString &name)
{
  if (name != m_name) {
      m_name = name;
      emit nameChanged();
    }
}

QString ContactList::family() const
{
  return m_family;
}

void ContactList::setFamily(const QString &family)
{
  if (family != m_family) {
      m_family = family;
      emit familyChanged();
    }
}

QString ContactList::phone() const
{
  return m_phone;
}

void ContactList::setPhone(const QString &phone)
{
  if (phone != m_phone) {
      m_phone = phone;
      emit phoneChanged();
    }
}

QString ContactList::device() const
{
  return m_device;
}

void ContactList::setDevice(const QString &device)
{
  if (device != m_device) {
      m_device = device;
      emit deviceChanged();
    }
}

QString ContactList::avatar() const
{
  return m_avatar;
}

void ContactList::setAvatar(const QString &avatar)
{
  if (avatar != m_avatar) {
      m_avatar = avatar;
      emit avatarChanged();
    }
}

QString ContactList::color() const
{
  return m_color;
}

void ContactList::setColor(const QString &color)
{
  if (color != m_color) {
      m_color = color;
      emit colorChanged();
    }
}


QString ContactList::url() const
{
  return m_url;
}

void ContactList::setUrl(const QString &url)
{
  if (url != m_url) {
      m_url = url;
      emit urlChanged();
    }
}
