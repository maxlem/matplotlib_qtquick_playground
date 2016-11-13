import Backend 1.0
import QtQuick 2.6
import QtQuick.Layouts 1.2
import Qt.labs.controls 1.0
import QtQuick.Dialogs 1.2

Item{           
    width: 760
    height: 480

    ColumnLayout {
        spacing : 0
        anchors.fill: parent
        

        FigureCanvas {
            id: mplView
            objectName : "figure"
                        
            Layout.fillWidth: true
            Layout.fillHeight: true
            
            Layout.minimumWidth: 10
            Layout.minimumHeight: 10
        }
        
        MessageDialog {
            id: messageDialog
        }
        
        FileDialog {
            id: saveFileDialog
            title: "Choose a filename to save to"
            folder: mplView.defaultDirectory
            nameFilters: mplView.fileFilters
            selectedNameFilter: mplView.defaultFileFilter
            selectExisting: false
            
            onAccepted: {
                try{
                    mplView.print_figure(fileUrl)
                }
                catch (error){
                    messageDialog.title = "Error saving file"
                    messageDialog.text = error
                    messageDialog.icon = StandardIcon.Critical
                    messageDialog.open()
                }
            }
        } 

        ToolBar {
            id: toolbar
            
            Layout.alignment: Qt.AlignLeft | Qt.Bottom
            Layout.fillWidth: true
        
            RowLayout {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                anchors.fill: parent
                spacing: 0
                
                ToolButton {
                    id : home
                    contentItem: Image{
                        fillMode: Image.PreserveAspectFit
                        source: "image://mplIcons/home"
                    }
                    onClicked: {
                        mplView.home()
                    }
                }     
                
                ToolButton {
                    id : back
                    contentItem: Image{
                        fillMode: Image.PreserveAspectFit
                        source: "image://mplIcons/back"
                    }
                    onClicked: {
                        mplView.back()
                    }
                }     
                
                ToolButton {
                    id : forward
                    
                    contentItem: Image{
                        fillMode: Image.PreserveAspectFit
                        source: "image://mplIcons/forward"
                    }
                    onClicked: {
                        mplView.forward()
                    }
                }     

                // Fake separator
                Label {
                    text : "|"
                }
                
                ButtonGroup {
                // Gather pan and zoom tools to make them auto-exclusive
                    id: pan_zoom
                }
                
                ToolButton {
                    id : pan
                    
                    contentItem: Image{
                        fillMode: Image.PreserveAspectFit
                        source: "image://mplIcons/move"
                    }
                    
                    ButtonGroup.group: pan_zoom
                    checkable: true
                    
                    onClicked: {
                        mplView.pan()
                    }
                }     
                
                ToolButton {
                    id : zoom
                    
                    contentItem: Image{
                        fillMode: Image.PreserveAspectFit
                        source: "image://mplIcons/zoom_to_rect"
                    }
                    
                    ButtonGroup.group: pan_zoom
                    checkable: true
                    
                    onClicked: {
                        mplView.zoom()
                    }
                }   

                Label {
                    text : "|"
                }
                
                ToolButton {
                    id : subplots
                    contentItem: Image{
                        fillMode: Image.PreserveAspectFit
                        source: "image://mplIcons/subplots"
                    }
                    onClicked: {
                    }
                }
                
                ToolButton {
                    id : save
                    contentItem: Image{
                        fillMode: Image.PreserveAspectFit
                        source: "image://mplIcons/filesave"
                    }
                    onClicked: {
                        saveFileDialog.open()
                    }
                }      
                
                Item {
                    Layout.fillWidth: true
                }
                
                Label{
                    id: locLabel
                    
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    
                    text: mplView.message
                }
            }
        }
    }
}    