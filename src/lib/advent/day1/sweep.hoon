|%
++  main
  |=  lst=(list @t)
  ^-  @t
  (:(cork cords-to-nums compute num-to-cord) lst)
++  compute
  |=  lst=(list @ud)
  ^-  @ud
  =|  acc=@ud
  |-
  ?~  lst  acc
  ?~  t.lst  acc
  ?:  (gth i.t.lst i.lst)
    $(acc +(acc), lst t.lst)
  $(lst t.lst)
++  cords-to-nums
  |=  lst=(list @t)
  ^-  (list @ud)
  (turn lst parse-num)
++  parse-num
  |=  crd=@t
  ^-  @ud
  (rash crd dem)
++  num-to-cord
  |=  num=@ud
  ^-  @t
  (crip (a-co:co num))
--
