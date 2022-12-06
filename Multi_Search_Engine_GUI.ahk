#SingleInstance Force

; reference https://coolors.co/c1c1c1-2c4251-d16666 
; https://imgur.com/a/7Rou6Ph

;; FONT STYLE
MyFont:="Consolas"

;; THEME COLOR
bc:="c" . "001a00", Hfc:="c" . "04d404", Fc:= "c" . "d6f5d5"          ;Green Theme
;~ bc:="c" . "050500", Hfc:="c" . "ffff00", Fc:= "c" . "ffff9e"            ;Yellow Theme
;~ bc:="c" . "000000", Hfc:="c" . "d10000", Fc:= "c" . "c96f6f"         ;Red Theme
;~ bc:="c" . "0f0006", Hfc:="c" . "fa056b", Fc:= "c" . "9375ff"         ;Blue-Red Theme
;~ bc:="c" . "2C4251", Hfc:="c" . "D16666", Fc:= "c" . "C1C1C1"        ;theme1
;~ bc:="c" . "393d3f", Hfc:="c" . "c6c5b9", Fc:= "c" . "fdfdff"           ; Pale white theme
;~ bc:="c" . "031927", Hfc:="c" . "ba1200", Fc:= "c" . "9DD1F1"         ; Pale white theme
;~ bc:="c" . "BCABAE", Hfc:="c" . "0F0F0F", Fc:= "c" . "2D2E2E"     ; Coffee theme
;~ bc:="c" . "000000", Hfc:="c" . "CF5C36", Fc:= "c" . "EEE5E9"     ; Light Red theme

Gui Font,s12
Gui Add,Text, x5 y1 %Hfc%, Search
Gui, Font, s10 %MyFont%
Gui Add,CheckBox, x9 y21 %Fc% vC1,DuckDuckGo
Gui Add,CheckBox, x9 y+2 %Fc% vC2,Google
Gui Add,CheckBox, x9 y+2 %Fc% vC3,YouTube
Gui Add,CheckBox, x9 y+2 %Fc% vC4,Wikipedia
Gui Add,CheckBox, x9 y+2 %Fc% vC5,Amazon
Gui Add,CheckBox, x9 y+2 %Fc% vC6,FlipKart
Gui Add,CheckBox, x9 y+2 %Fc% vC7,WolframAlpha

Gui add, dropdownlist, x350 y10 w150 vbatchlist

Gui Font,s12
Gui Add,Text, x140 y2 %Hfc%, Ask-Reddit
Gui, Font, s10 %MyFont%
Gui Add,CheckBox, x140 y21 %Fc% vC8,r/learnprogramming (3.5m)
Gui Add,CheckBox, x140 y+2 %Fc% vC9,r/AutoHotkey (21.0k)
Gui Add,CheckBox, x140 y+2 %Fc% vC10,r/Excel (595k)
Gui Add,CheckBox, x140 y+2 %Fc% vC11,r/vbscript (948)
Gui Add,CheckBox, x140 y+2 %Fc% vC12,r/learnpython (652k)
Gui Add,CheckBox, x140 y+2 %Fc% vC13,r/Batch (4.0k)
Gui Add,CheckBox, x140 y+2 %Fc% vC14,r/PowerShell (207k)
Gui Add,CheckBox, x140 y+2 %Fc% vC15,r/AutomateYourself(2.9k)

Gui Font,s12
Gui Add,Text, x5 y180 %Hfc%, Social Media
Gui, Font, s10 %MyFont%
Gui Add,CheckBox, x9 y200 %Fc% vC16,Instagram
Gui Add,CheckBox, x9 y+2 %Fc% vC17,Twitter
Gui Add,CheckBox, x9 y+2 %Fc% vC18,LinkedIn


Gui, Font, s10 %MyFont%
Gui Add,Edit,x10 y280 w300 h20 vEd
Gui Add,Button,x20 y320 w50 h15 gSearch,Search     	; No need for separate labels for these two
Gui Add,Button,x80 y320 w50 h15 gCancel,Cancel  		; we can get which button was pressed.
Gui Add,Button,x150 y320 w60 h15 gExOp,Open.XL  		; Open Excel
Gui Add,Button,x220 y320 w60 h15 gEdit1,Edit  		; Open Excel
Return



^Numpad1::												;Hotkey
  GuiControl Focus,Edit1  			;Focus on Edit box
  Gui, Color, %bc% 
  Gui Show, w550 h350				;Show Gui
Return

GuiEscape:
Cancel:
Gui Submit
return

ExOp:
Gui Submit
Run, "C:\Users\%A_UserName%\OneDrive\Documents\MyAHK_CheckBox_LIst.xlsx"
return

Edit1:
Run edit "%A_ScriptFUllPath%"
return

Search:
  Gui Submit                      ;Get the values of all controls
  If (A_GuiControl="Search"){       ;If 'Okay' was clicked
    If C1                         ;Run site based on which checkboxes were set
      Run https://duckduckgo.com/?q=%Ed%
    If C2
      Run https://www.google.com/search?q=%Ed%
    If C3
      Run https://www.youtube.com/results?search_query=%Ed%
    If C4
      Run http://en.wikipedia.org/wiki/Special:Search?search=%Ed%
    If C5
      Run https://www.amazon.in/s?k=%Ed%&ref=nb_sb_noss
    If C6
      Run https://www.flipkart.com/search?q=%Ed%
	If C7
      Run https://www.wolframalpha.com/input/?i=%Ed%
	If C8
      Run https://www.reddit.com/r/learnprogramming/search/?q=%Ed%&restrict_sr=1&sr_nsfw=
    if C9
      Run https://www.reddit.com/r/AutoHotkey/search/?q=%Ed%&restrict_sr=1&sr_nsfw=
    if C10
      Run https://www.reddit.com/r/Excel/search/?q=%Ed%&restrict_sr=1&sr_nsfw=
    if C11
      Run https://www.reddit.com/r/vbscript/search/?q=%Ed%&restrict_sr=1&sr_nsfw=
    if C12
      Run https://www.reddit.com/r/learnpython/search/?q=%Ed%&restrict_sr=1&sr_nsfw=
    if C13
      Run https://www.reddit.com/r/Batch/search/?q=%Ed%&restrict_sr=1&sr_nsfw=
    if C14
      Run https://www.reddit.com/r/PowerShell/search/?q=%Ed%&restrict_sr=1&sr_nsfw=
    if C15
      Run https://www.reddit.com/r/AutomateYourself/search/?q=%Ed%&restrict_sr=1&sr_nsfw=
    if C16
      Run https://www.instagram.com/%Ed%/ 
  }
Loop 16                                        ; Loop through all checkboxes
GuiControl ,,C%A_Index%,0       ; and clear them
GuiControl ,,Edit1                      ;  Edit box too
Return

