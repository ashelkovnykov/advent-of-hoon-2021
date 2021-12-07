|%
++  main
  |=  lst=(list @t)
  ^-  @t
  (:(cork parse-bits compute-nums mul num-to-cord) lst)
++  parse-bits
  |=  lst=(list @t)
  ^-  [(list @ud) @ud]
  :_  (compute-len lst)
  %+  turn  lst
  |=  txt=@t
  ^-  @ud
  (rash txt bin)
++  compute-len
  |=  lst=(list @t)
  ^-  @ud
  ?~  lst  0
  (met 3 i.lst)
++  compute-nums
  |=  [lst=(list @ud) len=@ud]
  ^-  [@ud @ud]
  [((compute skim) lst len) ((compute skip) lst len)]
++  compute
  |*  fun=$-([(list) $-(* ?)] (list))
  |=  [lst=(list @ud) len=@ud]
  ^-  @ud
  |^
    =+  pos=len
    |-
    ?:  =((lent lst) 0)  !!
    ?:  =((lent lst) 1)  -.lst
    %=  $
      lst  (filter pos lst)
      pos  (dec pos)
    ==
  ++  filter
    |=  [pos=@ud lst=(list @ud)]
    ^-  (list @ud)
    =.  pos  (dec pos)
    =/  [cnt=@ud sum=@ud]
      (count-and-sum pos lst)
    =/  val=@ud
      ?:  (gte (lsh 0 sum) cnt)
        1
      0
    %+  fun  lst
    |=  x=@ud
    ^-  ?
    ?!
    .=  1
    %+  mix  val
    %+  dis  1
    (rsh [0 pos] x)
  ++  count-and-sum
    |=  [pos=@ud lst=(list @ud)]
    ^-  [@ud @ud]
    =|  cnt=@ud
    =|  sum=@ud
    |-
    ?~  lst  [cnt sum]
    %=  $
      lst  t.lst
      cnt  +(cnt)
      sum  (add sum (dis 1 (rsh [0 pos] i.lst)))
    ==
  --
++  num-to-cord
  |=  num=@ud
  ^-  @t
  (crip (a-co:co num))
--
