<?php
include '../../koneksi/koneksi.php';

$kode = $_GET['kode'];

// Ambil informasi produk untuk mendapatkan nama gambar
$produk = mysqli_query($conn, "SELECT * FROM produk WHERE kode_produk = '$kode'");
$row = mysqli_fetch_assoc($produk);

// Hapus gambar produk dari direktori
unlink("../../image/produk/" . $row['image']);

// Hapus produk dari tabel produk
$del = mysqli_query($conn, "DELETE FROM produk WHERE kode_produk = '$kode'");

if ($del) {
    echo "
    <script>
    alert('DATA BERHASIL DIHAPUS');
    window.location = '../m_produk.php';
    </script>
    ";
} else {
    echo "
    <script>
    alert('GAGAL MENGHAPUS DATA');
    window.location = '../m_produk.php';
    </script>
    ";
}
?>
