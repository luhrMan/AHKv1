
#Include %A_ScriptDir%\node_modules
#Include graphicsearch.ahk\export.ahk
SLEEP_TIME := 30
;MOUSE_SPEED := 1
;SendMode "Event"
;------------------------------------------------------------------------------------------------- Functions
/*
 ; Function to perform image search and click
PerformImageClick(ImagePath, Coordinates:=[0, 0, A_ScreenWidth, A_ScreenHeight], ShiftUse:=false, MouseBtn:="Left") {
    if ImageSearch(&FoundX, &FoundY, Coordinates[1], Coordinates[2], Coordinates[3], Coordinates[4], ImagePath){
        ClickX := FoundX
        ClickY := FoundY
        Click MouseBtn, ClickX, ClickY
    }
    Sleep SLEEP_TIME
}

PerformImageClickAndDrag(ImagePath, Coordinates:=[0, 0, A_ScreenWidth, A_ScreenHeight], DragX:=0, DragY:=0) {
    if ImageSearch(&FoundX, &FoundY, Coordinates[1], Coordinates[2], Coordinates[3], Coordinates[4], ImagePath){
        ClickX := FoundX
        ClickY := FoundY
        MouseClickDrag "Left", ClickX, ClickY, DragX, DragY,, 2
    }
    Sleep SLEEP_TIME
}

PerformPixelSearch(Color:=0x111111, Coordinates:=[0, 0, A_ScreenWidth, A_ScreenHeight], ShiftUse:=false, MouseBtn:="Right") {
    PixelSearch &FoundX, &FoundY, Coordinates[1], Coordinates[2], Coordinates[3], Coordinates[4], Color
    ClickX := FoundX
    ClickY := FoundY

    if (ShiftUse){
        Send "{Shift down}"
        Click MouseBtn, ClickX, ClickY
        Send "{Shift up}"
    } else {
        Click MouseBtn, ClickX, ClickY
    }
    Sleep SLEEP_TIME
} */
GraphicSearchAndClick(itemQuery, searchCoords, mouseBtn, shiftDown:=false){
    local resultObj := oGraphicSearch.search(itemQuery, {x1: searchCoords.1, x2: searchCoords.3, y1: searchCoords.2, y2: searchCoords.4})
    if (resultObj) {
      local counter := 0
      if shiftDown
        Send {shift down}
      for _, object in resultObj{
        counter++
        X := object.x, Y := object.y
        Click, %X%, %Y%, %mouseBtn%
        if (counter == 50){
          Send {shift up}
          break
        }
      }
      Send {shift up}
    }
    return
  }