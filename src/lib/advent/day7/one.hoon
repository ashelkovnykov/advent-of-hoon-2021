|%
++  main
  |=  lst=(list @t)
  ^-  @t
  (:(cork parse-crabs compute num-to-cord) lst)
++  parse-crabs
  |=  lst=(list @t)
  ^-  (list @ud)
  ?~  lst  ~
  (rash i.lst (most com dim:ag))
++  compute
  |=  lst=(list @ud)
  ^-  @ud
  |^
    =/  med  (find-median lst)
    %+  roll  lst
    |=  [x=@ud sum=@ud]
    ^-  @ud
    %+  add  sum
    ?:  (lth x med)
      (sub med x)
    (sub x med)
  ++  find-median
    |=  lst=(list @ud)
    ^-  @ud
    %+  snag
      (div (lent lst) 2)
    (sort lst gth)
  --
++  num-to-cord
  |=  num=@ud
  ^-  @t
  (crip (a-co:co num))
--
