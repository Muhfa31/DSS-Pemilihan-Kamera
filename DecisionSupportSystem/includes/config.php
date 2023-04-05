<?php
$hostname = "localhost";
$database = "dss_pemilihankamera";
$username = "root";
$password = "";
$koneksi = mysqli_connect($hostname, $username, $password, $database);
// script cek koneksi
if (!$koneksi) {
    die("Koneksi Tidak Berhasil: " . mysqli_connect_error());
}
?> 

