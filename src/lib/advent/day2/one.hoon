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
  %+  roll  lst
  |=  [[c=command d=@ud] [y=@ud z=@ud]]
  ^-  [@ud @ud]
  ?-  c
    %forward  [(add y d) z]
    %up       [y (sub z d)]
    %down     [y (add z d)]
  ==
++  num-to-cord
  |=  num=@ud
  ^-  @t
  (crip (a-co:co num))
--
