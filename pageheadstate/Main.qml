import QtQuick 2.4
import Ubuntu.Components 1.3

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "pageheadstate.liu-xiao-guo"

    width: units.gu(60)
    height: units.gu(85)

    Page {
        id: searchPage

        title: "Click the icon"
        Label {
            anchors.centerIn: parent
            text: searchPage.state == "search" ? "search mode" : "normal mode"
        }

        state: "default"
        states: [
            PageHeadState {
                name: "default"
                head: searchPage.head
                actions: Action {
                    iconName: "search"
                    onTriggered: searchPage.state = "search"
                }
            },
            PageHeadState {
                id: headerState
                name: "search"
                head: searchPage.head
                actions: [
                    Action {
                        iconName: "contact"
                    }
                ]
                backAction: Action {
                    id: leaveSearchAction
                    text: "back"
                    iconName: "back"
                    onTriggered: searchPage.state = "default"
                }
                contents: TextField {
                    placeholderText: "search..."
                }
            }
        ]
    }
}

