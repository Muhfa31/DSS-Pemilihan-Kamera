<?php
include "header.php";
include "includes/config.php";
$index = mysqli_query($koneksi,"SELECT * FROM vrangking");
$index2 = mysqli_query($koneksi,"SELECT * FROM vrangking");
?>	
	<br>
	<div class="container">
	  <h1 class="display-5 text-center" id="judul">
	  	  Decision Support System <br>(DSS)
      </h1>
	   <p class="text-justify"> Decision Support System atau DSS adalah sebuah sistem informasi yang memiliki basis komputerisasi. Sistem tersebut merupakan bagian sistem manajemen pengetahuan dan berperan untuk mendukung aktivitas pengambilan keputusan pada sebuah perusahaan atau organisasi. 
DSS dapat diartikan pula sebagai sebuah sistem yang berguna untuk mendukung proses analisis Ad Hoc terhadap data, model sebuah keputusan, orientasi terhadap perencanaan di waktu mendatang, dan juga berorientasikan kepada sebuah keputusan. Adanya DSS ini mampu membantu perusahaan memecahkan masalah atau melakukan komunikasi terhadap kendala yang terstruktur dan tidak terstruktur.</p>
	</div>
	<br>
	<div style="width: 700px; box-sizing: border-box; margin: 0 auto;">
		<canvas id="myChart"></canvas>
	</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
    <script>
var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
    	
        labels: [<?php while ($row = mysqli_fetch_array($index)) {
        	echo '"'.$row['nmalternatif']. '",'; }?>],
        datasets: [{
            data: [<?php while ($row2 = mysqli_fetch_array($index2)) {
        	echo $row2['rangking']. ","; }?>],

            label: 'Grafik Perangkingan',
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: { 
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>

<?php  
include "footer.php";
?>