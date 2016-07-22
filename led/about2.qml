import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.0 as ListItem
import Ubuntu.Components.Popups 0.1


Page {
    id: pageAbout
    title: i18n.tr("changelog")



        Column {
            id: column

            spacing: units.gu(1)
            anchors {
                topMargin: units.gu(4)
                margins: units.gu(2)
                fill: parent
            }
            Label {
                text: (" ")
            }
            Label {
                text: (" ")
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: i18n.tr("21.07.2016  v0.01 running")
            }


            }
            Label {
                text: (" ")
           }
   }

