::  adapted from https://gist.github.com/ynx0/be93cc1c086f8538155c69614d5644e4 (thanks ~sipfyn-pidmex!)
/-  spider
/+  strandio
=,  strand=strand:spider
^-  thread:spider
|=  arg=vase
=/  m  (strand ,vase)
^-  form:m
=/  par     (need !<([(unit [@ud @t])] arg))
=/  day     -.par
=/  url=@t  (crip "https://adventofcode.com/2021/day/{<day>}/input")
=/  headers
  :~  
  :-  'Cookie'
      (cat 3 'session=' +.par)
  ==
=/  =request:http  [%'GET' url headers ~]
=/  =task:iris  [%request request *outbound-config:iris]
=/  =card:agent:gall  [%pass /http-req %arvo %i task]
;<  ~  bind:m  (send-raw-card:strandio card)
;<  res=(pair wire sign-arvo)  bind:m  take-sign-arvo:strandio
?.  ?=([%iris %http-response %finished *] q.res)
  (strand-fail:strand %bad-sign ~)
::  ~&  +.q.res
?~  full-file.client-response.q.res
  (strand-fail:strand %no-body ~)
=/  input-text  `@t`q.data.u.full-file.client-response.q.res
=/  file-path   `path`[%input (cat 3 %day (scot %ud day)) %txt ~]
=/  clay-task   `task:clay`[%info %advent %& [file-path %ins txt+!>((to-wain:format input-text))]~]
;<  ~  bind:m  (send-raw-card:strandio [%pass /write-file %arvo %c clay-task])
(pure:m !>(~))
