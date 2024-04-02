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
  SetMouseDelay 1
  DealBtnX := BUTTON_COORDINATES.MAKE_DEAL.X
  DealBtnY := BUTTON_COORDINATES.MAKE_DEAL.Y
  FillBtnX := BUTTON_COORDINATES.FILL_ALL_IN_STASH.X
  FillBtnY := BUTTON_COORDINATES.FILL_ALL_IN_STASH.Y

  GraphicSearchAndClick(MerchantsButtonQuery, SCREEN_SEARCH_COORDINATES.TOP_MENU, "Left", false)
  Sleep 100
  GraphicSearchAndClick(merchant, SCREEN_SEARCH_COORDINATES.WHOLE_SCREEN, "Left", false)
  Sleep 100
  GraphicSearchAndClick(item, SCREEN_SEARCH_COORDINATES.MERCHANT_INVENTORY, "Left", false)
  Sleep 150
  
  Loop, %amount%
  {
    Click, %FillBtnX%, %FillBtnY% , Left
    Sleep 50
    Click, %DealBtnX%, %DealBtnY%, Left
    Sleep 50
  }
  GraphicSearchAndClick(BackButtonQuery, SCREEN_SEARCH_COORDINATES.TOP_MENU, "Left", false)
  return
}

CheckStashForItem(itemQuery, amount){
  SetMouseDelay 3
  GraphicSearchAndClick(StashButtonQuery, SCREEN_SEARCH_COORDINATES.TOP_MENU, "Left", false)
  Sleep 100
  foundObj := GraphicSearchAndClick(itemQuery, SCREEN_SEARCH_COORDINATES.STASH_INVENTORY, "Right", true, amount)
  count:= foundObj.Count()
  if !foundObj
    return 0
  else if (count >= amount)
    return %amount%
  else
    return (amount-count)
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
