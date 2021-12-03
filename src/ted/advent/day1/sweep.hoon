/-  spider
/+  strandio,  sweep=advent-day1-sweep
=,  strand=strand:spider
^-  thread:spider
|=  arg=vase
=/  m  (strand ,vase)
^-  form:m
=+  !<([~ pth=path] arg)
=/  bem=beam  ~|([%path-not-beam pth] (need (de-beam pth)))
;<  lst=(unit vase)  bind:m  (build-file:strandio bem)
?~  lst  (pure:m !>(%list-read-fail))
=+  !<(inp=(list @) u.lst)
(pure:m !>((crip (a-co:co (main:sweep inp)))))
::(pure:m !>((crip (zing (join " " (turn inp a-co:co))))))

::=+  !<([~ arg=$@(who=ship [who=ship mez=tape])] arg)
::=/  [who=ship message=@t]
::  ?@(arg [who.arg ''] [who.arg (crip mez.arg)])
::;<  ~  bind:m  (poke:strandio [who %hood] %helm-hi !>(message))
::(pure:m !>("hi {<who>} successful"))
