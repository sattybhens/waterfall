# calculate max and min for values + 10%?
# calculate each y
# if d then y is the previous top
# if -d then y is the previous top - height(d)
# 

# for each value, x, y, height, width
# 


jQuery -> 

  data =    [80, -20,  -5, 13,  25, -6]
  tops =    [80,  80,  60, 73,  98, 98]
  bottoms = [ 0,  60,  55, 60,  73, 93]

  sum = 0
  tops = data.map((e,i) ->
    sum += e
  ).slice(1,this.length)

  tops = [80, 80,  65,78 , 103, 103]
  h = 400
  w = 640

  y = d3.scale.linear()
    .domain([0, 125])
    .range(["0px", "400px"])

  yy = d3.scale.linear()
    .domain([0, 125])
    .rangeRound([0, h])

  x = d3.scale.ordinal()
    .domain(data)
    .rangeBands([0, w], 0.1)

  chart = d3.select("body")
    .append("svg:svg")
    .attr("class", "chart")
    .attr("width", w)
    .attr("height", h)
  
  chart.selectAll("line")
    .data(y.ticks(7))
    .enter().append("svg:line")
    .attr("y1", y)
    .attr("y2", y)
    .attr("x1", 0)
    .attr("x2", w)
    .attr("stroke", "#ccc")

  chart.selectAll("rect")
    .data(data)
    .enter().append("svg:rect")
    .attr("x", (d,i) -> i * (w/data.length))
    .attr("y", (d,i) -> h-yy(tops[i]))
    .attr("width", x.rangeBand())
    .attr("height", (d) -> y(Math.abs(d)))
    .attr("class", "blue")
    .attr("rx", 3)
    .attr("ry", 3)

  chart.selectAll("text")
    .data(data)
    .enter().append("svg:text")
    .attr("class","label")
    .attr("x", (d,i) -> (i* (w/data.length)) + (w/data.length)/2)
    .attr("y", h)
    .attr("text-anchor", "middle")
    .text(String)

#  chart.selectAll("text.rule")
#    .data(x.ticks(7))
#    .enter().append("svg:text")
#    .attr("class", "rule")
#    .attr("x", x)
#    .attr("y", 0)
#    .attr("dy", -5)
#    .attr("text-anchor", "middle")
#    .text(String)
#
  chart.append("svg:line")
    .attr("y1", h)
    .attr("y2", h)
    .attr("x1", 0)
    .attr("x2", w)
    .attr("stroke", "#000")

  $('rect').click (e) -> 
    $(@).attr("class","clicked")
    $('#control').html("MC X: " + x + " Y: " + y)

  $('rect').mouseenter (e) -> 
    $(@).attr("class","highlight")
    x = e.pageX - @offsetLeft
    y = e.pageY - @offsetTop
    $('#control').html(" ME X: " + x + " Y: " + y)

  $('rect').mouseleave (e) -> 
    $(@).attr("class","blue")
    $('#control').html("ML X: " + x + " Y: " + y)

  $('#control').html("D: " + data + " O: " + tops + " Y: " + (h - yy(tops[3])) + " H: " + (y(data[3])))
