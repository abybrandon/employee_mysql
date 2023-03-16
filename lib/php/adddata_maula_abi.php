<?php

include 'conn_maula_abi.php';

$nama = $_POST['nama'];
$jabatan = $_POST['jabatan'];
$alamat = $_POST['alamat'];
$notlp = $_POST['notlp'];
$namaistri = $_POST['namaistri'];
$namaanak = $_POST['namaanak'];

$connect->query("INSERT INTO tb_karyawan (nama,jabatan,alamat,notlp,namaistri,namaanak) VALUES ('".$nama."','".$jabatan."','".$alamat."','".$notlp."','".$namaistri."','".$namaanak."')")

?>
