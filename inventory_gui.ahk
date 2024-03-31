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

*ESC::ExitApp

CheckActiveWindow(){
  if (WinExist("Dark and Darker"))
  {
    WinActivate
    ;WinWaitActive
  }
  return
}

BuyObject(amount, merchant, item){
  local searchCoords := screenCoords
  SetMouseDelay 4
  GraphicSearchAndClick(MerchantsButtonQuery, topMenuBarCoords, "Left", false)
  GraphicSearchAndClick(merchant, searchCoords, "Left", false)
  GraphicSearchAndClick(item, MerchantBuyCoords, "Left", false)
  Loop %amount%{
    GraphicSearchAndClick(FillButtonQuery, searchCoords, "Left", false)
    GraphicSearchAndClick(DealButtonQuery, searchCoords, "Left", false)
  }
  GraphicSearchAndClick(BackButtonQuery, searchCoords, "Left", false)
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

StashCheck(itemQuery, amount){
  SetMouseDelay 3
  GraphicSearchAndClick(StashButtonQuery, topMenuBarCoords, "Left", false)
  foundObj := GraphicSearchAndClick(itemQuery, stashSearchCoords, "Right", true, amount)

  if (foundObj.Count() > amount)
    return %amount%
  if (foundObj.Count() = 0)
    return 0

  found := (amount-foundObj.Count())
  return found
}

StashOrBuy(itemQuery, amount){
  SetMouseDelay 5
  amountFound := StashCheck(itemQuery.2, amount)
  if (amountFound != amount)
  {
    buyAmount := (amount - amountFound)
    BuyObject(buyAmount, itemQuery.1, itemQuery.2)
  }
  return
}

ClearNotifications(){
  SetMouseDelay 5
  GraphicSearchAndClick(MerchantsButtonQuery, topMenuBarCoords, "Left", false, 1)
  Loop
  {
    merchantNotificationsObj := GraphicSearchAndClick(MerchantNotificationQuery, screenCoords, "Left", false, 0)
  } 
  Until merchantNotificationObj || A_Index = 5

  for _, object in merchantNotificationObj{
    X := object.x, Y := object.y
    Click, %X%, %Y%, "Left"
    Sleep 200
    GraphicSearchAndClick(QuestsButtonQuery, screenCoords, "Left", false)
    questNotificationAmount := GraphicSearchAndClick(QuestNotificationQuery, MerchantBuyCoords, "Left", false, 0)
  
    for _, object in questNotificationAmount{
      X := object.x, Y := object.y
      Click, %X%, %Y%, "Left"
      GraphicSearchAndClick(AcceptButtonQuery, screenCoords, "Left", false, 1)
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
searchCoords := ImageRecognitionArea = "Inventory" ? inventorySearchCoords : stashSearchCoords

GuiControlGet, GoldCoinChkBox
GuiControlGet, GoldBagChkBox
allQueries := AnyGoldBagQuery GoldCoinQuery
/* 
if (searchCoords == stashSearchCoords) && GoldBagChkBox && !GoldCoinChkBox
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
i := inventorySearchCoords
;findText().PixelSearch(X, Y, i.1, i.2, i.3, i.4, ItemBlueBackgroundColor)
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
SetMouseDelay 5
searchCoords := inventorySearchCoords
GuiControlGet, GoldBagsUD
GuiControlGet, HealPotsUD
GuiControlGet, BandagesUD
GuiControlGet, CheckStashChkBox
GuiControlGet, CrossbowChkBox

if CheckStashChkBox
{
  if GoldBagsUD != 0
    StashCheck([TreasurerQuery, GOLD_BAG_COLLECTION.STASH_EMPTY_GOLD_BAG], GoldBagsUD)
  if HealPotsUD != 0
    StashOrBuy([AlchemistQuery, FullHealPotsQuery], HealPotsUD)
  if BandagesUD != 0
    StashOrBuy([SurgeonQuery, FullBandagesQuery], BandagesUD)
}
else
{
  if GoldBagsUD != 0
    BuyObject(GoldBagsUD, TreasurerQuery, GOLD_BAG_COLECTION_MERCHANT_EMPTY_GOLD_BAG)
  if HealPotsUD != 0
    BuyObject(HealPotsUD, AlchemistQuery, FullHealPotsQuery)
  if BandagesUD != 0
    BuyObject(BandagesUD, SurgeonQuery, FullBandagesQuery)  
}
if CrossbowChkBox
{
  BuyObject(1, WoodsmanQuery, CrossbowQuery)
  BuyObject(1, WoodsmanQuery, FullBoltsQuery)
}
GraphicSearchAndClick(StashButtonQuery, topMenuBarCoords, false, "Left", 1)
return


ButtonSellTreasures:
CheckActiveWindow()
SetMouseDelay 1
GraphicSearchAndClick(MerchantsButtonQuery, topMenuBarCoords, "Left", false, 1)
GraphicSearchAndClick(CollectorQuery, screenCoords, "Left", false, 1)
;testObj := GraphicSearchAndClick(CollectiblesString, stashSearchCoords, "Left", false)
;GraphicSearchAndClick(MobGarbageString, stashSearchCoords, "Left", false)
searchCoords := merchantSellCoords
query := StartOfInventoryQuery
counter := 1
;testObj := oGraphicSearch.search(TestQuery, {x1: searchCoords.1, x2: searchCoords.3, y1: searchCoords.2, y2: searchCoords.4})
testObj := oGraphicSearch.search(query, {x1: searchCoords.1, x2: searchCoords.3, y1: searchCoords.2, y2: searchCoords.4})
X:=testObj.1.x
Y:=testObj.1.y
firstX := X, firstY := testObj.1.y
Loop 55
{
  if ((Mod(A_Index, 11) = 1) && (A_Index != 1))
  {
    offset := counter * 60
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
GraphicSearchAndClick(DealButtonQuery, screenCoords, "Right", false, 0) 
ToolTip done
return

;-------------------------------------------------------------------------------------------------------------------------Tab 3 Trade
ButtonMoveGoldTrade:
CheckActiveWindow()
SetMouseDelay 1
GraphicSearchAndClick(FullGoldBagQuery, stashSearchCoords, Left, false, 25)
return

ButtonCheckTradeItems:
CheckActiveWindow()
SetMouseDelay 1
GraphicSearchAndClick(TradeCheckQuery, centerScreenCoords, Left, false, 25)
return

;GuiClose:ExitApp



/* 
ButtonTestStashCollectiblesCollection:
CheckActiveWindow()
SetMouseDelay 5
t1 := A_TickCount
MsgBox % colorsToIgnore
GraphicSearchAndClick(StashButtonQuery, topMenuBarCoords, "Left", false, 1)
Sleep 100
amount := GraphicSearchAndClick(StashCollectiblesString, stashSearchCoords, "Right", true)
MsgBox, 4096, Tip, % "Found :`t" Round(amount.MaxIndex())
. "`n`nTime  :`t" (A_TickCount-t1) " ms"
. "`n`nPos   :`t" X ", " Y
. "`n`nResult:`t" (amount ? "Success !" : "Failed !")
return
;GraphicSearchAndClick(MobGarbageString, stashSearchCoords, "Left", false)

ButtonTestInv:
CheckActiveWindow()
;searchCoords := inventorySearchCoords
searchCoords := merchantSellCoords
;searchCoords := screenCoords
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
if !GraphicSearchAndClick(StashCollectiblesString, screenCoords, "Left", false, 50)
  ToolTip No Search
if !GraphicSearchAndClick(MobGarbageString, screenCoords, "Left", false, 50)
  ToolTip No Search
ToolTip done
return

for _, object in MerchantCollectiblesCollection
{
  GraphicSearchAndClick(object, merchantSellCoords)
}
*/
/* 
Gui, Add, Button, gButtonTestImageScan, Test image scan


ButtonTestImageScan:
CheckActiveWindow()
GuiControlGet, VariantUD
itemToTest := "\images\test.png"
imageTestQuery := "|<>**50$38.00zzU000n4vU01kV2S00EwFZg073UltU1kQMAwQH360vhj0P6DSs13cDtc0806D+06022EU1k0UoG0q0CAU0Qk1t00262380MUk0M00M60y00w0zw80Fz80M077zyQ00Qk6Q003Y3A000Aki0001o600006000000k002"
i := screenCoords
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
imageTestQuery := "|<>##" VariantUD colorsToIgnore A_ScriptDir itemToTest
amount := GraphicSearchAndClick(imageTestQuery, screenCoords, "Left", false)
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
amount := GraphicSearchAndClick(query, screenCoords, "Left", false)
MsgBox, 4096, Tip, % "Found :`t" Round(amount.MaxIndex())
. "`n`nTime  :`t" (A_TickCount-t1) " ms"
. "`n`nPos   :`t" X ", " Y
. "`n`nResult:`t" (amount ? "Success !" : "Failed !")
return