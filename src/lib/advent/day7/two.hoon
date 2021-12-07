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
    =/  avg  (find-average lst)
    %+  roll  lst
    |=  [x=@ud sum=@ud]
    ^-  @ud
    %+  add  sum
    %-  geo-sum
    ?:  (lth x avg)
      (sub avg x)
    (sub x avg)
  ++  find-average
    |=  lst=(list @ud)
    ^-  @ud
    =|  cnt=@ud
    =|  sum=@ud
    |-
    ?~  lst
      (div sum cnt)
    $(lst t.lst, cnt +(cnt), sum (add sum i.lst))
  ++  geo-sum
    |=  x=@ud
    ^-  @ud
    (div (mul x +(x)) 2)
  --
++  num-to-cord
  |=  num=@ud
  ^-  @t
  (crip (a-co:co num))
--
