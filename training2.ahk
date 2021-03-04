^`::

Gui, New, , Ping
Gui, Add, Text, , Choose a Training Room, or Press the X to close
Gui, Add, DropDownList, vtrainingRoom , room1|room2|room3
Gui, Add, Button, gSave, OK
Gui, show

Save:
Gui, Submit, NoHide



	
if(trainingRoom = "room1" or trainingRoom = "room2" or trainingRoom = "room3"){

InputBox, adminPass, Restricted, Enter Administrator Password, hide

}

Loop
{

    FileReadLine, pcName, %A_WorkingDir%\%trainingroom%.txt, %A_Index%
    if ErrorLevel
        break

name(pcName,adminPass)

name(var, pass){
	
	Sleep 1000 	
	Sendinput, {lalt up}{ctrl up}{lwin}
	Sleep 1000

	Send, Remote Desktop Connection {Enter}
	Sleep 1000
	
	Sendinput, !o
	Sleep 1000

	Send, %var% {Tab} 
	Sleep 1000

	Send, installer{Enter}
	Sleep 1000

	Sendinput, {Left} {Enter}
	Sleep 1000

	Send, %pass%{Enter}

	Sleep 3000

	Sendinput, {Enter}

	Sleep 15000

	Sendinput, #d
	Sleep 1000

	Sendinput, {lalt up}{ctrl up}{lwin}
	Sleep 1000
	Send, cmd
	Sleep 1000
	Sendinput, {Enter}
	Sleep 1000

	Send, shutdown /r /m \\%var%{Enter}
	Sleep 1000

	Sendinput, !{F4}
	Sleep 1000
	
}
}

;MsgBox, 0, Complete, The room has been updated.
