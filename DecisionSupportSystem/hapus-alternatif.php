<?php  
require "include/conn.php";

$id = isset($_GET['id']) ? $_GET['id'] : die('ERROR : MISSING ID. ');
$delete = mysqli_query($db,"DELETE FROM alternatif 
								WHERE idalternatif='$id'");
if ($delete) {
	echo "<script>location.href='alternatif.php';</script>";
}else {
	echo "<script>alert('Gagal Hapus Data');location.href='alternatif.php';</script>";
}
?>