<?php
include 'conn_maula_abi.php';

$queryResult=$connect->query("SELECT * FROM tb_karyawan");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
    $result[]=$fetchData;
}

echo json_encode($result);

?>