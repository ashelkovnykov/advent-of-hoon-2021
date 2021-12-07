|%
++  main
  |=  lst=(list @t)
  ^-  @t
  (:(cork parse-vents compute num-to-cord) lst)
++  parse-vents
  |=  lst=(list @t)
  ^-  (list [(pair @ud @ud) (pair @ud @ud)])
  %+  turn  lst
  |=  txt=@t
  ^-  [(pair @ud @ud) (pair @ud @ud)]
  %+  rash  txt
  ;~  plug
    ;~  plug
      dim:ag
      ;~(pfix com dim:ag)
    ==
    ;~  pfix
      ;~(plug ace hep gar ace)
      ;~  plug
        dim:ag
        ;~(pfix com dim:ag)
      ==
    ==
  ==
++  compute
  |=  lst=(list [(pair @ud @ud) (pair @ud @ud)])
  ^-  @ud
  %~  wyt  in
  %-  tail
  %+  roll  lst
  |=  [pss=[(pair @ud @ud) (pair @ud @ud)] sts=[(set (pair @ud @ud)) (set (pair @ud @ud))]]
  ^-  [(set (pair @ud @ud)) (set (pair @ud @ud))]
  =*  p1  -.pss
  =*  p2  +.pss
  =*  one  -.sts
  =*  two  +.sts
  =/  xst  p.p1
  =/  xnd  p.p2
  =/  yst  q.p1
  =/  ynd  q.p2
  |-
  ?:  &(=(xst xnd) =(yst ynd))
    (insert xst yst one two)
  %=  $
    xst  ?:(=(xst xnd) xst ?:((lth xst xnd) +(xst) (dec xst)))
    yst  ?:(=(yst ynd) yst ?:((lth yst ynd) +(yst) (dec yst)))
    sts  (insert xst yst one two)
  ==
++  insert
  |=  [x=@ud y=@ud one=(set (pair @ud @ud)) two=(set (pair @ud @ud))]
  ^-  [(set (pair @ud @ud)) (set (pair @ud @ud))]
  :-  (~(put in one) [x y])
  ?:  (~(has in one) [x y])
    (~(put in two) [x y])
  two
++  num-to-cord
  |=  num=@ud
  ^-  @t
  (crip (a-co:co num))
--
