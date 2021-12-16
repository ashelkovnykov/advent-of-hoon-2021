/+  *mip
|%
+$  grid  (mip @ud @ud @ud)
++  steps  100
++  main
  |=  inp=(list @t)
  ^-  @t
  |^
    (:(cork parse-input compute-result num-to-cord) inp)
  ++  parse-input
    |=  lst=(list @t)
    ^-  grid
    |^
      (to-mip (parse-text lst))
    ++  parse-text
      |=  lst=(list @t)
      ^-  (list (list @ud))
      ?~  lst  ~
      %+  turn  lst
      |=  inp=@t
      ^-  (list @ud)
      (rash inp (plus dit))
    ++  to-mip
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
        %+  ~(put by res)  y
        %-  malt
        %-  head
        %^  spin  i.inp  1
        |=  [i=@ud s=@ud]
        [[s i] +(s)]
        ::
        inp  t.inp
        y    +(y)
      ==
    --
  ++  compute-result
    |^
      |=  grd=grid
      ^-  @ud
      =|  cnt=@ud
      =|  stp=@ud
      |-
      ?:  =(stp steps)  cnt
      =.  grd  (reset-octopii (flash-octopii (inc-grid grd)))
      $(cnt (add cnt (count-glowies grd)), stp +(stp))
    ++  inc-grid
      |=  grd=grid
      ^-  grid
      %-  ~(run by grd)
      |=  m=(map @ud @ud)
      ^-  (map @ud @ud)
      (~(run by m) inc)
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
      ?.  (~(has bi grd) [x y])  grd
      %:  ~(put bi grd)
        x
        y
        +((~(got bi grd) x y))
      ==
    ++  get-glowies
      |=  grd=grid
      ^-  (set [@ud @ud])
      %-  ~(gas in ^*((set [@ud @ud])))
      %+  turn
        %+  skim  ~(tap bi grd)
        |=  [@ud @ud v=@ud]
        ^-  ?
        (gth v 9)
      |=  [x=@ud y=@ud @ud]
      ^-  [@ud @ud]
      [x y]
    ++  reset-octopii
      |=  grd=grid
      ^-  grid
      %-  ~(run by grd)
      |=  m=(map @ud @ud)
      ^-  (map @ud @ud)
      %-  ~(run by m)
      |=  v=@ud
      ?:((gth v 9) 0 v)
    ++  count-glowies
      |=  grd=grid
      ^-  @ud
      %-  ~(rep by grd)
      |=  [[@ud m=(map @ud @ud)] s=@ud]
      ^-  @ud
      %+  add  s
      %-  ~(rep by m)
      |=  [[@ud v=@ud] s=@ud]
      %+  add  s
      ?:(=(0 v) 1 0)
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
