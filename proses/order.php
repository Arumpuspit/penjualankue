<?php 
include '../koneksi/koneksi.php';
$kd_cs = $_POST['kode_cs'];
$nama = $_POST['nama'];
$prov = $_POST['prov'];
$kota = $_POST['kota'];
$alamat = $_POST['almt'];
$kopos = $_POST['kopos'];
$tanggal = date('Y-m-d');

// Generate Nomor Invoice
$kode = mysqli_query($conn, "SELECT invoice FROM produksi ORDER BY invoice DESC");
$data = mysqli_fetch_assoc($kode);
$num = substr($data['invoice'], 3, 4);
$add = (int) $num + 1;
if(strlen($add) == 1){
    $format = "INV000" . $add;
} elseif(strlen($add) == 2){
    $format = "INV00" . $add;
} elseif(strlen($add) == 3){
    $format = "INV0" . $add;
} else {
    $format = "INV" . $add;
}

// Ambil data keranjang untuk customer ini
$keranjang = mysqli_query($conn, "SELECT * FROM keranjang WHERE kode_customer = '$kd_cs'");

if(mysqli_num_rows($keranjang) > 0){
    while($row = mysqli_fetch_assoc($keranjang)){
        $kd_produk = $row['kode_produk'];
        $nama_produk = $row['nama_produk'];
        $qty = $row['qty'];
        $harga = $row['harga'];
        $status = "Pesanan Baru";

        // Query insert ke tabel produksi
        $order_query = "INSERT INTO produksi (invoice, kode_customer, kode_produk, nama_produk, qty, harga, status, tanggal, provinsi, kota, alamat, kode_pos, terima, tolak, cek) 
                        VALUES ('$format', '$kd_cs', '$kd_produk', '$nama_produk', '$qty', '$harga', '$status', '$tanggal', '$prov', '$kota', '$alamat', '$kopos', '0', '0', '0')";

        $order = mysqli_query($conn, $order_query);

        if(!$order){
            die("Error: " . mysqli_error($conn)); // Pesan kesalahan jika gagal
        }
    }

    // Hapus data keranjang untuk customer ini setelah berhasil melakukan pemesanan
    $del_keranjang = mysqli_query($conn, "DELETE FROM keranjang WHERE kode_customer = '$kd_cs'");

    if($del_keranjang){
        header("location:../selesai.php");
    } else {
        die("Error: " . mysqli_error($conn)); // Pesan kesalahan jika gagal menghapus keranjang
    }
} else {
    die("Error: Keranjang kosong"); // Pesan kesalahan jika keranjang kosong
}
?>
