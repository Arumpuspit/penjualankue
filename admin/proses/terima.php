<?php
include '../../koneksi/koneksi.php';

$inv = $_GET['inv'];

// Update status produksi menjadi terima
$update_query = mysqli_query($conn, "UPDATE produksi SET terima = '1', status = '0' WHERE invoice = '$inv'");

// Jika query update berhasil
if ($update_query) {
    // Redirect ke halaman produksi dengan pesan sukses
    echo "
    <script>
    alert('PESANAN BERHASIL DITERIMA');
    window.location = '../produksi.php';
    </script>
    ";
} else {
    // Jika query update gagal
    echo "
    <script>
    alert('Terjadi kesalahan saat memproses pesanan.');
    window.location = '../produksi.php';
    </script>
    ";
}

?>
