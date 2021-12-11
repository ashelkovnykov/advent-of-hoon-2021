|%
++  main
  |=  lst=(list @t)
  ^-  @t
  (:(cork parse-input compute num-to-cord) lst)
++  parse-input
  |=  lst=(list @t)
  ^-  (list (list @ud))
  ?~  lst  ~
  %+  turn  lst
  |=  inp=@t
  ^-  (list @ud)
  (rash inp (plus dit))
++  compute
  |=  lst=(list (list @ud))
  ^-  @ud
  ?:  =(~ lst)  0
  =/  [lnx=@ud lny=@ud]  (get-dimensions lst)
  |^
    =/  [psx=@ud psy=@ud]  [1 1]
    =|  res=(map [@ud @ud] @ud)
    |-
    ?:  (gth psy lny)
      (roll ~(val by res) (cork add inc))
    ?:  (gth psx lnx)
      $(psx 1, psy +(psy))
    =?  res  (is-lowest psx psy)
      (~(put by res) [[psx psy] (get psx psy)])
    $(psx +(psx))
  ++  is-lowest
    |=  [x=@ud y=@ud]
    ^-  ?
    =/  v  (get x y)
    ?&
      (is-lower v (dec x) y)
      (is-lower v +(x) y)
      (is-lower v x (dec y))
      (is-lower v x +(y))
    ==
  ++  is-lower
    |=  [v=@ud x=@ud y=@ud]
    ^-  ?
    ?:  |(=(x 0) =(y 0) (gth x lnx) (gth y lny))
      &
    (lth v (get x y))
  ++  get
    |=  [x=@ud y=@ud]
    ^-  @ud
    ~+
    (snag (dec x) (snag (dec y) lst))
  --
++  get-dimensions
  |=  lst=(list (list @ud))
  ^-  [@ud @ud]
  ?~  lst  [0 0]
  =/  itr  t.lst
  =/  x  (lent i.lst)
  =/  y  1
  |-
  ?~  itr  [x y]
  ?>  =(x (lent i.itr))
  $(itr t.itr, y +(y))
++  inc
  |=  x=@ud
  ^-  @ud
  +(x)
++  num-to-cord
  |=  num=@ud
  ^-  @t
  (crip (a-co:co num))
--
