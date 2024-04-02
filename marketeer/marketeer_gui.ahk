#Include ../inventory_gui.ahk

#SingleInstance Force
SetMouseDelay 0

; Create GUI
Gui, +Resize +AlwaysOnTop
Gui, Add, Tab3, w300, Marketeer
Gui, Tab, Marketeer
Gui, Add, Button, gButtonSearchItemName, Search Item Name


Gui, Show
return
ButtonSearchItemName:
t1 := A_TickCount, X := Y := ""
graphicsearch_query := "|<>*78$101.0zzzzzzzXyTzzzzzz1nzzzzzzXwzzzzzzzDbzzzzzz3tzzzzzzyTDzzzzzy7nzzzzzzww3kSEEzwbbkSEEz1ts74Q00zt7D0Q00wFntwwMttzn6QwsttnlbntklnnzbAxtlnnb3Dbk7XbbzD9w3Xbb0STDVz7DDyS3nb7DC7wyTDyCSTwy7DCCSQztwSDQQwztyCSQQwsx0sS0tssznyQ0Nsss23tz7nnnzbwyBnnnwS"
 resultObj := graphicsearch.search(GraphicSearch_query)
 if (resultObj) {
   X := resultObj.1.x, Y := resultObj.1.y, Comment := resultObj.1.id
   ; Click, %X%, %Y%
 }

 MsgBox, 4096, Tip, % "Found :`t" Round(resultObj.MaxIndex())
   . "`n`nTime  :`t" (A_TickCount-t1) " ms"
   . "`n`nPos   :`t" X ", " Y
   . "`n`nResult:`t" (resultObj ? "Success !" : "Failed !")

 for i,v in resultObj
   if (i<=2)
     graphicsearch.mouseTip(resultObj[i].x, resultObj[i].y)

 ;GraphicSearchAndClick(graphicsearch_query, SCREEN_SEARCH_COORDINATES.WHOLE_SCREEN, "Left", false)

 return