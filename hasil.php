<?php 
include 'function.php';

if (isset($_SESSION['role'])) {
    if ($_SESSION['role'] == 0) {
        header("location: indexAdmin.php");
        exit();
    } else if ($_SESSION['role'] == 2) {
        header("location: indexPakar.php");
        exit();
    }
} else {
    header("location:index.php");
    exit();
}

if (!isset($_POST['gejala'])) {
    echo "No symptoms selected!";
    exit();
}

$selected_gejala = $_POST['gejala'];

// Asumsi daftar gejala
$gejala_list = [
    1 => 'Gejala 1 = MUNCULNYA BENJOLAN',
    2 => 'Gejala 2 = PENEBALAN DI PAYUDARA ATAU KETIAK',
    3 => 'Gejala 3 = PERUBAHAN UKURAN ATAU BENTUK',
    4 => 'Gejala 4 = KELUARNYA CAIRAN DARI KUPING',
    5 => 'Gejala 5 = PERUBAHAN WARNA PAYUDARA',
    6 => 'Gejala 6 = KULIT PAYUDARA BERLESUNG, MENGERUT, ATAU MENEBAL',
    7 => 'Gejala 7 = BENJOLAN BISA DIGERAKAN DENGAN MUDAH',
    8 => 'Gejala 8 = PEMBENGKAKAN SALAH SATU PAYUDARA',
    9 => 'Gejala 9 = UKURAN BENJOLAN MELEBIHI 2CM TAPI KURANG DARI 5CM',
    10 => 'Gejala 10 = PENYEBARAN KANKER KEKELENJAR GETAH BENING DAERAH LENGAN',
    11 => 'Gejala 11 = BENJOLAN BERUKURAN LEBIH DARI 5CM',
    12 => 'Gejala 12 = PENYEBARAN KANKER KEKELENJAR GETAH BENING DI SKITAR PAYUDARA',
    13 => 'Gejala 13 = METASTASIS TULANG',
    14 => 'Gejala 14 = METASTASIS PARU-PARU',
    15 => 'Gejala 15 = METASTASIS HATI',
    16 => 'Gejala 16 = METASTASIS OTAK',
    17 => 'Gejala 17 = METASTASIS KELENJAR GETAH BENING',
];

$KankerInvasif = [1, 2, 3];
$KankerNonInvasif = [1, 2, 3, 4, 5, 6];
$Stadium1 = [1, 3, 4, 5, 6, 7, 8, 10];
$Stadium2 = [9, 12];
$Stadium3 = [11, 12];
$Stadium4 = [13, 14, 15, 16, 17];

// Fungsi untuk menghitung persentase kecocokan gejala
function calculatePercentage($symptoms, $selected_gejala) {
    $nilai = 0;
    foreach ($selected_gejala as $value) {
        if (in_array($value, $symptoms)) {
            $nilai += 1;
        }
    }
    return number_format(($nilai / count($symptoms)) * 100, 2);
}

// Menghitung persentase untuk setiap jenis kanker
$kanker_invasif_percentage = calculatePercentage($KankerInvasif, $selected_gejala);
$kanker_noninvasif_percentage = calculatePercentage($KankerNonInvasif, $selected_gejala);
$stadium1_percentage = calculatePercentage($Stadium1, $selected_gejala);
$stadium2_percentage = calculatePercentage($Stadium2, $selected_gejala);
$stadium3_percentage = calculatePercentage($Stadium3, $selected_gejala);
$stadium4_percentage = calculatePercentage($Stadium4, $selected_gejala);

// Array map untuk menyimpan nama penyakit dan persentase
$solusi_map = [
    'Kanker payudara invasive sel kanker telah menyebar ke luar saluran ke jaringan sekitar payudara' => $kanker_invasif_percentage,
    'Kanker payudara noninvasif kondisi ketika sel kanker tumbuh dan menetap di lokasi asalnya, yakni payudara dan tidak menyebar.' => $kanker_noninvasif_percentage,
    'Stadium 1 Stadium awal kanker payudara adalah ketika sel kanker belum menyebar luas ke area lain. Pada tahap ini, kanker sudah menyebar ke jaringan sekitar tapi masih di area yang relatif kecil.' => $stadium1_percentage,
    'Stadium 2 Kanker payudara stadium 2 berarti kanker berada di payudara atau di kelenjar getah bening di dekatnya, atau keduanya.' => $stadium2_percentage,
    'Stadium 3 Kanker stadium 3 berarti kanker payudara telah meluas melampaui area tumor dan mungkin telah menyerang kelenjar getah bening dan otot di dekatnya, namun belum menyebar ke organ yang jauh.' => $stadium3_percentage,
    'Stadium 4 kanker payudara stadium IV, adalah bentuk kanker payudara stadium akhir di mana sel-sel kanker telah menyebar (bermetastasis) ke luar payudara.' => $stadium4_percentage,
];

// Mengurutkan solusi_map berdasarkan persentase tertinggi
arsort($solusi_map);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hasil Diagnosis</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="custom.css">
    
        
</style>
</head>
<body>
    <nav class="navbar py-2 navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="gambar/logo.png" width="147" alt="logo">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="btn btn-primary ml-2" href="test.php" role="button">Cek Ulang</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-primary ml-2" href="logout.php" role="button">Log Out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <section class="gejala mt-4">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10 align-self-center">
                    <h3 class="mb-4">Gejala yang Dipilih:</h3>
                    <ul>
                        <?php foreach ($selected_gejala as $gejala): ?>
                            <li><?php echo $gejala_list[$gejala]; ?></li>
                        <?php endforeach; ?>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section class="hasil mt-4">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10 align-self-center">
                    <h3 class="mb-4">Hasil Diagnosis Anda:</h3>
                    <table class="table table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Penyakit</th>
                                <th scope="col">Persentase</th>
                                <th scope="col">Solusi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($solusi_map as $penyakit => $persentase): ?>
                                <tr>
                                    <td><?php echo $penyakit; ?></td>
                                    <td><?php echo $persentase; ?>%</td>
                                    <td>
                                        <?php
                                        // Ganti dengan solusi tetap
                                        echo "OPERASI PENGANGKATAN PAYUDARA/ MASTEKTOMI - TERAPI PENYINARAN - KEMOTERAPI - OBAT PENGHAMBAT HORMON";
                                        ?>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
