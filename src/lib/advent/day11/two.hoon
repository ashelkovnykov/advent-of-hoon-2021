|%
+$  grid  (map [@ud @ud] @ud)
++  main
  |=  inp=(list @t)
  ^-  @t
  |^
    (:(cork parse-input compute-result num-to-cord) inp)
  ++  parse-input
    |=  lst=(list @t)
    ^-  grid
    |^  (to-map (parse-text lst))
    ++  parse-text
      |=  lst=(list @t)
      ^-  (list (list @ud))
      ?~  lst  ~
      %+  turn  lst
      |=  inp=@t
      ^-  (list @ud)
      (rash inp (plus dit))
    ++  to-map
      |=  inp=(list (list @ud))
      ^-  grid
      ?:  =(~ inp)
        ^*  grid
      =/  x  (lent -.inp)
      =/  y  1
      =|  res=grid
      |-
      ?~  inp  res
      ?>  =(x (lent i.inp))
      %_  $
          res
        %-  ~(gas by res)
        %-  head
        %^  spin  i.inp  1
        |=  [i=@ud s=@ud]
        [[[s y] i] +(s)]
        ::
        inp  t.inp
        y    +(y)
      ==
    --
  ++  compute-result
    |^
      |=  grd=grid
      ^-  @ud
      =/  sze=@ud  ~(wyt by grd)
      =|  cnt=@ud
      =|  stp=@ud
      |-
      ?:  =(cnt sze)  stp
      =.  grd  (reset-octopii (flash-octopii (inc-grid grd)))
      $(cnt (count-glowies grd), stp +(stp))
    ++  inc-grid
      |=  grd=grid
      ^-  grid
      (~(run by grd) inc)
    ++  flash-octopii
      |=  grd=grid
      ^-  grid
      =/  seen
        ^*  (set [@ud @ud])
      =/  unseen  (get-glowies grd)
      =/  diff
        ^*  (set [@ud @ud])
      |-
      =.  diff  (~(dif in unseen) seen)
      ?.  (gth ~(wyt in diff) 0)  grd
      =.  grd  (flash-helper grd ~(tap in diff))
      $(seen unseen, unseen (get-glowies grd))
    ++  flash-helper
      |=  [grd=grid fla=(list [@ud @ud])]
      ^-  grid
      |-
      ?~  fla  grd
      =.  grd  (inc-energy grd (dec -.i.fla) (dec +.i.fla))
      =.  grd  (inc-energy grd -.i.fla (dec +.i.fla))
      =.  grd  (inc-energy grd +(-.i.fla) (dec +.i.fla))
      =.  grd  (inc-energy grd +(-.i.fla) +.i.fla)
      =.  grd  (inc-energy grd +(-.i.fla) +(+.i.fla))
      =.  grd  (inc-energy grd -.i.fla +(+.i.fla))
      =.  grd  (inc-energy grd (dec -.i.fla) +(+.i.fla))
      =.  grd  (inc-energy grd (dec -.i.fla) +.i.fla)
      $(fla t.fla)
    ++  inc-energy
      |=  [grd=grid x=@ud y=@ud]
      ^-  grid
      ?.  (~(has by grd) [x y])  grd
      %+  ~(put by grd)  [x y]
      +((~(got by grd) [x y]))
    ++  get-glowies
      |=  grd=grid
      ^-  (set [@ud @ud])
      %-  silt
      %+  turn
        %+  skim  ~(tap by grd)
        |=  [^ v=@ud]
        ^-  ?
        (gth v 9)
      head
    ++  reset-octopii
      |=  grd=grid
      ^-  grid
      %-  ~(run by grd)
      |=  v=@ud
      ?:((gth v 9) 0 v)
    ++  count-glowies
      |=  grd=grid
      ^-  @ud
      %-  ~(rep by grd)
      |=  [[^ v=@ud] s=@ud]
      ^-  @ud
      ?:(=(0 v) +(s) s)
    --
  ++  inc
    |=  x=@ud
    ^-  @ud
    +(x)
  ++  num-to-cord
    |=  num=@ud
    ^-  @t
    (crip (a-co:co num))
  --
--
