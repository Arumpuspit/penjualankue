<?php
include 'header.php';

// Query SQL dengan fungsi agregat untuk kolom yang tidak diagregasi
$result = mysqli_query($conn, "SELECT invoice, kode_customer, MAX(status) AS status, MAX(terima) AS terima, MAX(tolak) AS tolak, MAX(cek) AS cek, MAX(tanggal) AS tanggal_pesanan, MAX(kode_produk) AS kode_produk FROM produksi GROUP BY invoice, kode_customer");
$cek_sor = mysqli_num_rows($result);

?>

<div class="container">
    <h2 style="width: 100%; border-bottom: 4px solid gray"><b>Daftar Pesanan</b></h2>
    <br>
    <h5 class="bg-success" style="padding: 7px; width: 710px; font-weight: bold;">
        <marquee>Lakukan Reload Setiap Masuk Halaman ini, untuk menghindari terjadinya kesalahan data dan informasi</marquee>
    </h5>
    <a href="produksi.php" class="btn btn-default"><i class="glyphicon glyphicon-refresh"></i> Reload</a>
    <br>
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">No</th>
                <th scope="col">Invoice</th>
                <th scope="col">Kode Customer</th>
                <th scope="col">Status</th>
                <th scope="col">Tanggal</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $no = 1;
            while ($row = mysqli_fetch_assoc($result)) {
                ?>
                <tr>
                    <td><?= $no; ?></td>
                    <td><?= $row['invoice']; ?></td>
                    <td><?= $row['kode_customer']; ?></td>
                    <td>
                        <?php
                        if ($row['terima'] == 1) {
                            echo '<span style="color: green;font-weight: bold;">Pesanan Diterima (Siap Kirim)</span>';
                        } elseif ($row['tolak'] == 1) {
                            echo '<span style="color: red;font-weight: bold;">Pesanan Ditolak</span>';
                        } else {
                            echo '<span style="color: orange;font-weight: bold;">' . $row['status'] . '</span>';
                        }
                        ?>
                    </td>
                    <td><?= date('Y/m/d', strtotime($row['tanggal_pesanan'])); ?></td>
                    <td>
                        <?php if ($row['terima'] == 0 && $row['tolak'] == 0 && $row['cek'] == 0) { ?>
                            <!-- Pastikan Anda mendapatkan $row['invoice'] dan $row['kode_produk'] dari hasil query -->
                            <a href="proses/terima.php?inv=<?= $row['invoice']; ?>&kdp=<?= $row['kode_produk']; ?>" class="btn btn-success"><i class="glyphicon glyphicon-ok-sign"></i> Terima</a>
                            <a href="proses/tolak.php?inv=<?= $row['invoice']; ?>" class="btn btn-danger" onclick="return confirm('Yakin Ingin Menolak ?')"><i class="glyphicon glyphicon-remove-sign"></i> Tolak</a>
                        <?php } elseif ($row['tolak'] == 0 && $row['cek'] == 1 && $row['terima'] == 0) { ?>
                            <a href="inventory.php?cek=0" id="rq" class="btn btn-warning"><i class="glyphicon glyphicon-warning-sign"></i> Request Material Shortage</a>
                            <a href="proses/tolak.php?inv=<?= $row['invoice']; ?>" class="btn btn-danger" onclick="return confirm('Yakin Ingin Menolak ?')"><i class="glyphicon glyphicon-remove-sign"></i> Tolak</a>
                        <?php } ?>
                        <a href="detailorder.php?inv=<?= $row['invoice']; ?>" class="btn btn-primary"><i class="glyphicon glyphicon-eye-open"></i> Detail Pesanan</a>
                    </td>
                </tr>
                <?php
                $no++;
            }
            ?>
        </tbody>
    </table>

    <?php
    if ($cek_sor > 0) {
        ?>
        <br>
        <br>
        
    <?php } ?>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br>

<?php include 'footer.php'; ?>
