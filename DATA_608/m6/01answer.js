
d3.csv('https://raw.githubusercontent.com/schoolkidrich/CUNY_MSDS/main/DATA_608/m6/ue_industry.csv', data => {

	  let xScale = d3.scaleLinear()
              .domain(d3.extent(data, d => +d.index))
              .range([20, 1180]);
            
          let yScale = d3.scaleLinear()
              .domain(d3.extent(data, d => +d.Agriculture))
              .range([580, 20]);
                
          let lines = d3.line()
              .x(d => xScale(d.index))
              .y(d => yScale(d['Agriculture']));

    	  d3.select('#answer1')
              .append('path')
              .attr('d', lines(data))
              .attr('stroke', '#2e2928');

});
