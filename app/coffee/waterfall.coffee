jQuery -> 

  # dimensions
  domainStart = 0
  domainEnd = 125
  domainRange = domainEnd - domainStart

  margin = 40
  h = 400 - margin
  hpx = h + "px"
  w = 640 - margin

  # data inputs
  data =    [80, 20,  -5, 13, -5, -6]

  # calculated
  lastValue = d3.sum(data)
  data.push(lastValue)
 
  console.log("domainRange", domainRange)

  offsets = ycords( domainEnd, data) 

  y = d3.scale.linear()
    .domain([domainStart, domainEnd])
    .range(["0px", hpx])

  yy = d3.scale.linear()
    .domain([domainStart, domainEnd])
    .rangeRound([0, h])

  x = d3.scale.ordinal()
    .domain(data)
    .rangeBands([0, w])

  chart = d3.select("#waterfall")
    .append("svg:svg")
      .attr("width", w)
      .attr("height", h)
    .append("svg:g")
      .attr("transform", "translate(20, 20)")

  
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
    .attr("x", (d,i) -> i * (w/data.length)+2)
    .attr("y", (d,i) -> yy(offsets[i]))
    .attr("width", x.rangeBand())
    .attr("height", (d) -> y(Math.abs(d)))
    .attr("class", "blue")
    .attr("rx", 2)
    .attr("ry", 2)

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

  $('rect').mouseenter (e) -> 
    $(@).attr("class","highlight")

  $('rect').mouseleave (e) -> 
    $(@).attr("class","blue")
