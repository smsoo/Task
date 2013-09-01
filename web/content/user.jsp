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
<br/><br/>


<center><input type="button" value="Post" onclick="location.href='post.action'"/>  <input type="button" value="Browse" onclick="location.href='browse.action'"/></center>
<script language="javascript">

</script>
