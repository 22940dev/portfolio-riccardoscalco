// Generated by CoffeeScript 1.9.3
(function() {
  var clips, createFilter, drawNebula, focus, focusCircle, gaussianDist, getNodes, getTopics, h, height, m, mainTopic, nebulaLine, nebulaPoints, nebulas, nodes, paths, rScale, rand, randomInt, rectDist, session, svg, test, topicPoints, vertices, viz, w, width, xCoords, yCoords;

  session = {};

  session.graph = window.fixtures[0];

  rand = function() {
    return ((Math.random().toString(36)) + "00000000000000000").replace(/[^a-z]+/g, "").slice(0, 5);
  };

  randomInt = function(max, min) {
    if (min == null) {
      min = 0;
    }
    return Math.floor(Math.random() * (max - min) + min);
  };

  gaussianDist = function(mu, sigma, alpha) {
    var x, y, z;
    if (alpha == null) {
      alpha = 1;
    }
    x = Math.random();
    y = Math.random();
    z = alpha * Math.sqrt(-2 * Math.log(x)) * Math.cos(2 * Math.PI * y);
    return z * sigma + mu;
  };

  rectDist = function(x, dx) {
    var max, min;
    min = x - dx;
    max = x + dx;
    return Math.random() * (max - min) + min;
  };

  getNodes = function(graph) {
    return d3.values(graph.nodes).filter(function(e) {
      return e.type !== "topic";
    });
  };

  session.nodes = getNodes(session.graph);

  getTopics = function(nodes) {
    var res;
    res = nodes.map(function(e) {
      return d3.keys(e.topics);
    });
    res = [].concat.apply([], res);
    return _.uniq(res);
  };

  session.topics = getTopics(session.nodes);

  topicPoints = function(topics) {
    var i, j, ref, res;
    res = {};
    for (i = j = 1, ref = topics.length; 1 <= ref ? j <= ref : j >= ref; i = 1 <= ref ? ++j : --j) {
      res[topics[i - 1]] = i * session.dw;
    }
    return res;
  };

  mainTopic = function(topics) {
    var k, v, zip;
    zip = (function() {
      var results;
      results = [];
      for (k in topics) {
        v = topics[k];
        results.push([k, v]);
      }
      return results;
    })();
    zip.sort(function(a, b) {
      return -a[1] + b[1];
    });
    return zip[0][0];
  };

  yCoords = function(mu, sigma, alpha) {
    var y;
    return y = gaussianDist(mu, sigma, alpha);
  };

  xCoords = function(n) {
    var x;
    return x = rectDist(session.topicPoints[mainTopic(n.topics)], session.dw);
  };

  viz = document.getElementById('viz');

  width = 900;

  height = 900 / viz.offsetWidth * viz.offsetHeight;

  m = {
    top: 10,
    bottom: 10,
    right: 0,
    left: 0
  };

  w = width - m.left - m.right;

  h = height - m.top - m.bottom;

  session.dw = w / (session.topics.length + 1);

  session.topicPoints = topicPoints(session.topics);

  rScale = d3.scale.linear().domain([0, 1]).range([0.3, 3]);

  svg = d3.select("#viz").append("svg").attr({
    "viewBox": "0 0 " + width + " " + height,
    "preserveAspectRatio": "xMidYMin slice",
    "width": "100%"
  }).style({
    "padding-bottom": (100 * height / width) + "%",
    "height": "1px",
    "overflow": "visible"
  }).append("g").attr("transform", "translate(" + m.left + "," + m.top + ")");

  nebulas = svg.append("svg:g").attr("id", "nebulas").style("opacity", 0.5);

  focus = svg.append("svg:g").attr("class", "focus").style("opacity", 0);

  focusCircle = focus.append("svg:circle").attr("r", "10").style({
    "fill-opacity": 0,
    "stroke": "red"
  });

  clips = svg.append("svg:g").attr("id", "node-clips");

  nodes = svg.append("svg:g").attr("id", "nodes");

  paths = svg.append("svg:g").attr("id", "nodes-paths");

  nodes.selectAll(".node").data(session.nodes).enter().append("svg:circle").attr("id", function(d, i) {
    return "node-" + i;
  }).attr("cx", function(d) {
    return d.x = xCoords(session.graph.nodes[d.name]);
  }).attr("cy", function(d) {
    return d.y = yCoords(height / 2, 30, 1);
  }).attr("r", function(d) {
    var error;
    try {
      if (session.graph.nodes[d.name].type === "topic") {
        return 0;
      } else {
        return rScale(session.graph.nodes[d.name].weight.metric);
      }
    } catch (_error) {
      error = _error;
      return 2;
    }
  }).attr("class", "node");

  vertices = session.nodes.map(function(d) {
    return [d.x, d.y];
  });

  clips.selectAll("clipPath").data(session.nodes).enter().append("svg:clipPath").attr("id", function(d, i) {
    return "clip-" + i;
  }).append("svg:circle").attr('cx', function(d) {
    return d.x;
  }).attr('cy', function(d) {
    return d.y;
  }).attr('r', 7);

  paths.selectAll("path").data(d3.geom.voronoi(vertices)).enter().append("svg:path").attr("d", function(d) {
    return "M" + d.join(",") + "Z";
  }).attr("id", function(d, i) {
    return "path-" + i;
  }).attr("clip-path", function(d, i) {
    return "url(#clip-" + i + ")";
  }).style("fill", d3.rgb(230, 230, 230)).style('fill-opacity', 0.01).style("stroke-width", 1).style("stroke", "red").style("stroke-opacity", 0);

  paths.selectAll("path").on("mouseover", function(d, i) {
    var f;
    f = nodes.select('circle#node-' + i);
    focusCircle.attr({
      "cx": f.attr("cx"),
      "cy": f.attr("cy")
    });
    return focus.style("opacity", 1);
  }).on("mouseout", function(d, i) {
    return nodes.select('circle#node-' + i);
  });

  nebulaLine = d3.svg.line().tension(0).interpolate("basis");

  nebulaPoints = function(nodes, topic, n) {
    var points;
    points = nodes.filter(function(d) {
      return mainTopic(d.topics) === topic;
    }).map(function(d) {
      return [d.x, d.y];
    });
    return points.slice(0, +n + 1 || 9e9);
  };

  createFilter = function(w, h, color) {
    var baseFrequency, filter, filterid, numOctaves, scale, seed, stdDeviation;
    baseFrequency = "0.02";
    numOctaves = "8";
    seed = randomInt(100) + "";
    stdDeviation = randomInt(6, 4) + "";
    scale = "100";
    filterid = rand();
    filter = d3.select("svg").append("filter").attr({
      "id": filterid,
      "width": w,
      "height": h,
      "x": "-50%",
      "y": "-50%"
    });
    filter.append("feFlood").attr({
      "flood-color": color,
      "result": "element"
    });
    filter.append("feTurbulence").attr({
      "baseFrequency": baseFrequency,
      "type": "fractalNoise",
      "numOctaves": numOctaves,
      "seed": seed,
      "result": "element_1"
    });
    filter.append("feGaussianBlur").attr({
      "stdDeviation": stdDeviation,
      "in": "SourceAlpha",
      "result": "element_2"
    });
    filter.append("feDisplacementMap").attr({
      "scale": scale,
      "in": "element_2",
      "in2": "element_1",
      "result": "element_3"
    });
    filter.append("feComposite").attr({
      "operator": "in",
      "in": "element",
      "in2": "element_3",
      "result": "element_4"
    });
    filter.append("feMerge").append("feMergeNode").attr({
      "in": "element_4"
    });
    return filterid;
  };

  drawNebula = function(topic) {
    var filterid, nebulaColors, points, s, topicColors;
    nebulaColors = _.shuffle(["#5fbed7", "#fd7c6e", "#e88e5a", "#4f86f7", "#ffff99", "#ff5470", "#ffff38", "#aaf0d1", "#ef98aa", "#fd5240", "#9d81ba", "#76ff7a", "#ff3855", "#80daeb", "#ff404c", "#ffa089", "#a2add0", "#ebc7df", "#a0e6ff", "#c5e384", "#ffb653"]);
    topicColors = (function() {
      var i, j, ref, res;
      res = {};
      for (i = j = 0, ref = session.topics.length; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
        res[session.topics[i]] = nebulaColors[i];
      }
      return res;
    })();
    w = session.dw;
    h = height / 4;
    filterid = createFilter(w, h, topicColors[topic]);
    points = nebulaPoints(session.nodes, topic, 1000);
    s = nebulas.append("g").datum(points);
    return s.append("path").attr({
      "d": nebulaLine
    }).style({
      "filter": "url(#" + filterid + ")",
      "stroke": topicColors[topic],
      "fill": "transparent"
    });
  };

  test = svg.append("circle").attr({
    "cx": width / 2,
    "cy": height / 2,
    "r": 5
  }).style({
    "fill": "red"
  }).on("click", function() {
    console.log("click");
    return d3.select(this).transition().duration(1000).attr("cx", width * 0.9);
  });

}).call(this);
