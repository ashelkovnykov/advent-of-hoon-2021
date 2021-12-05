|%
++  main
  |=  lst=(list @t)
  ^-  @t
  (:(cork cords-to-nums process compute num-to-cord) lst)
++  process
  |=  lst=(list @ud)
  ^-  (list @ud)
  ?~  lst  ~
  ?~  t.lst  ~
  ?~  t.t.lst  ~
  %-  head
  %^  spin  `(list @ud)`t.t.lst  [i.lst i.t.lst]
  |=  [c=@ud [a=@ud b=@ud]]
  [:(add a b c) [b c]]
++  compute
  |=  lst=(list @ud)
  ^-  @ud
  =|  acc=@ud
  ?~  lst  acc
  |-
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
