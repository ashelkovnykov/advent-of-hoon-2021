|%
++  main
  |=  lst=(list @t)
  ^-  @t
  (:(cork parse-bits compute-bits mul num-to-cord) lst)
++  parse-bits
  |=  lst=(list @t)
  ^-  (list (list @ud))
  %+  turn  lst
  |=  txt=@t
  ^-  (list @ud)
  (rash txt (plus but))
++  compute-bits
  |=  lst=(list (list @ud))
  ^-  [@ud @ud]
  ?~  lst  [0 0]
  =/  [cnt=@ud bts=(list @ud)]
    (bits-and-count lst)
  =.  cnt  (div cnt 2)
  =.  bts
    %+  turn  bts
    |=  b=@ud
    ?:  (gth b cnt)
      1
    0
  =/  len  (lent bts)
  =/  num  (sum-bit-array len bts)
  [num (not 0 len num)]
++  bits-and-count
  |=  lst=(list (list @ud))
  ^-  [@ud (list @ud)]
  ?~  lst  [0 ~]
  =+  bts=i.lst
  =+  itr=t.lst
  =+  cnt=1
  |-
  ?~  itr  [cnt bts]
  $(bts (list-sum bts i.itr), itr t.itr, cnt +(cnt))
++  list-sum
  |=  [a=(list @ud) b=(list @ud)]
  ^-  (list @ud)
  |-
  ?~  a
    ?~  b  ~
    !!
  ?~  b  !!
  :-  (add i.a i.b)
  $(a t.a, b t.b)
++  sum-bit-array
  |=  [len=@ud bts=(list @ud)]
  ^-  @ud
  =|  sum=@ud
  |-
  ?~  bts  sum
  =.  len  (dec len)
  ?:  =(i.bts 1)
    $(sum (add sum (bex len)), bts t.bts)
  $(bts t.bts)
++  num-to-cord
  |=  num=@ud
  ^-  @t
  (crip (a-co:co num))
--
