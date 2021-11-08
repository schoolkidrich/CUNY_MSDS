function setHtml(input_id,target_id,func){
    let input = document.getElementById(input_id).value
    let target = document.getElementById(target_id)
    target.innerHTML = func(input)
    }


function reverseString(string){
  let new_str = ''
    for (let letter in string){
    new_str = string[letter] + new_str
    }
  return(new_str)
}


function getTables(num){
	let iter = 1
  let tables = '<table>\n<tr>'
  while (iter <= 20){
  	let multiple = iter*num;
    tables = tables + '<td>' + multiple.toString() + '</td>'
    if (iter == 20){
    	tables = tables + '</tr>\n</table>'
    } else if (iter%4 == 0){
    	tables = tables + '</tr>\n<tr>'
    }
    iter = iter + 1
  }
	return (tables)
}


function processData(data){
	let presidents = {}
	for (let i in data){
		let president = data[i]
		presidents[president.Name] = [president.Height, president.Weight]
		}
  createTable(presidents);
  createLabel(Object.keys(presidents));
  changeSelection(presidents);
	}


function createTable(dict){
	let entries = document.getElementById('presidentTable')
	let table = '<table>\n<tr><td>Name</td><td>Height</td><td>Weight</td></tr>\n'

	for (let i in dict){
		n = i;
		h = dict[i][0]
		w = dict[i][1]
		table = table + 
			'<tr><td>'+ n +
			'</td><td>'+ h +
			'</td><td>'+ w + 
			'</td></tr>\n'
	}
	entries.innerHTML = table + '</table>'
}


function loadData(){
	Plotly.d3.csv('https://raw.githubusercontent.com/schoolkidrich/schoolkidrich.github.io/main/presidents.csv',
	function(data){ processData(data);
  })
 }
 
 
function createLabel(data){
	 Plotly.d3
    .select('#options')
    .selectAll('option')
    .data(data)
    .enter()
    .append('option')
    .text(function(d) {
      return d;
    })
    .attr('value', function(d) {
      return d;
    });
}



function setTraits(data, val){
	let traits = document.getElementById('traits')
  let text = 'Height: ' + data[val][0] + '\nWeight: ' + data[val][1] 
  traits.innerHTML = text
}



function changeSelection(data){
	Plotly.d3.select('#options').on('change', function() {
			let newVal = Plotly.d3.event.target.value
    	setTraits(data, newVal)
  	})
 }


loadData()
