<?php
include 'header.php';

// Ambil nilai invoice dari URL
$invoice = $_GET['inv'];

// Query untuk mendapatkan detail pesanan berdasarkan invoice
$orderQuery = mysqli_query($conn, "SELECT * FROM produksi WHERE invoice = '$invoice'");
$orderDetails = mysqli_fetch_assoc($orderQuery);
?>

<div class="container">
    <h2 style="width: 100%; border-bottom: 4px solid gray"><b>Detail Pesanan</b></h2>
    <br>
    <table class="table table-striped">
        <tbody>
            <tr>
                <th scope="col">Invoice</th>
                <td><?= $orderDetails['invoice']; ?></td>
            </tr>
            <tr>
                <th scope="col">Kode Customer</th>
                <td><?= $orderDetails['kode_customer']; ?></td>
            </tr>
            <tr>
                <th scope="col">Kode Produk</th>
                <td><?= $orderDetails['kode_produk']; ?></td>
            </tr>
            <tr>
                <th scope="col">Nama Produk</th>
                <td><?= $orderDetails['nama_produk']; ?></td>
            </tr>
            <tr>
                <th scope="col">Qty</th>
                <td><?= $orderDetails['qty']; ?></td>
            </tr>
            <tr>
                <th scope="col">Harga</th>
                <td><?= number_format($orderDetails['harga'], 0, ".", "."); ?></td>
            </tr>
            <tr>
                <th scope="col">Status</th>
                <td><?= $orderDetails['status']; ?></td>
            </tr>
            <tr>
                <th scope="col">Tanggal</th>
                <td><?= date('Y/m/d', strtotime($orderDetails['tanggal'])); ?></td>
            </tr>
            <tr>
                <th scope="col">Provinsi</th>
                <td><?= $orderDetails['provinsi']; ?></td>
            </tr>
            <tr>
                <th scope="col">Kota</th>
                <td><?= $orderDetails['kota']; ?></td>
            </tr>
            <tr>
                <th scope="col">Alamat</th>
                <td><?= $orderDetails['alamat']; ?></td>
            </tr>
            <tr>
                <th scope="col">Kode Post</th>
                <td><?= $orderDetails['kode_pos']; ?></td>
            </tr>
            <?php if ($orderDetails['terima'] != 0) { ?>
            <tr>
                <th scope="col">Terima</th>
                <td><?= $orderDetails['terima']; ?></td>
            </tr>
            <?php } ?>
            <?php if ($orderDetails['tolak'] != 0) { ?>
            <tr>
                <th scope="col">Tolak</th>
                <td><?= $orderDetails['tolak']; ?></td>
            </tr>
            <?php } ?>
        </tbody>
    </table>
    <a href="produksi.php" class="btn btn-default">Kembali</a>
</div>

<?php include 'footer.php'; ?>
