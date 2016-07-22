import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.0 as ListItem
import Ubuntu.Components.Popups 0.1


Page {
    id: pageAbout
    title: i18n.tr("About")



        Column {
            id: column

            spacing: units.gu(1)
            anchors {
                topMargin: units.gu(4)
                margins: units.gu(2)
                fill: parent
            }
            Image {
                id: image1
                anchors.horizontalCenter: parent.horizontalCenter
                width: 200
                height: 150
                source: "led.png"
            }

            Label {
                text: (" ")
            }
            Label {
                text: (" ")
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: i18n.tr("led for ESP8266")
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: i18n.tr("v0.2")
            }


            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: i18n.tr("leonidy85@gmail.com")
            }


            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: i18n.tr("2016")
            }
            Label {
                text: (" ")
            }
            Button {
                       text: "PayPal USD"
                       width: 300
                       anchors.horizontalCenter: parent.horizontalCenter
                       onClicked: {
                           Qt.openUrlExternally("https://www.paypal.com/")
                       }
                   }

        }

//        Tab {
//                    id: options
//                    title: i18n.tr("about")
//                    page: Loader {
//                        parent: about
//                          anchors.centerIn: parent
//                        source: (tabs.selectedTab === options) ? Qt.resolvedUrl("about.qml") : ""
//                    }
//                }

//        Tab {
//                    id: edit
//                    title: i18n.tr("changelog")
//                    page: Loader {
//                        parent: about2
//                        anchors.centerIn: parent
//                        source: (tabs.selectedTab === edit) ? Qt.resolvedUrl("about2.qml") : ""
//                    }

//        }


    }

