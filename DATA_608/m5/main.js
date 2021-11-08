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
