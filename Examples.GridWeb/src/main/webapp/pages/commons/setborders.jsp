<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/head.jsp" %>
<title>Worksheets - Aspose.Cells Grid Suite Demos</title>
<script type="text/javascript" src="grid/acw_client/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
 function renderData(data)
	{    //the default stype part for  gridweb component  is Stylemycomponent
		$("#Stylemycomponent").remove(); 
		//need to render gridweb ,this will trigger reinit of gridweb component
		 //the default   name for  gridweb component is mycomponent
		gridwebinstance.remove("mycomponent") ;
		$("#gridweb").html(data);
	}
	function doClickSetBorder( ) {
		 
		$.post("FunctionServlet", {
			firstrow : $("#firstrow").val(),
			firstcol : $("#firstcol").val(),
			rows : $("#rows").val(),
			cols : $("#columns").val(),
			borderposition : $("#borderposition").val(),
			bordercolorname : $("#bordercolorname").val(),
			borderlinetype : $("#borderlinetype").val(),
			flag : "setBorders",//method
			gridwebuniqueid : $("#mycomponent").attr("webuniqueid")
		}, function(data) {
           renderData(data);
		}, "html");
	}
	
	
	function doClick(method) {
	 
		$.post("FunctionServlet", {
			 
			flag : "reload",//method
			gridwebuniqueid : $("#mycomponent").attr("webuniqueid")
		}, function(data) {
			renderData(data);
		}, "html");
	} 
	
	
	//页面加载
	$(document).ready(function(){
		
	 
		
		var method = {id:"reload"};
		doClick(method);
	});
</script>
</head>
<body>
	<div>
		<p>
			Click <b>setborder </b>button to see how demo apply border settings.
		</p>
	</div>

	<div>
		<p>
    <span >firstrow</span> 
    <input type="text" ID="firstrow"  value=1 />
    <span > firstcol</span>  
   <input type="text" ID="firstcol" value=2  /> 
     <span >rows</span> 
    <input type="text" ID="rows" value=4  />
     <span >columns</span> 
   <input type="text" ID="columns" value=5  />
  
</p>
<p>
   <span >border position</span> 
 <select ID="borderposition"  >
        <option value=0>Top</option>
        <option value=1>Bottom</option>
        <option value=2>Left</option>
        <option value=3>Right</option>
		<option value=4>HorizontalMiddle</option>
        <option value=5>VerticalMiddle</option>
        <option value=6>Outline</option>
        <option value=7>Cross</option>
        <option value=8>None</option>
    </select>
     <span >border color</span> 
    <select ID="bordercolorname" >
        <option>Red</option>
        <option>Green</option>
        <option>Yellow</option>
        <option>Blue</option>
        <option>Coral</option>
        <option>Peru</option>
        <option>Violet</option>
		<option>Turquoise</option>
		<option>Tomato</option>
		<option>SpringGreen</option>
		<option>Silver</option>
		<option>SkyBlue</option>
		<option>RoyalBlue</option>
    </select>
 <span >line style</span> 
    <select ID="borderlinetype" >
        <option value=2>Dotted</option>
        <option value=3>Dashed</option>
        <option value=4>Solid</option>
        <option value=5>Double</option>
        
    </select>
  
  <input type="button" ID="Button1"   value="setborders"  onclick="doClickSetBorder()" />
  
</p>
	</div>
	
	<div id="gridweb"></div>
</body>
</html>