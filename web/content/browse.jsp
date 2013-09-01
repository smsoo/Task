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
	<tr class="head"><th>Title</th><th>Description</th><th>Deadline</th><th>Fee</th><th>Status</th></tr>

	<s:iterator value="posts" status="stat" id="posts">
	<tr><td><s:property value="postTitle"/></td><td><s:property value="postDesc"/></td><td><s:property value="postEndDate"/></td>
		<td><s:property value="postFee"/></td><td><s:property value="status.statusDesc"/></tr>
	</s:iterator>
	
</table>
<br>



<script language="javascript">

</script>
