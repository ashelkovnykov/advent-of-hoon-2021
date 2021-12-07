/-  spider
/+  strandio,  filter=advent-day3-filter
=,  strand=strand:spider
^-  thread:spider
|=  arg=vase
=/  m  (strand ,vase)
^-  form:m
=+  !<([~ pth=path] arg)
=/  bem=beam  ~|([%path-not-beam pth] (need (de-beam pth)))
;<  cge=cage  bind:m  (read-file:strandio bem)
=+  !<(lst=(list @t) q.cge)
(pure:m !>((main:filter lst)))
