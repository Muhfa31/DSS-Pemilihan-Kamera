<?php  
include "header.php";
include "includes/config.php";

//code insert data
if ($_POST) {
	$nm = $_POST['nm'];
	$tp = $_POST['tp'];

	$insert = mysqli_query($koneksi,"INSERT INTO kriteria 
								VALUES
								('','$nm','$tp','$bbt')");
	if ($insert) {
		echo "<script>location.href='kriteria.php'</script>";
	}else {
		echo "Gagal";
	}
}
?>
<br>
<div class="container">
	<div class="row">
		<div class="col-md-6 text-left">
			<h4>Form Tambah Kriteria</h4>
		</div>
		<div class="col-md-6">
			
		</div>
	</div>
	<br><br>
	<form method="POST" action="">
	  <div class="form-group ">
	    <label for="nm">Nama Kriteria</label>
	    <div>
	     <select class="form-control" id="nm" name="nm">
			<?php
			$readlAllket = mysqli_query($koneksi,"SELECT * FROM kriteria ORDER BY idkriteria ASC");
			while ($row = mysqli_fetch_assoc($readlAllket)){
			extract($row);
			echo "<option value='{$nmkriteria}'>{$nmkriteria}</option>";
			}
			?>
		</select>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="tp">Tipe Kriteria</label>
		<select class="form-control" id="tp" name="tp">
				<option value='benefit'>Benefit</option>
				<option value='cost'>Cost</option>
		</select>
	  </div>
	  <div class="form-group">
	    <div>
	      <button type="submit" class="btn btn-primary">Tambah</button>
	      <button type="button" onclick="location.href='kriteria.php'" class="btn btn-success">Kembali</button>
	    </div>
	  </div>
	</form>
</div>