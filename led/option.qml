import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.0 as ListItem
import QtQuick.LocalStorage 2.0
import "db.js" as DB

Page {
    id: pageAdd


    title: i18n.tr("Add stripes")
    Flickable {
        id: flickable

        anchors.fill: parent
        contentHeight: parent.height + units.gu(2)
        contentWidth: parent.width

        Column {
            id: columnSuperior

            spacing: units.gu(1)
            anchors {
                topMargin: units.gu(5)
                margins: units.gu(2)
                fill: parent
            }

            Label {
                text: i18n.tr("Write the name of the led stipe:")
            }

            TextField {
                id: name
                errorHighlight: false
                width: parent.width
                height: units.gu(4)
                font.pixelSize: FontUtils.sizeToPixels("medium")
                text: i18n.tr("led")
            }
            Label {
                text: i18n.tr("Enter the ip of the led strip:")
            }

            TextField {
                id: ip
                errorHighlight: false
                width: parent.width
                height: units.gu(4)
                font.pixelSize: FontUtils.sizeToPixels("medium")
                text: i18n.tr("192.168.0.1")
            }


            Label {
                text: i18n.tr("Write a short description:")
            }

            TextArea {
                id: descripcion
                width: parent.width
                height: units.gu(8)
                font.pixelSize: FontUtils.sizeToPixels("medium")
                text: ''
            }
            Button {
                id: save
                width: parent.width
                text: i18n.tr("Save options")
                onClicked: {
                    DB.insert(name.text, ip.text, descripcion.text)
                    save.text = i18n.tr("Options saved")
                }
            }

        }
    }
}
