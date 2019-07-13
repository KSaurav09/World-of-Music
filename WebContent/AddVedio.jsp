<%@include file="adminheader.jsp"%>


<!--main start-->
      <div id="main">
				
		<div id="lt" style="border-radius: 25px;width:15%;height:460px;float:left;opacity:0.0">
		</div>
		
		<div id="cnt" style="border-radius: 25px;width:70%;height:460px;float:left;">
		
		
		<form method = "post" action="AddVedioSong">
			<div id="cntup" >
			
			<fieldset>

			<legend><b>Add Song</b></legend>

			
<table width=100% >
			
			<tr>
				<td><label for="songcat"><b>Song Category*</b></label></td>
				<td><select name="songcat" style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;">
					<option>Select</option>
					<option value="Motivational">Motivational</option>
					<option value="Sad">Sad</option>
					<option value="Soft">Soft</option>
					</select></td>
					
				
				
				
			
				<!-- <td><label for="SongName"><b>Song name*</b></label></td>
				<td><input type="text" placeholder="Enter song name" name="songname" required style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
			 --></tr>
			
			<tr>
				<td><label for="SingerName"><b>Singer Name*</b></label></td>
				<td><input type="text" size="10" placeholder="Enter singer name" name="singername" required style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
			
				<!-- <td><label for="Publisher Name"><b>Publisher name*</b></label></td>
				<td><input type="text" placeholder="Enter publisher name" name="pubname" required style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
			 -->
			</tr>
			
			
			
			<tr>
				<!-- <td><label for="Price"><b>Price*</b></label></td>
				<td><input type="text" size="10" placeholder="Enter price" name="price" required style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
			 -->
				<td><label for="SongRating"><b>Rating*</b></label></td>
				<td><input type="number" placeholder="Enter song rating" name="rating" required style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
			</tr>

			
				
			 <!-- <tr>
				
				
				<td><label for="bkimage"><b>Book Image*</b></label></td>
				<td><input type="file" size="10"  name="bkimage" required style="width: 100%;padding: 12px 20px;margin: 8px 0;display: inline-block;border: 1px solid #ccc;box-sizing: border-box;"></td>
			
				<td></td>

			
			</tr>   -->
			
			
</table>
			<input type="submit" value ="Next"><input type="reset" value = "Reset">
			
			
			</fieldset>
			
			
			
			</div>
		</form>
		
		
		
			
		
		</div>
		
		
		
		<div id="rt" style="border-radius: 25px;width:15%;height:460px;float:left;opacity:0.0">
		</div>
		
	  </div>
       <!--main end-->



<%@include file="footer.jsp"%>