// Made by Frank 
var exp = "x + 17";


var xValues = [];
var yValues = [];
for (var x = 0; x <= 10; x += 1) {
  yValues.push(eval(exp));
  xValues.push(x);
}

var data = [{
  x: xValues,
  y: yValues,
  mode: "lines"
}];


var layout = {title: "y = " + exp};


Plotly.newPlot("myPlot", data, layout);
