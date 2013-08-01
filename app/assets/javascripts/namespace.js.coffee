window.namespace = (names, container) ->
  single = typeof names == 'string'
  _names = if single then [names] else names

  # Start the namespace root at a particular container
  container ||= window

  # Create a single namespace
  createNs = (name) ->
    ns = name.split('.')
    c = container
    (c = c[ns[i]] = c[ns[i]] || {}) for i in [0..(ns.length-1)]
    return c

  # Iterate over namespaces and create each
  spaces = (createNs(name) for name in _names)

  if single then spaces[0] else spaces