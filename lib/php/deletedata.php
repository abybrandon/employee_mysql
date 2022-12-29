<?php

    include 'conn_maula_abi.php';

    $id = $_POST['id'];
    $connect->query("DELETE FROM tb_karyawan WHERE id=".$id);
    
?>
