<%@ taglib prefix="s" uri="/struts-tags" %>
<SCRIPT language=javascript src="script/popcalendar.js"></SCRIPT>
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
<center><h3>Post A Task</h3></center>
<br/><br/>
<form action="submitPost.action" method="post" onsubmit="alert('post')">
<table border="0" width="870px" cellspacing=1 cellpadding=5 style="margin-left:auto; margin-right:auto;">
	<tr><td>Title</td><td colspan="3"><textarea id="post.postTitle" name="post.postTitle" rows ="3" cols="80" maxlength="100"></textarea></tr>
	<tr><td>Description</td><td colspan="3"><textarea id="post.postDesc" name="post.postDesc" rows ="5" cols="80" maxlength="500"></textarea>
	
	</tr>
	<tr><td>Category</td><td><select id="post.category.catId" name="post.category.catId">
		<s:iterator value="categories" status="stat" id="categories">
		<option value="<s:property value="catId"/>"  <s:if test="catId==category.catId">selected</s:if>> 
			<s:property value="catDesc"/> 
		</option>
		</s:iterator>
		</select>
	</td>
	<td>Fee</td><td>RM <input type="text" id="post.postFee" name="post.postFee" maxlength="10"/></td>
	
	</tr>
	<tr><td>Location</td><td><input type="text" id="post.postLocation" name="post.postLocation" maxlength="100"/></td>
	<td>Deadline</td>
	<td>
	<input type="text" name="postEndDate" id="postEndDate" required="No" size="15" maxlength="10"  class="textfield" readonly />
	<input type='button' id="btnEndDate" onclick='popUpCalendar(this, document.getElementById("postEndDate"), "yyyy/mm/dd");' value='Show Calendar' style='font-size:11px'/>
			
	</td>
	
	</tr>
	<tr><td colspan="4"><input type='submit' id="btnSubmit" value="Submit My Post"/></td></tr>
			
</table>
</form>
<br>



<script language="javascript">

</script>
