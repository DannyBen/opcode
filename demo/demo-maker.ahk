; --------------------------------------------------
; Helper script for generating the demo screencast
; NOTE: Run from the project root directory
; --------------------------------------------------
#SingleInstance Force
SetkeyDelay 0, 50

Commands := []
Index := 1

Commands.Push("cd demo {;} rm cast.json op.conf")
Commands.Push("asciinema rec cast.json")
Commands.Push("op")
Commands.Push("op --add say echo hello world")
Commands.Push("cat op.conf")
Commands.Push("op --show")
Commands.Push("op say")
Commands.Push("op -a greet echo Hi")
Commands.Push("op greet Bobby")
Commands.Push("op --edit")
Commands.Push("i{End}{Enter}{#}? This is an optional usage comment{Enter}")
Commands.Push("{Down}{End}{Enter}{#}? Greet someone{Enter}")
Commands.Push("{#}? Usage: op greet NAME{Enter}")
Commands.Push("{Escape}:x{Enter}")
Commands.Push("op ?")
Commands.Push("op --help")
Commands.Push("exit")
Commands.Push("cat cast.json | svg-term --out cast.svg --window")

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
