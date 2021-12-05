|%
+$  command  ?(%forward %up %down)
++  main
  |=  lst=(list @t)
  ^-  @t
  (:(cork parse-commands process mul num-to-cord) lst)
++  parse-commands
  |=  lst=(list @t)
  ^-  (list [command @ud])
  %+  turn  lst
  |=  txt=@t
  ^-  [command @ud]
  =>  (rash txt ;~(plug sym ;~(pfix ace dim:ag)))
  :_  +
  ?+  -  !!
    ?(%forward %up %down)   -
  ==
++  process
  |=  lst=(list [command @ud])
  ^-  [@ud @ud]
  %-  head
  %+  roll  lst
  |=  [[c=command d=@ud] [p=[y=@ud z=@ud] a=@ud]]
  ^-  [[@ud @ud] @ud]
  ?-  c
    %forward  [[(add y.p d) (add z.p (mul a d))] a]
    %up       [p (sub a d)]
    %down     [p (add a d)]
  ==

++  num-to-cord
  |=  num=@ud
  ^-  @t
  (crip (a-co:co num))
--
