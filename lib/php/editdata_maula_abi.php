<?php

    include 'conn_maula_abi.php';

    $id = $_POST['id'];
    $nama = $_POST['nama'];
    $jabatan = $_POST['jabatan'];
    $alamat = $_POST['alamat'];
    $notlp = $_POST['notlp'];
    $namaistri = $_POST['namaistri'];
    $namaanak = $_POST['namaanak'];

    $connect->query("UPDATE tb_karyawan SET nama='".$nama."', jabatan='".$jabatan."', alamat='".$alamat."',notlp='".$notlp."',namaistri='".$namaistri."', namaanak='".$namaanak."' WHERE  id=". $id);

?>
