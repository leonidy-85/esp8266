import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Pickers 1.3
import Qt.labs.settings 1.0
import QtQuick.LocalStorage 2.0
import "db.js" as DB

MainView {
    objectName: "mainView"
    applicationName: "led"


    width: units.gu(100)
    height: units.gu(75)
    theme.name: "Ubuntu.Components.Themes.SuruDark"

    PageStack {
        id: mainStack
        Component.onCompleted: {
            push(tabs)
        }
    }
    Tabs {
        id: tabs
        Tab {
            id: main
            title: "Control Led"


            Page {
                id: rootPage


                head.actions: [
                    Action {
                        iconName: "close"
                        onTriggered: {
                            settings.state = "false"
                            Qt.quit()
                        }
                        text: i18n.tr("Close aplication")
                    }

                ]
                Settings {
                    id: settings
                    property string state: "false"
                }


                Column {
                    id: col1
                    spacing: units.gu(1)
                    anchors {
                        margins: units.gu(2)
                        fill: parent
                    }


                    ListModel {
                        id: dbprimary

                        Component.onCompleted: {
                            DB.jobDB()
                            restartdb.start()
                        }
                    }


                    Timer {
                        id: restartdb
                        interval: 5000; triggeredOnStart: true; running: true; repeat: true
                        onTriggered: {
                            if (settings.state !== "true") {
                                dbprimary.clear()
                                DB.jobDB()
                                settings.state = "false"
                            }
                        }
                    }


                    OptionSelector {
                        id:os1
                        containerHeight: parent.height - col2.height *2 - units.gu(2)
                        text: i18n.tr("Select a led:")
                        model: dbprimary
                        expanded: false
                        delegate: OptionSelectorDelegate { text: name }
                    }

                    Label {
                        text: (" ")
                    }

                    Label {
                        id:describe
                        font.pixelSize: units.gu(1.8)
                        width: parent.width
                        anchors.horizontalCenter:parent.horizontalCenter
                        text: {Text:describe}
                    }

                    Label {
                        text: (" ")
                    }

                    Label {
                        id: brightness
                        anchors.left: parent.left
                    }
                    Slider {
                        function formatValue(v) {
                            brightness.text='Brightness '+v.toFixed(0)
                            var channel = os1.selectedIndex;
                            DB.lightled(v.toFixed(0), channel)
                            return
                        }
                        minimumValue: 0
                        maximumValue: 255
                        value: 125
                        live: true
                    }
                    Label {
                        id:timer
                        anchors.left: parent.left
                        text: i18n.tr("Timer" )
                    }

                    Slider {
                        function formatValue(v) {
                            var channel = os1.selectedIndex;
                            timer.text='Timer '+v.toFixed(0)
                            DB.timerled(v.toFixed(0), channel)
                            return
                        }
                        minimumValue: 0
                        maximumValue: 60
                        value: 0
                        live: true
                    }



                }
                Column{
                    id: col2
                    spacing: units.gu(1)
                    anchors {
                        margins: units.gu(2)
                        bottom: parent.bottom
                        left: parent.left
                        right: parent.right
                    }


                    Row{
                        spacing: units.gu(2)
                        anchors.horizontalCenter:parent.horizontalCenter

                        Button{
                            id: light
                            color: "#068706"
                            width: units.gu(14)
                            height: units.gu(6)
                            text: i18n.tr("On")
                            onClicked:{
                                var channel = os1.selectedIndex;
                                // col2.ledChannel(channel);
                                describe.text = dbprimary.get(channel).descripcion
                                //led.text = rootPage.ip + dbprimary.get(channel).name

                                if (settings.state !== "false") {
                                    light.text=i18n.tr("Off")
                                    DB.onled(1,channel);
                                    settings.state = "false"
                                    //stat.text = i18n.tr("Off")
                                    // console.log('off')

                                }
                                else  {
                                    light.text="On"
                                    DB.onled(0,channel);
                                    settings.state = i18n.tr("true")

                                    //stat.text = i18n.tr("On")
                                    //   console.log('on')

                                }
                            }
                        }
                    }
                }
            }
        }

        Tab {
            id: options
            title: i18n.tr("Add stripes")
            page: Loader {
                parent: config
                anchors.fill: parent
                source: (tabs.selectedTab === options) ? Qt.resolvedUrl("option.qml") : ""
            }
        }

        Tab {
            id: edit
            title: i18n.tr("Edit led")
            page: Loader {
                parent: edit
                anchors.fill: parent
                source: (tabs.selectedTab === edit) ? Qt.resolvedUrl("stripes.qml") : ""
            }

        }

        Tab {
            id: about
            title: i18n.tr("About")
            page: Loader {
                parent: config
                anchors.fill: parent
                source: (tabs.selectedTab === about) ? Qt.resolvedUrl("about.qml") : ""
            }
        }
        Tab {
            id: wiki
            title: i18n.tr("Wiki")
            page: Loader {
                parent: config
                anchors.fill: parent
                source: (tabs.selectedTab === wiki) ? Qt.resolvedUrl("wiki.qml") : ""
            }
        }
    }
}
