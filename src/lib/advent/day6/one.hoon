|%
++  days  80
++  main
  |=  lst=(list @t)
  ^-  @t
  (:(cork parse-fish compute num-to-cord) lst)
++  parse-fish
  |=  lst=(list @t)
  ^-  (list @ud)
  ?~  lst  ~
  (rash i.lst (most com dim:ag))
++  compute
  |^
    |=  lst=(list @ud)
    ^-  @ud
    %+  roll  lst
    |=  [x=@ud sum=@ud]
    ^-  @ud
    %+  add  sum
    (helper x days)
  ++  helper
    |=  [x=@ud d=@ud]
    ~+
    ?:  (gte x d)  1
    %+  add
      $(x 6, d (sub d +(x)))
    $(x 8, d (sub d +(x)))
  --
++  num-to-cord
  |=  num=@ud
  ^-  @t
  (crip (a-co:co num))
--
