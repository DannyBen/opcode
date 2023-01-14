; --------------------------------------------------
; Helper script for generating the demo screencast
; NOTE: Run from the project root directory
; --------------------------------------------------
#SingleInstance Force
SetkeyDelay 0, 50

Return

Type(Command, Delay=2000) {
  Send % Command
  Sleep 500
  Send {Enter}
  Sleep Delay
}

F12::
  Type("{#} Press F11 to abort at any time")
  Type("cd ./demo {;} rm cast.json op.conf")
  Type("asciinema rec cast.json")
  Type("op")
  Type("op --add say echo hello world")
  Type("cat op.conf")
  Type("op --show")
  Type("op say")
  Type("op -a greet echo Hi")
  Type("op greet Bobby")
  Type("op --edit")
  Type("i{End}{Enter}{#}? This is an optional usage comment")
  Type("{Down}{End}{Enter}{#}? Greet someone")
  Type("{#}? Usage: op greet NAME")
  Type("{Escape}:x{Enter}")
  Type("op ?")
  Type("op --help")
  Type("exit")
  Type("agg --font-size 20 cast.json cast.gif")
  Type("cd ..")
  Type("{#} Done")
return

^F12::
  Reload
return

F11::
  ExitApp
return
