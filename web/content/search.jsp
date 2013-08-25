<%@ taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">

    #trHeadId th {
        border: solid #00A28A;
        border-width: 1px 0px 0px 1px;
        padding: 4px;
    }
    #tblBody {
        height: 600px;
        overflow-y: auto;
        overflow-x: hidden;
    }
</style>
<!--[if IE]>
    <style type="text/css">
        div.tableContainer{
            position: relative;
            height: 600px;
            overflow-y: scroll;
            overflow-x: hidden;
        }
        #trHeadId{
            position: absolute;
            top: expression(this.offsetParent.scrollTop);
        }
        #tblBodyFirstRow td{
            padding: 60px 4px 4px 4px;
        }
        #tblBody {
	        height: auto;
	    }
    </style>
<![endif]--> 
<table width="995" border="0" cellspacing="0" cellpadding="0" class="mt">
<tr>
	<td class="hdl-sm-line" width="369" colspan="2"><img src="image/trans.gif" width="1" height="1" border="0" alt=""></td>
		</tr>
			<tr>
				<td height="250px" width="700px" background="image/main.jpg">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="hdl-sm-line" width="369" colspan="2"><img src="image/trans.gif" width="1" height="1" border="0" alt=""></td>
			</tr>
</table>
<br><br>
<script language="javascript">
	// for SortingTable
	var previousCol    = -1;
	var currentCol     = 0;
	var currentheader  = '';
	var previousheader = '';
	var arrowup        = -1;
	var prevHeadRow	   = 0;
	var prevMinusPoint =  0;
</script>
<table border="0" width="870" cellspacing=1 cellpadding=5 class="generalTable" style="margin-left:auto; margin-right:auto;">
	<tr class="head"><th colspan="2">Category</th></tr>
	<tr><td><%=request.getAttribute("message") %></td></tr>
	
</table>
<br>


<iframe id="upload_target" name="upload_target" src="#" style="width:0;height:0;border:0px solid #fff;"></iframe>
<div id="statusDetailDiv" class="divClass">
	<a name="tabDivLocation"></a>
	<table border="0" id="divTable" bgcolor="#00A28A" cellspacing="0" cellpadding="5"  >
	<tr>
	<td width="100%">
	  <table border="0" width="100%" cellspacing="0" cellpadding="0">
	  <tr>
	  <td id="titleBar" width="100%" style="cursor:move"  onmousedown="dragStart(event,'statusDetailDiv')"><span class="popupTitle" id="frameTitle">Detail</span></td>
	  <td style="cursor:hand" valign="top"><a href="#" onClick="hideMeStatus('statusDetailDiv');return false"><span class="popupTitle">X</span></a>
	  </td>
	  </tr>
	  <tr>
	  <td id="statusDetailTd" width="100%" bgcolor="#FFFFFF" style="padding:5px" colspan="2">
		
		
	  </td>
	  </tr>
	  </table>  
	</td>
	</tr>
	</table>
</div>
<script language="javascript">

</script>
