###
Map[Any,Any]
###
module.exports = refmap = ->
  
  # storage
  arr = []
  entry = (k) ->
    return x for x in arr when x[0] is k
    undefined
  
  # public API
  get = ( k ) -> entry(k)?[1]    
  
  exists = ( k ) -> entry(k) instanceof Array

  del = ( k ) ->
    if exists k
      arr = ( kv for kv in arr when kv[0] isnt k )
      true
    else
      false
  
  set = ( k, v ) ->
    if ( e = entry(k) )?
      return false if e[1] is v
      e[1] = v
    else
      arr.push [k, v]
    true

  keys = -> ( kv[0] for kv in arr )
  values = -> ( kv[1] for kv in arr )
  clear = -> arr = []
  size = -> arr.length
  
  get_or_else = ( k, block ) ->
    if ( e = entry(k) )?
      e[1]
    else
      arr.push [k, (v = block())]
      v
  
  # we return the API attached to a function
  # which provides quick access: f(k[,v])
  f = ->
    a = arguments
    switch a.length
      when 1 then get a[0]
      when 2 then set a[0], a[1]
      else throw new Error 'refmap takes 1 or 2 parameters'

  f.get = get
  f.set = set
  f.exists = exists
  f.del = del
  f.get_or_else = get_or_else
  f.keys = keys
  f.values = values
  f.clear = clear
  f.size = size

  f