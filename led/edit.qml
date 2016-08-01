/*
 * Copyright 2015 uRadio Team
 *
 * This file is part of uRadio.
 *
 * uRadio is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * uRadio is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.0 as ListItem
import Ubuntu.Components.Popups 0.1
import QtQuick.LocalStorage 2.0
import "db.js"  as DB

Page {
    id: pageLed
    title: i18n.tr("Manage stripes")


    property string name
    property string ip
    property string descripcion

    head.actions: [
        Action {
            iconName: "delete"
            onTriggered: {
                PopupUtils.open(dialog)
            }
            text: i18n.tr("Delete")
        }

    ]


    Item {
        Component {
        id: dialog
            Dialog {
                id: dialogs
                title: i18n.tr("Do you want to delete the") + " " + name + " " + i18n.tr("?")
                Button {
                    text: i18n.tr("Accept")
                    color: "green"
                    onClicked: {
                    DB.del(name)
                    PopupUtils.close(dialogs)
                    bguradar.text = i18n.tr("led has been deleted")
                    names.text = " "
                    ips.text = " "
                    txdescripcion.text = " "
                   // settings.estado = "true"
                    }
                }
                Button {
                    text: i18n.tr("Cancel")
                    color: "red"
                    onClicked: PopupUtils.close(dialogs)
                }
            }
        }
    }

    Flickable {
        id: flickable

        anchors.fill: parent
        contentHeight: parent.height + units.gu(2)
        contentWidth: parent.width

        ListItem.Header {
            text: i18n.tr("Configure your stripes")
        }

        Column {
            id: columnSuperior

            spacing: units.gu(1)
            anchors {
                topMargin: units.gu(4)
                margins: units.gu(2)
                fill: parent
            }

            Label {
                text: " "
            }

            Label {
                text: i18n.tr("Stripes name:")
            }

            TextField {
                id: names
                errorHighlight: false
                width: parent.width
                height: units.gu(4)
                font.pixelSize: FontUtils.sizeToPixels("medium")
                text: name
            }


            TextField {
                id: ips
                errorHighlight: false
                width: parent.width
                height: units.gu(4)
                font.pixelSize: FontUtils.sizeToPixels("medium")
                text: ip
            }


            Label {
                text: i18n.tr("Description:")
            }

            TextArea {
                id: txdescripcion
                width: parent.width
                height: units.gu(8)
                font.pixelSize: FontUtils.sizeToPixels("medium")
                text: descripcion
            }

            Button {
                id: save
                width: parent.width
                text: i18n.tr("Save changes")
                onClicked: {
                    DB.del(name)
                    DB.insert(names.text, ips.text, txdescripcion.text)
                    save.text = i18n.tr("Changes has been saved")
                    settings.state = "true"
                }
            }

            ListItem.Header {
            }

            Label {
                id: info
                width: parent.width
                text: ""
            }
        }
    }
}
