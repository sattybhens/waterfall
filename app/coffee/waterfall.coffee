jQuery -> 
  data = [1,3,5,13,25,40]
  h = 400
  w = 640
  margin = 15

  y = d3.scale.linear()
    .domain([0, d3.max(data)])
    .range(["0px", "640px"])

  yy = d3.scale.linear()
    .domain([0, d3.max(data)])
    .rangeRound([0, h - margin])

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
    .attr("y", (d,i) -> h - yy(d))
    .attr("width", x.rangeBand())
    .attr("height", y)
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


