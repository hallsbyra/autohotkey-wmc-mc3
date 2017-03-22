#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn   ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2

; Home button. Simulate the green button on the original remote.
; We could just send Win+Alt+Enter, which is what the green button translates to,
; but I found this solution faster and more robust.
;  Browser_Home::
;  	Process,Exist, ehshell.exe
;  	If ( ErrorLevel = 0 )
;     	{
;  		Run, "C:\Windows\ehome\ehshell.exe"
;  	}
;  	Else
;  		Send, #!{Enter}
;  Return

#IfWinNotActive, Kodi

Browser_Home::
		Run, "C:\Program Files (x86)\Kodi\kodi.exe"
Return


#IfWinActive, Kodi

Browser_Home::
	send, ^!{VK74} ; if Kodi is Active (GSB Home Jump will activate)
Return 

#IfWinActive, Windows Media Center


; Back button - The default behavior works fine.
; Browser_Back::
;  Send, {Browser_Back}
; Return

; Media button. Bound to display "Guide".
Launch_Media::
  Send, ^g
Return

; Mail button. Do nothing.
Launch_Mail::
Return


; Play/Pause button. "Stop" on double click.
Media_Play_Pause::
	Send {Media_Play_Pause}
	If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 500)
		Send ^+s
Return

F2::
  Send, F2
Return

 F3::
  Send, F3
 Return

; AppsKey::
;  Send, AppsKey
; Return


#IfWinActive, VLC media player


; Left = Ctrl + Left to skip back 1 minute
Left::
  Send, ^{Left}
Return

; Riught = Ctrl + Right to skip forward 1 minute
Right::
  Send, ^{Right}
Return
