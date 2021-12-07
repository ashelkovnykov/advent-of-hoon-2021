|%
++  main
  |=  lst=(list @t)
  ^-  @t
  (:(cork parse-vents filter-vents compute num-to-cord) lst)
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
++  filter-vents
  |=  lst=(list [(pair @ud @ud) (pair @ud @ud)])
  ^-  (list [(pair @ud @ud) (pair @ud @ud)])
  %+  skim  lst
  |=  pss=[(pair @ud @ud) (pair @ud @ud)]
  ^-  ?
  =*  p1  -.pss
  =*  p2  +.pss
  |(=(p.p1 p.p2) =(q.p1 q.p2))
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
  =/  xst  (min p.p1 p.p2)
  =/  xnd  (max p.p1 p.p2)
  =/  yst  (min q.p1 q.p2)
  =/  ynd  (max q.p1 q.p2)
  |-
  ?:  &(=(xst xnd) =(yst ynd))
    (insert xst yst one two)
  %=  $
    xst  ?:(=(xst xnd) xst +(xst))
    yst  ?:(=(yst ynd) yst +(yst))
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
