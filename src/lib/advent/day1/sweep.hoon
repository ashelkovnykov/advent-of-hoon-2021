|%
++  main
  |=  lst=(list @ud)
  ^-  @ud
  =|  acc=@ud
  |-
  ?~  lst  acc
  ?~  t.lst  acc
  ?:  (gth i.t.lst i.lst)
    $(acc +(acc), lst t.lst)
  $(lst t.lst)
--
