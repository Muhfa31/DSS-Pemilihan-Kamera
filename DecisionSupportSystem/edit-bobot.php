<?php  
include "header.php";
include "includes/config.php";
//code edit data
$id = isset($_GET['id']) ? $_GET['id'] : die('ERROR: missing ID.');
$query = mysqli_query($koneksi,"SELECT * FROM bobot WHERE idbobot=".$id);
$getRow = mysqli_fetch_array($query);

//code update data
if ($_POST) {
	$ket = $_POST['kt'];
	$jm = $_POST['jm'];

	$update = mysqli_query($koneksi,"UPDATE bobot 
						SET idkriteria = '$ket',valuebobot ='$jm'
						WHERE idbobot ='$id'");
	if ($update) {
		echo "<script>location.href='bobot.php'</script>";
	}else {
		echo "Gagal";
	}
}
?>
<br>
<div class="container">
	<div class="row">
		<div class="col-md-6 text-left">
			<h4>Form Ubah Nilai Kriteria</h4>
		</div>
		<div class="col-md-6">
			
		</div>
	</div>
	<br><br>
	<form method="POST" action="">
	  <div class="form-group row">
	    <label for="id" class="col-sm-2 col-form-label">Id Bobot</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="id" name="id" value="<?php echo $getRow['idbobot'] ?>" disabled>
	    </div>
	  </div>
	  <div class="form-group row">
	    <label for="kt" class="col-sm-2 col-form-label">Id Kriteria</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="kt" name="kt" value="<?php echo $getRow['idkriteria'] ?>">
	    </div>
	  </div>
	  <div class="form-group row">
	    <label for="jum" class="col-sm-2 col-form-label">Value</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="jum" name="jm" value="<?php echo $getRow['valuebobot'] ?>">
	    </div>
	  </div>
	  <div class="form-group row">
	    <div class="col-sm-10">
	      <button type="submit" class="btn btn-primary">Ubah</button>
	      <button type="button" onclick="location.href='bobot.php'" class="btn btn-success">Kembali</button>
	    </div>
	  </div>
	</form>
</div>