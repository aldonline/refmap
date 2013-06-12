###
Map f(ref) -> ref
###
module.exports = refmap = ->
  arr = []
  entry = (k) -> return x for x in arr when x[0] is k
  get:    ( k ) -> entry(k)?[1]    
  exists: ( k ) -> entry(k)?
  del:    ( k ) ->
    arr = ( kv for kv in arr when kv[0] isnt k )
    undefined
  set: ( k, v ) ->
    if ( e = entry(k) )?
      e[1] = v
    else
      arr.push [k, v]
    v
  get_or_else: ( k, block ) ->
    if ( e = entry(k) )?
      e[1]
    else
      arr.push [k, (v = block())]
      v