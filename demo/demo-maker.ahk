; --------------------------------------------------
; Helper script for generating the demo screencast
; --------------------------------------------------
#SingleInstance Force
SetkeyDelay 0, 50

Commands := []
Index := 1

Commands.Push("asciinema rec demo/cast.json")
Commands.Push("cd temp")
Commands.Push("op")
Commands.Push("op --add say echo hello world")
Commands.Push("cat op.conf")
Commands.Push("op --show")
Commands.Push("op say")
Commands.Push("op -a greet echo Hi")
Commands.Push("op greet Bobby")
Commands.Push("op --help")
Commands.Push("exit")
Commands.Push("cat demo/cast.json | svg-term --out demo/cast.svg")

F12::
  Send % Commands[Index]
  Index := Index + 1
return

^F12::
  Reload
return

^x::
  ExitApp
return
