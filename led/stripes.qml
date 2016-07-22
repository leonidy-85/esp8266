import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.0 as ListItem
import QtQuick.LocalStorage 2.0
import "db.js" as DB

Page {

    id: pageLeds


    property string names
    property string ips
    property string txdescripcion


    title: i18n.tr("Manage your stripes")



        Column {
            id: columnSuperior

            spacing: units.gu(1)
            anchors {
                topMargin: units.gu(5)
                margins: units.gu(2)
                fill: parent
            }

            ListModel {
                id: dbprimary


                Component.onCompleted: DB.jobDB()
            }
//            Label {
//                text: (" ")
//            }
//            Label {
//                text: (" ")
//            }

            ListView {
                width: parent.width; height: parent.height
                model: dbprimary
                id: listing

                    delegate: Rectangle {
                        width: 475
                        height: 50
                    Text {
                            anchors.left: parent.left
                            text: name
                           color: "black"
                        }

                    Button {
                        anchors.right: parent.right
                        width: parent.width / 2 - units.gu(1)

                        text: i18n.tr("Edit")

                        onClicked: {
                            names = name
                            ips = ip
                            txdescripcion = descripcion
                            onClicked: mainStack.push(Qt.resolvedUrl("edit.qml"), {"name": name, "ip": ip,  "descripcion": descripcion} )
                            }
                   }
              }
          }
       }
}
