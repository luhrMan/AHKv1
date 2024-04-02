#Include inventory_gui_variables.ahk
;#Include inventory_gui_util.ahk
#Include findText.ahk
#Include %A_ScriptDir%\node_modules
#Include graphicsearch.ahk\export.ahk

#SingleInstance Force
SetMouseDelay 0
oGraphicSearch := new graphicsearch()
;#Warn
;------------------------------------------------------------------------------------------------- GUI setup
; Create GUI
Gui, +Resize +AlwaysOnTop

Gui, Add, Tab3, w300, Test|Inventory Management|Dungeon Setup|Trade
Gui, Tab, Test
;Gui, Add, Button, gButtonTestStashCollectiblesCollection, TEST stash colectibles
;Gui, Add, Button, gButtonTestInv, Test Each Square
;Gui, Add, Button, gButtonTestAllTreasuresSearch, Test all treasures search
Gui, Add, Button, gButtonTestQuerySearch, Query search
Gui, Add, Button, gButtonTestImageSearch, Image search
Gui, Add, Edit, XP+100 w50
Gui, Add, UpDown, vVariantUD Range0-150, 5

;---------------------------------------------------------------------------Inventory Management Tab
Gui, Tab, Inventory Management
Gui, Add, Text, Section, Move From:
Gui, Add, DropDownList, vImageRecognitionArea ys, Inventory|Stash
GuiControl, Choose, ImageRecognitionArea, 1
Gui, Add, Button, gButtonMoveGold, Move Gold
Gui, Add, CheckBox, vGoldCoinChkBox Checked, Gold Coins
Gui, Add, CheckBox, vGoldBagChkBox Checked, Gold Bags
Gui, Add, Text, Section xs,  
Gui, Add, Button, gButtonEmptyInventory, Empty Inventory

Gui, Add, Button, gButtonClearNotifications, Clear Notifications

;-----------------------------------------------------------------------------Dungeon Setup Tab
Gui, Tab, Dungeon Setup


Gui, Add, Text, Section,

Gui, Add, Text, XS, (MS) Gold Bags
Gui, Add, Edit, XP+100 w50
Gui, Add, UpDown, vGoldBagsUD Range0-50, 2

Gui, Add, Text, XS, (MS) Bandages
Gui, Add, Edit, XP+100 w50
Gui, Add, UpDown, vBandagesUD Range0-5, 3

Gui, Add, Text, XS, (MS) Heal Pots
Gui, Add, Edit, XP+100 w50
Gui, Add, UpDown, vHealPotsUD Range0-5, 3

Gui, Add, Text, XS, (S) Protection Pots
Gui, Add, Edit, XP+100 w50
Gui, Add, UpDown, vProtPotsUD Range0-5, 0

Gui, Add, CheckBox, vCampfireChkBox XS, (MS) Campfire
Gui, Add, CheckBox, vSurgicalKitChkBox XS, (S) Surgical Kit
Gui, Add, CheckBox, vLockpicksChkBox XS, (S) Lockpicks
Gui, Add, CheckBox, vCrossbowChkBox, (M) Crossbow and 15 Bolts

Gui, Add, CheckBox, vCheckStashChkBox, Check (S)tash before (M)erchants?


Gui, Add, Button, gButtonSetupInventory XSS, Setup Inventory
Gui, Add, Button, gButtonSellTreasures XSS, Sell Treasures



;-----------------------------------------------------------------------------Trade Tab
Gui, Tab, Trade
;Gui, Add, Text, Section, Trade
Gui, Add, Button, gButtonMoveGoldTrade, Move Gold Trade
Gui, Add, Button, gButtonCheckTradeItems, Check Trade Items

Gui, Show
return
;------------------------------------------------------------------------------------------------------Hotkeys
*ESC::ExitApp

#IfWinActive ahk_exe DungeonCrawler.exe
!s Up:: ; alt + s
  SellEquippedItem(){
    MouseGetPos, firstX, firstY
    Click, %firstX%, %firstY%, Right
    Sleep 100
    X := SCREEN_SEARCH_COORDINATES.PLAYER_INVENTORY_MERCHANT.1 + 25
    Y := SCREEN_SEARCH_COORDINATES.PLAYER_INVENTORY_MERCHANT.2 + 25
    Click, %X%, %Y%, Left
    Sleep 200
    X := BUTTON_MAKE_DEAL.X
    Y := BUTTON_MAKE_DEAL.Y
    Click, %X%, %Y%, Left
    MouseMove, %firstX%, %firstY%
    return
  }

;------------------------------------------------------------------------------------------------------Functions
CheckActiveWindow(){
  if (WinExist("Dark and Darker"))
  {
    WinActivate
    WinWaitActive
  }
  return
}

GraphicSearchAndClick(itemQuery, searchCoords, mouseBtn, shiftDown:=false, maxClicks:=50){
  local resultObj := oGraphicSearch.search(itemQuery, {x1: searchCoords.1, x2: searchCoords.3, y1: searchCoords.2, y2: searchCoords.4})
  if (maxClicks = 0)
  {
    MouseMove, resultObj.1.x, resultObj.1.y
    return resultObj
  }

  if (resultObj) {
    if shiftDown
      Send {shift down}
    for _, object in resultObj{
      X := object.x, Y := object.y
      Click, %X%, %Y%, %mouseBtn%
      if (A_Index == maxClicks)
      {
        Send {shift up}
        break
      }
    }
    Send {shift up}
    return resultObj
  }
  return
}

BuyObject(item, merchant, amount){
  SetMouseDelay 2
  GraphicSearchAndClick(MerchantsButtonQuery, SCREEN_SEARCH_COORDINATES.TOP_MENU, "Left", false)
  Sleep 100
  GraphicSearchAndClick(merchant, SCREEN_SEARCH_COORDINATES.WHOLE_SCREEN, "Left", false)
  Sleep 100
  GraphicSearchAndClick(item, SCREEN_SEARCH_COORDINATES.MERCHANT_INVENTORY, "Left", false)
  Sleep 100
  FillX:= BUTTON_FILL_ALL_IN_STASH.X, FillY:= BUTTON_FILL_ALL_IN_STASH.Y
  DealX := BUTTON_MAKE_DEAL.X, DealY := BUTTON_MAKE_DEAL.Y
  Loop %amount%
  {
    Click, %FillX%, %FillY%, Left
    Sleep 100
    Click, %DealX%, %DealY%, Left
    Sleep 100
  }
  GraphicSearchAndClick(BackButtonQuery, SCREEN_SEARCH_COORDINATES.TOP_MENU, "Left", false)
  return
}

CheckStashForItem(itemQuery, amount){
  SetMouseDelay 3
  GraphicSearchAndClick(StashButtonQuery, SCREEN_SEARCH_COORDINATES.TOP_MENU, "Left", false)
  Sleep 100
  foundObj := GraphicSearchAndClick(itemQuery, SCREEN_SEARCH_COORDINATES.STASH_INVENTORY, "Right", true, amount)

  if !foundObj
    return 0
  else if (foundObj.Count() >= %amount%)
    return %amount%
  else
    return (%amount%-foundObj.Count())
  return
}

ClearNotifications(){
  SetMouseDelay 5
  GraphicSearchAndClick(MerchantsButtonQuery, SCREEN_SEARCH_COORDINATES.TOP_MENU, "Left", false, 1)
  Loop
  {
    merchantNotificationsObj := GraphicSearchAndClick(MerchantNotificationQuery, SCREEN_SEARCH_COORDINATES.WHOLE_SCREEN, "Left", false, 0)
  } 
  Until merchantNotificationObj || A_Index = 5

  for _, object in merchantNotificationObj{
    X := object.x, Y := object.y
    Click, %X%, %Y%, "Left"
    Sleep 200
    GraphicSearchAndClick(QuestsButtonQuery, SCREEN_SEARCH_COORDINATES.WHOLE_SCREEN, "Left", false)
    questNotificationAmount := GraphicSearchAndClick(QuestNotificationQuery, SCREEN_SEARCH_COORDINATES.MERCHANT_INVENTORY, "Left", false, 0)
  
    for _, object in questNotificationAmount{
      X := object.x, Y := object.y
      Click, %X%, %Y%, "Left"
      GraphicSearchAndClick(AcceptButtonQuery, SCREEN_SEARCH_COORDINATES.WHOLE_SCREEN, "Left", false, 1)
    }
    GraphicSearchAndClick(BackButtonQuery, topMenuBarCoord, "Left", false, 1)
  }
  return
}
;BUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONS
;BUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONSBUTTONS------------Tab 1 Inven Management
ButtonMoveGold:
CheckActiveWindow()
SetMouseDelay 1
GuiControlGet, ImageRecognitionArea
searchCoords := ImageRecognitionArea = "Inventory" ? SCREEN_SEARCH_COORDINATES.PLAYER_INVENTORY_STASH : SCREEN_SEARCH_COORDINATES.STASH_INVENTORY

GuiControlGet, GoldCoinChkBox
GuiControlGet, GoldBagChkBox
allQueries := AnyGoldBagQuery GoldCoinQuery
/* 
if (searchCoords == SCREEN_SEARCH_COORDINATES.STASH_INVENTORY) && GoldBagChkBox && !GoldCoinChkBox
  emptyInvSlotsForBags := oGraphicSearch.search(EmptyItemSlotQuery, {x1: searchCoords.1, x2: searchCoords.3, y1: searchCoords.2, y2: searchCoords.4}).Count()
MsgBox % emptyInvSlotsForBags
*/
if (GoldBagChkBox && GoldCoinChkBox)
{
  GraphicSearchAndClick(allQueries, searchCoords, "Right", true)
}
else if (GoldCoinChkBox)
{
  GraphicSearchAndClick(GoldCoinQuery, searchCoords, "Right", true)
}
else if (GoldBagChkBox)
{
  GraphicSearchAndClick(AnyGoldBagQuery, searchCoords, "Right", true)
}
ToolTip Done
return

ButtonEmptyInventory:
CheckActiveWindow()
SetMouseDelay 1
i := PLAYER_INVENTORY_STASH
Send {shift down}
while (findText().PixelSearch(X, Y, i.1, i.2, i.3, i.4, ItemBlueBackgroundColor))
{
  Click %X%, %Y%, Right
}
Send {shift up}

ToolTip Done
return

ButtonClearNotifications:
CheckActiveWindow()
SetMouseDelay 1
ClearNotifications()
ToolTip Done
return

;-------------------------------------------------------------------------------------------------------------------------Tab 2 Buy & Setup
ButtonSetupInventory:
CheckActiveWindow()
SetMouseDelay 3
searchCoords := PLAYER_INVENTORY_STASH
GuiControlGet, GoldBagsUD
GuiControlGet, HealPotsUD
GuiControlGet, BandagesUD
GuiControlGet, CheckStashChkBox
GuiControlGet, CrossbowChkBox

if GoldBagsUD != 0
{
  found := 0
  if CheckStashChkBox
    found := CheckStashForItem(GOLD_BAG_COLLECTION_IMAGES.STASH_EMPTY_GOLD_BAG, GoldBagsUD)
  if (found < GoldBagsUD)
    BuyObject(GOLD_BAG_COLLECTION_IMAGES.MERCHANT_EMPTY_GOLD_BAG, TreasurerQuery, (GoldBagsUD-found))
}
/* 
if HealPotsUD != 0
  StashOrBuy([AlchemistQuery, FullHealPotsQuery], HealPotsUD)
if BandagesUD != 0
  StashOrBuy([SurgeonQuery, FullBandagesQuery], BandagesUD)
*/
if CrossbowChkBox
{
  BuyObject(CrossbowQuery, WoodsmanQuery, 1)
  BuyObject(FullBoltsQuery, WoodsmanQuery, 1)
}
GraphicSearchAndClick(StashButtonQuery, SCREEN_SEARCH_COORDINATES.TOP_MENU, false, "Left", 1)
ToolTip Done
return


ButtonSellTreasures:
CheckActiveWindow()
SetMouseDelay 1
GraphicSearchAndClick(MerchantsButtonQuery, SCREEN_SEARCH_COORDINATES.TOP_MENU, "Left", false, 1)
sleep 100
GraphicSearchAndClick(CollectorQuery, SCREEN_SEARCH_COORDINATES.WHOLE_SCREEN, "Left", false, 1)
counter := 1
firstX := (SCREEN_SEARCH_COORDINATES.PLAYER_INVENTORY_MERCHANT.1 + 25)
firstY := (SCREEN_SEARCH_COORDINATES.PLAYER_INVENTORY_MERCHANT.2 + 25)
X:=firstX
Y:=firstY
Loop 50
{
  if ((Mod(A_Index, 10) = 1) && (A_Index != 1))
  {
    offset := counter * 50
    Y:=firstY+offset
    X:=firstX + 50
    counter++
  }
  else
  {
    X:=X+50
  }
  Click, %X%, %Y%, Left
}
GraphicSearchAndClick(DealButtonQuery, SCREEN_SEARCH_COORDINATES.WHOLE_SCREEN, "Right", false, 0) 
ToolTip done
return

;-------------------------------------------------------------------------------------------------------------------------Tab 3 Trade
ButtonMoveGoldTrade:
CheckActiveWindow()
SetMouseDelay 1
GraphicSearchAndClick(FullGoldBagQuery, SCREEN_SEARCH_COORDINATES.STASH_INVENTORY, Left, false, 25)
ToolTip Done
return

ButtonCheckTradeItems:
CheckActiveWindow()
SetMouseDelay 1
GraphicSearchAndClick(TradeCheckQuery, SCREEN_SEARCH_COORDINATES.CENTER, Left, false, 25)
ToolTip Done
return

;GuiClose:ExitApp



/* 
ButtonTestStashCollectiblesCollection:
CheckActiveWindow()
SetMouseDelay 5
t1 := A_TickCount
MsgBox % colorsToIgnore
GraphicSearchAndClick(StashButtonQuery, SCREEN_SEARCH_COORDINATES.TOP_MENU, "Left", false, 1)
Sleep 100
amount := GraphicSearchAndClick(StashCollectiblesString, SCREEN_SEARCH_COORDINATES.STASH_INVENTORY, "Right", true)
MsgBox, 4096, Tip, % "Found :`t" Round(amount.MaxIndex())
. "`n`nTime  :`t" (A_TickCount-t1) " ms"
. "`n`nPos   :`t" X ", " Y
. "`n`nResult:`t" (amount ? "Success !" : "Failed !")
return
;GraphicSearchAndClick(MobGarbageString, SCREEN_SEARCH_COORDINATES.STASH_INVENTORY, "Left", false)

ButtonTestInv:
CheckActiveWindow()
;searchCoords := PLAYER_INVENTORY_STASH
searchCoords := SCREEN_SEARCH_COORDINATES.PLAYER_INVENTORY_MERCHANT
;searchCoords := SCREEN_SEARCH_COORDINATES.WHOLE_SCREEN
counter := 1
SetMouseDelay 4
;query := StashCollectiblesCollection.RubyQuery
query := MerchantCollectiblesCollection.SlimBangleQuery
;testObj := oGraphicSearch.search(TestQuery, {x1: searchCoords.1, x2: searchCoords.3, y1: searchCoords.2, y2: searchCoords.4})
while testObj := oGraphicSearch.search(query, {x1: searchCoords.1, x2: searchCoords.3, y1: searchCoords.2, y2: searchCoords.4})
{
  X:=testObj.1.x
  Y:=testObj.1.y
  if (A_Index = 1)
  {
    firstY := testObj.1.y, firstX:= testObj.1.x
    toX:=%X%
  }
  else if (A_Index = 51)
  {
    break
  }
  else
  {
    toX:=X+50
  }
  toY:=Y
  if (Mod(A_Index, 10) = 1 && A_Index != 1)
  {
    offset := counter * 50
    toY:=firstY+offset
    toX:= firstX
    counter++
  }
  MouseClickDrag, Left, %X%, %Y%, %toX%, %toY%
  MouseMove, 100, 100, ,R
  
}
MouseClickDrag, Left, %X%, %Y%, firstX, firstY
ToolTip done
return

ButtonTestAllTreasuresSearch:
CheckActiveWindow()
if !GraphicSearchAndClick(StashCollectiblesString, SCREEN_SEARCH_COORDINATES.WHOLE_SCREEN, "Left", false, 50)
  ToolTip No Search
if !GraphicSearchAndClick(MobGarbageString, SCREEN_SEARCH_COORDINATES.WHOLE_SCREEN, "Left", false, 50)
  ToolTip No Search
ToolTip done
return

for _, object in MerchantCollectiblesCollection
{
  GraphicSearchAndClick(object, SCREEN_SEARCH_COORDINATES.PLAYER_INVENTORY_MERCHANT)
}
*/
/* 
Gui, Add, Button, gButtonTestImageScan, Test image scan


ButtonTestImageScan:
CheckActiveWindow()
GuiControlGet, VariantUD
itemToTest := "\images\test.png"
imageTestQuery := "|<>**50$38.00zzU000n4vU01kV2S00EwFZg073UltU1kQMAwQH360vhj0P6DSs13cDtc0806D+06022EU1k0UoG0q0CAU0Qk1t00262380MUk0M00M60y00w0zw80Fz80M077zyQ00Qk6Q003Y3A000Aki0001o600006000000k002"
i := SCREEN_SEARCH_COORDINATES.WHOLE_SCREEN
t1 := A_TickCount
variant := VariantUD / 100
amount := oGraphicSearch.scan(imageTestQuery, i.1,i.2,i.3,i.4, variant,variant)
for _, object in amount
{
  X := object.x, Y := object.y
  Click, %X%, %Y%, Left
}
*/

ButtonTestImageSearch:
CheckActiveWindow()
GuiControlGet, VariantUD
t1 := A_TickCount
itemToTest := "\images\test.png"
;imageTestQuery := "|<>##" VariantUD colorsToIgnore A_ScriptDir itemToTest
imageTestQuery := GOLD_BAG_COLLECTION_IMAGES.MERCHANT_EMPTY_GOLD_BAG
amount := GraphicSearchAndClick(imageTestQuery, SCREEN_SEARCH_COORDINATES.WHOLE_SCREEN, "Left", false)
MsgBox, 4096, Tip, % "Found :`t" Round(amount.MaxIndex())
. "`n`nTime  :`t" (A_TickCount-t1) " ms"
. "`n`nPos   :`t" X ", " Y
. "`n`nResult:`t" (amount ? "Success !" : "Failed !")
return

ButtonTestQuerySearch:
CheckActiveWindow()
GuiControlGet, VariantUD
t1 := A_TickCount
query := AnyGoldBagQuery
amount := GraphicSearchAndClick(query, SCREEN_SEARCH_COORDINATES.WHOLE_SCREEN, "Left", false)
MsgBox, 4096, Tip, % "Found :`t" Round(amount.MaxIndex())
. "`n`nTime  :`t" (A_TickCount-t1) " ms"
. "`n`nPos   :`t" X ", " Y
. "`n`nResult:`t" (amount ? "Success !" : "Failed !")
return