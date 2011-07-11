(function() {
  jQuery(function() {
    var chart, data, x, y;
    data = [4, 8, 12, 16, 20, 28];
    x = d3.scale.linear().domain([0, d3.max(data)]).range(["0px", "420px"]);
    y = d3.scale.ordinal().domain(data).rangeBands([0, 120]);
    chart = d3.select("body").append("svg:svg").attr("class", "chart").attr("width", 440).attr("height", 140).append("svg:g").attr("transform", "translate(10,15)");
    chart.selectAll("line").data(x.ticks(7)).enter().append("svg:line").attr("x1", x).attr("x2", x).attr("y1", 0).attr("y2", 120).attr("stroke", "#ccc");
    chart.selectAll("rect").data(data).enter().append("svg:rect").attr("y", function(d, i) {
      return i * 20;
    }).attr("width", x).attr("height", 0).transition().delay(function(d, i) {
      return i * 50;
    }).attr("height", y.rangeBand());
    chart.selectAll("text").data(data).enter().append("svg:text").attr("class", "label").attr("x", x).attr("y", function(d) {
      return y(d) + y.rangeBand() / 2;
    }).attr("dx", -3).attr("dy", ".35em").attr("text-anchor", "end").text(String);
    chart.selectAll("text.rule").data(x.ticks(7)).enter().append("svg:text").attr("class", "rule").attr("x", x).attr("y", 0).attr("dy", -5).attr("text-anchor", "middle").text(String);
    return chart.append("svg:line").attr("y1", 0).attr("y2", 120).attr("stroke", "#000");
  });
}).call(this);
