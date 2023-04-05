<?php
include "header.php";
include "includes/config.php";
$query = mysqli_query($koneksi,"SELECT * FROM multimoora_1");
?>

<!-- Tabel multimoora 1 dan 2 -->
<br>
<div class="container">
	<div class="row">
		<div class="col-md-6 text-left">
			<h4>Tabel Multimoora 1</h4>
		</div>
		<div class="col-md-6 text-right">
			<button onclick="location.href='tambah-kriteria.php'" class="btn btn-primary">Tambah Data</button>
		</div>
	</div>
	<br>

  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link text-dark" href="rangking.php">Metode SAW</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-dark" href="wp.php">Metode WP</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-dark" href="topsis.php">Metode TOPSIS</a>
    </li>
	<li class="nav-item">
      <a class="nav-link active text-dark" data-toggle="tab" href="multimoora.php">Metode MULTIMOORA</a>
    </li>
  </ul>
  <br>

	<table id="tabeldata" width="100%" class="table table-striped table-bordered">
		<thead>
			<tr>
				<th>No</th>
				<th>Nama Alternatif</th>
				<th>Nama Kriteria</th>
                <th>Tipe</th>
                <th>Bobot</th>
                <th>Nilai</th>
                <th>Skala</th>
                <th>Pra</th>
				<th>Aksi</th>
			</tr>	
		</thead>
<tbody>
<?php
$no=1;
while ($row = mysqli_fetch_array($query)){
?>
            <tr>
                <td><?php echo $no++ ?></td>
                <td><?php echo $row['nmalternatif'] ?></td>
                <td><?php echo $row['nmkriteria'] ?></td>
                <td><?php echo $row['tipe'] ?></td>
                <td><?php echo $row['valuebobot'] ?></td>
                <td><?php echo $row['nilai'] ?></td>
                <td><?php echo $row['skala'] ?></td>
                <td><?php echo $row['pra'] ?></td>
                <td class="text-center">
					<a href="edit-kriteria.php?id=<?php echo $row['idnilai'] ?>" class="btn btn-warning text-white"><i class="fas fa-pencil-alt"></i></a>
					<a href="hapus-kriteria.php?id=<?php echo $row['idnilai'] ?>" onclick="return confirm('Yakin ingin menghapus data')" class="btn btn-danger"><span class="fas fa-trash-alt"></span></a>
			    </td>
            </tr>
<?php
}
?>
</tbody>

		<tfoot>
			<tr>
			</tr>	
		</tfoot>
	</table>
</div>

<!-- Tabel multimoora_3 -->
<?php
include "includes/config.php";
$query = mysqli_query($koneksi,"SELECT * FROM multimoora_3");
?>

<br>
<div class="container">
	<div class="row">
		<div class="col-md-6 text-left">
			<h4>Tabel Normalisasi Multimoora</h4>
		</div>
		<div class="col-md-6 text-right">
			<button onclick="location.href='tambah-kriteria.php'" class="btn btn-primary">Tambah Data</button>
		</div>
	</div>
	<br>

	<table id="tabeldata" width="100%" class="table table-striped table-bordered">
		<thead>
			<tr>
				<th>No</th>
				<th>ID Nilai</th>
				<th>Normalisasi</th>
                <th>Normalisasi Bobot</th>
				<th>Aksi</th>
			</tr>	
		</thead>
<tbody>
<?php
$no=1;
while ($row = mysqli_fetch_array($query)){
?>
            <tr>
                <td><?php echo $no++ ?></td>
                <td><?php echo $row['idnilai'] ?></td>
                <td><?php echo $row['normalisasi'] ?></td>
                <td><?php echo $row['normalisasibobot'] ?></td>
                <td class="text-center">
					<a href="edit-kriteria.php?id=<?php echo $row['idnilai'] ?>" class="btn btn-warning text-white"><i class="fas fa-pencil-alt"></i></a>
					<a href="hapus-kriteria.php?id=<?php echo $row['idnilai'] ?>" onclick="return confirm('Yakin ingin menghapus data')" class="btn btn-danger"><span class="fas fa-trash-alt"></span></a>
			    </td>
            </tr>
<?php
}
?>
</tbody>

		<tfoot>
			<tr>
			</tr>	
		</tfoot>
	</table>
</div>

<!-- Tabel multimoora_4 -->
<?php
include "includes/config.php";
$query = mysqli_query($koneksi,"SELECT * FROM multimoora_4");
?>

<br>
<div class="container">
	<div class="row">
		<div class="col-md-6 text-left">
			<h4>Tabel Hasil Multimoora</h4>
		</div>
		<div class="col-md-6 text-right">
			<button onclick="location.href='tambah-kriteria.php'" class="btn btn-primary">Tambah Data</button>
		</div>
	</div>
	<br>

	<table id="tabeldata" width="100%" class="table table-striped table-bordered">
		<thead>
			<tr>
				<th>No</th>
				<th>ID Alternatif</th>
				<th>Hasil</th>
				<th>Aksi</th>
			</tr>	
		</thead>
<tbody>
<?php
$no=1;
while ($row = mysqli_fetch_array($query)){
?>
            <tr>
                <td><?php echo $no++ ?></td>
                <td><?php echo $row['idalternatif'] ?></td>
                <td><?php echo $row['hasil'] ?></td>
                <td class="text-center">
					<a href="edit-kriteria.php?id=<?php echo $row['idalternatif'] ?>" class="btn btn-warning text-white"><i class="fas fa-pencil-alt"></i></a>
					<a href="hapus-kriteria.php?id=<?php echo $row['idalternatif'] ?>" onclick="return confirm('Yakin ingin menghapus data')" class="btn btn-danger"><span class="fas fa-trash-alt"></span></a>
			    </td>
            </tr>
<?php
}
?>
</tbody>

		<tfoot>
			<tr>
			</tr>	
		</tfoot>
	</table>
</div>

<?php  
include "footer.php";
?>