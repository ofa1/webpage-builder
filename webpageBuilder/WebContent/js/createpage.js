/**
 * 
 */

function getLabels(elementId) {
	count = document.getElementById(elementId).value;
	
	document.getElementById(elementId+"-labels").innerHTML ="Enter the labels for " +elementId+ " :";
	
	for(var i=0; i<count; i++)
	{
		document.getElementById(elementId+"-labels").innerHTML += "<br>"+(i+1)+": <input type=\"text\" name=\""+elementId+"-"+count+"\"" +" ><br>";
	}
}