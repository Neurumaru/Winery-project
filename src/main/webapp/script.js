$(document).ready(function(e){
	chgRowspan();
});

function chgRowspan() {
	var tables = document.getElementsByClassName("target");
	for(var l = 0; l < tables.length; l++) {
		var table = tables[l].children;
		var id = 0;
		var first = null;
		var first_tr = true;
		var first_value = new Array();
		var count = 0;
		
		for(var i = 0; i < table.length; i++) {
			var tr = table[i].children;
			for(var j = 0; j < tr.length; j++) {
				var td = tr[j];
				if(td.getAttribute('class')=="id") {
					if(id != td.innerText) {
						if(id != 0) {
							first.setAttribute('rowspan', count);
							for(var k = 0; k < first_value.length; k++) {
								first_value[k].setAttribute('rowspan', count);
							}
						}
						id = td.innerText;
						first = td;
						count = 1;
						first_tr = true;
						first_value = new Array();
					} else {
						count++;
						td.remove();
						j--;
						first_tr = false;
					}
				} else if(td.getAttribute('class')=="value") {
					if(first_tr)
						first_value.push(td);
					else {
						td.remove();
						j--;
					}
				}
			}
		}
		if(first != null) {
			first.setAttribute('rowspan', count);
			for(var k = 0; k < first_value.length; k++) {
				first_value[k].setAttribute('rowspan', count);
			}
		}
	}
}