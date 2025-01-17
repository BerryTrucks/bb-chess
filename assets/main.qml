// Navigation pane project template
import bb.cascades 1.0

NavigationPane {
    id: navigationPane
    peekEnabled: false
    Page {
        attachedObjects: [
            ComponentDefinition {                      
                id: levelSelectorDef                       
                source: "level-selector.qml"             
            },
            ComponentDefinition {                      
                id: puzzleSelectorDef                       
                source: "puzzle-selector.qml"             
            }            
        ]
        Container {
            background: backgroundPaint.imagePaint
            attachedObjects: [
                ImagePaintDefinition {
                    id: backgroundPaint
                    imageSource: "asset:///images/bg.png"
                }
            ]
            verticalAlignment: VerticalAlignment.Fill
            horizontalAlignment: HorizontalAlignment.Fill
            layout: DockLayout {
            }
            
            Container {
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                preferredWidth: 400
                Button {
                    text:  qsTr("Single player")
                    horizontalAlignment: HorizontalAlignment.Fill
                    onClicked: {                        
                        var levelSelector = levelSelectorDef.createObject();
                        levelSelector.app = app;
                        levelSelector.navigationPane = navigationPane;                        
                        navigationPane.push(levelSelector);
                    }
                    imageSource: "asset:///images/pvc.png"
                }
                Button {
                    text: qsTr("Two players")
                    horizontalAlignment: HorizontalAlignment.Fill
                    onClicked: app.StartPVP()
                    imageSource: "asset:///images/user_group.png"
                }
                Button {
                    visible: false
                    text: qsTr("Puzzles")
                    horizontalAlignment: HorizontalAlignment.Fill
                    onClicked: {
                        var puzzleSelector = puzzleSelectorDef.createObject();
                        puzzleSelector.app = app;
                        puzzleSelector.navigationPane = navigationPane;                        
                        navigationPane.push(puzzleSelector);
                        puzzleSelector.bindToDataModel();
                    }
                    imageSource: "asset:///images/puzzle.png"
                }
                Button {
                    text: qsTr("Continue")
                    horizontalAlignment: HorizontalAlignment.Fill
                    onClicked: app.Continue()
                    imageSource: "asset:///images/load.png"
                }
                Button {
                    text: qsTr("Quit")
                    horizontalAlignment: HorizontalAlignment.Center
                    onClicked: Application.quit()
                    topMargin: 80.0
                }
            }
        }
    }
}
