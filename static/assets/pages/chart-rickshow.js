  "use strict";
$(document).ready(function(){
  window.addEventListener('load', resizeGraph, false);
        window.addEventListener('resize', resizeGraph, false);
        function resizeGraph(){
           /*Area chart*/
           $("#areachart").html('');
           var widchart = $("#areachart").width();
           var graph = new Rickshaw.Graph( {
            element: document.querySelector("#areachart"),
            width: widchart,
            height: 200,
            series: [{
                color: '#2196F3',
                data: [
                { x: 0, y: 40 },
                { x: 1, y: 49 },
                { x: 2, y: 38 },
                { x: 3, y: 30 },
                { x: 4, y: 32 } ]
            }]
        });
           graph.render();
           
           /*multiple area chart*/
           $("#multipleAreachart").html('');
           var widMultiChart = $("#multipleAreachart").width();
           var graph1 = new Rickshaw.Graph( {
            element: document.querySelector("#multipleAreachart"),
            width: widMultiChart,
            height: 200,
            renderer: 'area',
            stroke: true,
            series: [ {
                data: [ { x: 0, y: 40 }, { x: 1, y: 49 },{ x: 2, y: 30 }],
                color: '#4CAF50',
                stroke: 'rgba(0,0,0,0.15)'
            }, {
                data: [ { x: 0, y: 10 }, { x: 1, y: 25 },{ x: 2, y: 45 }],
                color: '#ff5252',
                stroke: 'rgba(0,0,0,0.15)'
            } ]
        } );

           graph1.render();

           /*Multiple Bars*/
           $("#barchart").html('');
           var graph2 = new Rickshaw.Graph( {
            element: document.querySelector("#barchart"),
            renderer: 'bar',
            stack: false,
            series: [{
                data: [ { x: 0, y: 40 }, { x: 1, y: 49 },{ x: 2, y: 30 }],
                color: '#40c4ff'
            }, {
                data: [ { x: 0, y: 20 }, { x: 1, y: 24 },{ x: 2, y: 20 }],
                color: '#f57c00'
            }]
        });

           graph2.render();
           
           /*Stacked Bars*/
           $("#stackedchart").html('');
           var graph3 = new Rickshaw.Graph( {
            element: document.querySelector("#stackedchart"),
            renderer: 'bar',
            series: [{
                data: [ { x: 0, y: 40 }, { x: 1, y: 49 }, { x: 2, y: 60 }, { x: 3, y: 20 }, { x: 4, y: 80 }],
                color: '#ff5252'
            }, {
                data: [ { x: 0, y: 20 }, { x: 1, y: 24 }, { x: 2, y: 50 }, { x: 3, y: 10 }, { x: 4, y: 60 }],
                color: '#2196F3'
            }]
        });
           graph3.render();    
       }
resizeGraph();

       });