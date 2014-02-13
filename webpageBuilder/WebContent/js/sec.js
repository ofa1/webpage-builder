/**
 * 
 */

var buttoncount = 0 ,checkboxcount = 0 ,rediobuttoncount = 0 ,textboxcount = 0; 

function add(){
	//Textbox
	if(document.getElementById("textbox").selected){
		textboxcount++;
		var person = prompt("Please enter the label name");
		//show element
		document.getElementById("sortable").innerHTML += "<li id=\"li_textbox_"+textboxcount+"\"><div id=\"element\">"+person+" :<input type=\"text\" disabled=\"disabled\"></div></li>";
		//add to hidden form
		document.getElementById("space1").innerHTML += "<input type = \"hidden\" name=\"textbox_"+textboxcount+"\" value = \""+person+"\"> ";
	}
	//Radiobutton
	else if(document.getElementById("radiobutton").selected){
		rediobuttoncount++;
		var toadd = "";
		var label = prompt("Please enter the label name");
		var noofbut = prompt("Enter no. of Buttons");
		toadd = "<li id=\"li_radiobutton_"+rediobuttoncount+"\"><div id=\"element\"><label>"+label+" : </label>"+"<input type = \"hidden\" id=\"radiobutton_"+rediobuttoncount+"\" value = \""+label+"_"+noofbut+"\"> ";
		document.getElementById("space1").innerHTML += "<input type = \"hidden\" name=\"radiobutton_"+rediobuttoncount+"\" value = \""+label+"_"+noofbut+"\"> ";
		for(var i = 0 ; i < noofbut ; i++){
			var person = prompt("Please enter the radio button name");
			toadd += "<input type=\"radio\"><label>"+person+"</label>";
			document.getElementById("space1").innerHTML += "<input type = \"hidden\" name=\"radiobuttons_radiobutton_"+rediobuttoncount+"_"+i+"\" value = \""+person+"\"> ";
		}
		toadd +="</div></li>";
		document.getElementById("sortable").innerHTML += toadd;
	}
	
	//Button
	else if(document.getElementById("button").selected){
		buttoncount++;
		var person = prompt("Please enter the label name");
		var buttonname = prompt("Please enter the button name");
		document.getElementById("sortable").innerHTML += "<li id=\"li_button_"+buttoncount+"\"> <div id=\"element\"><label>"+person+"</label> :<input type=\"button\" value = \""+buttonname+"\"></div></li>";
		document.getElementById("space1").innerHTML += "<input type = \"hidden\" name=\"button_"+buttoncount+"\" value = \""+person+"_"+buttonname+"\"> ";
	}
	
	//Checkbox
	else if(document.getElementById("checkbox").selected){
		checkboxcount++;
		var toadd = "";
		var label = prompt("Please enter the label name");
		var noofbut = prompt("Enter no. of Check boxes");
		toadd += "<li id = \"li_checkbox_"+checkboxcount+"\"><div id=\"element\"><label>"+label+"</label> :";
		document.getElementById("space1").innerHTML += "<input type = \"hidden\" name=\"checkbox_"+checkboxcount+"\" value = \""+label+"_"+noofbut+"\"> ";
		for(var i = 0 ; i < noofbut ; i++){
			var person = prompt("Please enter the Check Box name");
			toadd += "<input type=\"checkbox\">"+person;
			document.getElementById("space1").innerHTML += "<input type = \"hidden\" name=\"checkboxes_checkbox_"+checkboxcount+"_"+i+"\" value = \""+person+"\"> ";
		}
		toadd += "</div></li>";
		document.getElementById("sortable").innerHTML += toadd;
	}

}

function save(){
	document.getElementById("space1").innerHTML += "<input type = \"hidden\" name=\"buttoncount\" value = \""+buttoncount+"\"> ";
	document.getElementById("space1").innerHTML += "<input type = \"hidden\" name=\"checkboxcount\" value = \""+checkboxcount+"\"> ";
	document.getElementById("space1").innerHTML += "<input type = \"hidden\" name=\"rediobuttoncount\" value = \""+rediobuttoncount+"\"> ";
	document.getElementById("space1").innerHTML += "<input type = \"hidden\" name=\"textboxcount\" value = \""+textboxcount+"\"> ";
	var a = $('#sortable li').toArray();
	var i = 0;
	for( ; i < a.length ; i++){
		document.getElementById("space1").innerHTML += "<input type = \"hidden\" name = \""+i+"\" value=\""+a[i].id+"\"> ";
	}
	document.getElementById("space1").innerHTML += "<input type = \"hidden\" name=\"count\" value = \""+i+"\"> ";
	document.getElementById("myForm").submit();
}