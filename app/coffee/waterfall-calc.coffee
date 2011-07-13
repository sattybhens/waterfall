
window.ycords = (height, data) ->
  y = height
  value = height

  data.map((element, index) -> 
    if element > 0
      y = y - element
      value = y
    else
      value = y
      y = y + Math.abs(element) 
    
    # override value if last item in list
    if data.length == (index+1)
      value = height - element

    value
  )

