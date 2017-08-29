/*
 * Copyright (c) 2017 Alex Spataru <alex_spataru@outlook.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

import "../Components"

Page {
    //
    // Signals
    //
    signal aboutClicked
    signal shareClicked
    signal removeAdsClicked
    signal settingsClicked
    signal multiplayerClicked
    signal singleplayerClicked

    //
    // Sound effects
    //
    onMultiplayerClicked: app.playSoundEffect ("qrc:/sounds/effects/click.wav")
    onSingleplayerClicked: app.playSoundEffect ("qrc:/sounds/effects/game_start.wav")

    //
    // Transparent bacground
    //
    background: Item {}

    //
    // Main layout
    //
    ColumnLayout {
        spacing: 0
        anchors.fill: parent
        anchors.centerIn: parent
        anchors.margins: 2 * app.spacing

        //
        // Spacer
        //
        Item {
            Layout.fillHeight: true
        }

        //
        // App name label
        //
        Label {
            text: AppName
            font.pixelSize: app.xLargeLabel
            font.capitalization: Font.AllUppercase
            horizontalAlignment: Label.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        //
        // Subtitle
        //
        Label {
            font.pixelSize: app.mediumLabel
            font.capitalization: Font.AllUppercase
            horizontalAlignment: Label.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr ("Tic-Tac-Toe Game") + Translator.dummy
        }

        //
        // Mini-spacer
        //
        Item {
            height: 3 * app.spacing
        }

        //
        // Play button
        //
        Button {
            flat: true
            onClicked: singleplayerClicked()
            Layout.preferredWidth: app.paneWidth
            anchors.horizontalCenter: parent.horizontalCenter

            contentItem: ColumnLayout {
                spacing: app.spacing

                SvgImage {
                    fillMode: Image.Pad
                    source: "qrc:/images/play.svg"
                    verticalAlignment: Image.AlignVCenter
                    horizontalAlignment: Image.AlignHCenter
                    sourceSize: Qt.size (app.iconSize, app.iconSize)
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    font.pixelSize: app.largeLabel
                    Layout.preferredWidth: app.paneWidth
                    text: qsTr ("Play") + Translator.dummy
                    horizontalAlignment: Label.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item {
                    height: app.spacing
                }
            }
        }

        //
        // Multiplayer button
        //
        Button {
            flat: true
            onClicked: multiplayerClicked()
            font.pixelSize: app.largeLabel
            font.capitalization: Font.MixedCase
            Layout.preferredWidth: app.paneWidth
            text: qsTr ("Multiplayer") + Translator.dummy
            anchors.horizontalCenter: parent.horizontalCenter
        }

        //
        // Spacer
        //
        Item {
            Layout.fillHeight: true
        }

        //
        // Utility buttons
        //
        RowLayout {
            id: buttons
            spacing: 0.0
            Layout.fillWidth: true
            opacity: 1 - settings.opacity
            anchors.horizontalCenter: parent.horizontalCenter

            property int pxSixe: app.adsEnabled ? app.font.pixelSize - 5 :
                                                    app.font.pixelSize

            ImageButton {
                btSize: 0
                onClicked: aboutClicked()
                source: "qrc:/images/info.svg"
                font.pixelSize: buttons.pxSixe
                text: qsTr ("About") + Translator.dummy
            }

            ImageButton {
                btSize: 0
                visible: app.adsEnabled
                onClicked: removeAdsClicked()
                font.pixelSize: buttons.pxSixe
                source: "qrc:/images/no-ads.svg"
                text: qsTr ("Remove Ads") + Translator.dummy
            }

            ImageButton {
                btSize: 0
                onClicked: shareClicked()
                font.pixelSize: buttons.pxSixe
                source: "qrc:/images/share.svg"
                text: qsTr ("Share") + Translator.dummy
            }

            ImageButton {
                btSize: 0
                onClicked: settingsClicked()
                font.pixelSize: buttons.pxSixe
                source: "qrc:/images/settings.svg"
                text: qsTr ("Settings") + Translator.dummy
            }
        }

        //
        // Spacer
        //
        Item {
            Layout.fillHeight: true
        }
    }
}
