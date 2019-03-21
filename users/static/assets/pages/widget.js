  'use strict';
$(document).ready(function() {
/*======= Progressbar js starts ======= */

    $('#widget-product-list').DataTable({
        "paging": false,
        "ordering": false,
        "bLengthChange": false,
        "info": false,
        "searching": false
    });


    /*Counter Js Starts*/
    $('.counter').counterUp({
        delay: 10,
        time: 400
    });
    /*Counter Js Ends*/

        // Area Chart Starts

        $(window).resize(function() {
           window.morrisChart.redraw();
           $('#areachart').html('');
           var wid = $('#areachart').parent().width();
           rikshaw_chart(wid);
           pietyChart();
       });
        var wid = $('#areachart').parent().width();

        function rikshaw_chart(wid) {
            var graph = new Rickshaw.Graph({
                element: document.querySelector("#areachart"),
                width: wid,
                height: 200,
                series: [{
                    color: '#2196F3',
                    data: [{
                        x: 0,
                        y: 10
                    }, {
                        x: 1,
                        y: 16
                    }, {
                        x: 2,
                        y: 50
                    }, {
                        x: 3,
                        y: 25
                    }, {
                        x: 4,
                        y: 15
                    }, {
                        x: 5,
                        y: 15
                    }, {
                        x: 6,
                        y: 35
                    }, {
                        x: 7,
                        y: 15
                    }]
                }]
            });

            graph.render();
        }
        rikshaw_chart(wid);
        // Area Chart ends

        // Chartlist chart js start
        /*Threshold plugin for Chartist start*/
        new Chartist.Line('.ct-chart11', {
            labels: ['Nov', 'Dec', 'Jan', 'Feb'],
            fillcolor: '#ff3366',
            series: [
            [2, 8, 12, 7, 10, 16]
            ]
        }, {
            showArea: false,
            axisY: {
                onlyInteger: true
            },
            plugins: [
            Chartist.plugins.ctThreshold({
                threshold: 4
            })
            ]
        });
        new Chartist.Line('.ct-chart1', {
            labels: ['Nov', 'Dec', 'Jan', 'Feb'],
            series: [
            [5, -4, 3, 7, 10]
            ]
        }, {
            showArea: false,
            axisY: {
                onlyInteger: true
            },
            plugins: [
            Chartist.plugins.ctThreshold({
                threshold: 4
            })
            ]
        });

        var defaultOptions = {
            threshold: 0,
            classNames: {
                aboveThreshold: 'ct-threshold-above',
                belowThreshold: 'ct-threshold-below'
            },
            maskNames: {
                aboveThreshold: 'ct-threshold-mask-above',
                belowThreshold: 'ct-threshold-mask-below'
            }
        };
        // Chartlist chart js end

        // Pie Chart js start

        pietyChart();
        function pietyChart(){
            $.fn.peity.defaults.pie = {
                delimiter: null,
                fill: ["#2196F3", "#ccc"],
                height: null,
                radius: 15,
                width: null
            }
            $("span.pie").peity("pie");
        };
        // Pie Chart js end

        // Custom-line chart js start
        $(".customchart").sparkline([15, 30, 27, 35], {
            type: 'line',
            width: '600px',
            height: '200px',
            tooltipClassname: 'abc',
            chartRangeMax: '50',
            lineColor: '#fff',
            fillColor: '#2196F3',
        });

        $(".customchart").sparkline([0, 5, 10, 7], {
            type: 'line',
            width: '300px',
            height: '200px',
            composite: '!0',
            tooltipClassname: 'abc',
            chartRangeMax: '40',
            fillColor: '#2196f3',
            lineColor: '#fff'
        });
        // Custom-line chart js end

        /*Bar*/
        $(".barchart").sparkline([5, 6, 2, 4, 9, 1, 2, 8, 3, 6, 4, 2, 9, 6, 4, 8, 6, 4], {
            type: 'bar',
            barWidth: '10px',
            height: '50px',
            barSpacing: '5px',
            tooltipClassname: 'abc'
        });

        //  Resource bar
        $(".resource-barchart").sparkline([5, 6, 2, 4, 9, 1, 2, 8, 3, 6, 4, 2, 9, 8, 5, 7, 8], {
            type: 'bar',
            barWidth: '15px',
            height: '50px',
            barColor: '#fff',
            tooltipClassname: 'abc'
        });


        //  Clock widget js start
      //   function Clock_dg(prop) {
      //       var angle = 360 / 60,
      //       date = new Date();
      //       var h = date.getHours();
      //       if (h > 12) {
      //           h = h - 12;
      //       }
        //
      //       var hour = h;
      //       var minute = date.getMinutes(),
      //       second = date.getSeconds(),
      //      hourAngle = (360 / 12) * hour + (360 / (12 * 60)) * minute;
        //
      //       $('#minute')[0].style[prop] = 'rotate(' + angle * minute + 'deg)';
      //       $('#second')[0].style[prop] = 'rotate(' + angle * second + 'deg)';
      //       $('#hour')[0].style[prop] = 'rotate(' + hourAngle + 'deg)';
      //   }
      //   $(function() {
      //       var props = 'transform WebkitTransform MozTransform OTransform msTransform'.split(' '),
      //       prop,
      //       el = document.createElement('div');
        //
      //       for (var i = 0, l = props.length; i < l; i++) {
      //           if (typeof el.style[props[i]] !== "undefined") {
      //               prop = props[i];
      //               break;
      //           }
      //       }
      //       setInterval(function() {
      //           Clock_dg(prop)
      //       }, 100);
      //   });
        //  Clock widget js end

        // C3 chart js
        /*Pie Chart*/

        var chart = c3.generate({
            bindto: '#chart3',
            data: {
                // iris data from R
                columns: [
                ['data1', 20],
                ['data2', 30],
                ],
                type: 'pie',
                onclick: function(d, i) {
                    console.log("onclick", d, i);
                },
                onmouseover: function(d, i) {
                    console.log("onmouseover", d, i);
                },
                onmouseout: function(d, i) {
                    console.log("onmouseout", d, i);
                }
            }
        });

        setTimeout(function() {
            chart.load({
                columns: [
                ["Chrome", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
                ["Safari", 1.4, 1.5, 1.5, 1.3, 1.5, 1.3, 1.6, 1.0, 1.3, 1.4, 1.0, 1.5, 1.0, 1.4, 1.3, 1.4, 1.5, 1.0, 1.5, 1.1, 1.8, 1.3, 1.5, 1.2, 1.3, 1.4, 1.4, 1.7, 1.5, 1.0, 1.1, 1.0, 1.2, 1.6, 1.5, 1.6, 1.5, 1.3, 1.3, 1.3, 1.2, 1.4, 1.2, 1.0, 1.3, 1.2, 1.3, 1.3, 1.1, 1.3],
                ["Firefox", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
                ]
            });
        }, 1500);

        setTimeout(function() {
            chart.unload({
                ids: 'data1'
            });
            chart.unload({
                ids: 'data2'
            });
        }, 2500);


        /*Donut Hole*/
        var data2 = [{
            label: "Man's Wear",
            data: 2034,
            color: "#3f51b5"
        }, {
            label: "Woman's Wear",
            data: 7510,
            color: "#ff5252"
        }, {
            label: "Children's Wear",
            data: 10410,
            color: "#f69026"
        }, {
            label: "Electronics",
            data: 9610,
            color: "#1b8bf9"
        }, {
            label: "Accesories",
            data: 8670,
            color: "#4caf50"
        }];
        // $.plot('#placeholder3', data2, {
        //     series: {
        //         pie: {
        //             innerRadius: 0.5,
        //             show: true
        //         },
        //         legend: {
        //             show: true
        //         }
        //     }
        // });

        // Owl carousel js
        $(".slider-center").owlCarousel({
            dots: true,
            nav: true,
            autoplay: true,
            autoplayTimeout: 1000,
            margin: 10,
            smartSpeed: 1000,
            loop: true,
            slideSpeed: 300,
            items: 1,
            // rtl: true, this start a image from right side to left
            singleItem: true,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1,
                    nav: true
                },
                1000: {
                    items: 1,
                    nav: true,
                    loop: true
                }
            }

        });

        // Morris js
        /*Area chart*/
      //   morrisChart();
      //   function morrisChart() {
      //     window.morrisChart = Morris.Area({
      //       element: 'area-example',
      //       data: [{
      //           y: '2006',
      //           a: 200,
      //           b: 40
      //       }, {
      //           y: '2007',
      //           a: 75,
      //           b: 65
      //       }, {
      //           y: '2008',
      //           a: 50,
      //           b: 40
      //       }, {
      //           y: '2009',
      //           a: 75,
      //           b: 85
      //       }, {
      //           y: '2010',
      //           a: 70,
      //           b: 40
      //       }, {
      //           y: '2011',
      //           a: 200,
      //           b: 65
      //       }, {
      //           y: '2012',
      //           a: 100,
      //           b: 90
      //       }],
      //       xkey: 'y',
      //       ykeys: ['a', 'b'],
      //       labels: ['<i class="fa fa-user fa fa-circle-thin m-r-5"></i> Statistic #1', '<i class="fa fa-user fa fa-circle-thin m-r-5"></i>Statistic #2']
      //   });
      // }

//add scroll to table

$(".widget-table-scroll").slimScroll({
                height: 273,
                 allowPageScroll: false,
                 wheelStep:5,
                 color: '#000'
           });

});

$('.to-do-list input[type=checkbox]').on('click',function(){

        if($(this).prop('checked'))
            $(this).parent().addClass('done-task');
        else
            $(this).parent().removeClass('done-task');
    });
