PImage logo;
boolean isPink = true;

void setup() {
  size(800, 500);  // Ukuran canvas
  background(245, 215, 151, 255); // Warna background
  
  // Menambahkan nama pembuat
  String s = "Alfi Nor Ihsan (2109106018)";
  fill(0);
  text(s, 40, 40, 280, 320); // Menampilkan nama pembuat
 
  noStroke(); // Tidak ada garis pada kotak-kotak
  drawPattern(150, 150, 500, 300, 30); // Menggambar motif kotak-kotak di dalam serbet
  
  // Memuat gambar "logo.png"
  logo = loadImage("logo.png");
  
  // Membuat alas tisu
  stroke(221, 221, 221, 255); // Warna garis abu-abu untuk alas tisu
  strokeWeight(100); // Lebar garis 100 piksel
  point(530, 260); // Menggambar titik sebagai alas tisu
  }

void draw() {
  // Membuat Piring
  stroke(0); // Warna garis hitam
  strokeWeight(1); // Lebar garis 1 piksel
  fill(225); // Warna fill putih
  circle(400, 350, 150); // Menggambar lingkaran sebagai piring
  
  // Membuat garis Piring
  fill(192, 28, 53, 255); // Warna fill merah gelap
  ellipse(400, 350, 145, 145); // Menggambar elips sebagai garis Piring
  
  // Membuat garis Piring 2
  fill(225); // Warna fill putih
  ellipse(400, 350, 140, 140); // Menggambar elips sebagai garis Piring 2
  
  // Membuat garis Piring bagian dalam
  fill(225); // Warna fill putih
  circle(400, 350, 90); // Menggambar lingkaran sebagai garis Piring bagian dalam
  
  // Membuat garis motip serbet
  strokeWeight(10); // Lebar garis 10 piksel
  strokeCap(SQUARE); // Ujung garis persegi
  stroke(171, 255, 195); // Warna garis hijau
  line(174, 150, 174, 450); // Menggambar garis sebagai motif serbet
 
  // Membuat latar logo
  noStroke(); // Tidak ada garis
  fill(171, 255, 195); // Warna fill hijau
  square(585, 380, 60); // Menggambar persegi sebagai latar logo
  
  // Meletakkan gambar
  image(logo, 580, 380, 70, 70); // Menampilkan gambar sebagai logo
  
  // Membuat 2 tisu
  stroke(0); // Warna garis hitam
  strokeWeight(1); // Lebar garis 1 piksel
  fill(255); // Warna fill putih
  triangle(530, 320, 560, 250, 500, 250); // Menggambar segitiga sebagai tisu 1
  triangle(530, 300, 560, 230, 500, 230); // Menggambar segitiga sebagai tisu 2
  
  // Membuat gagang sendok
  fill(221, 221, 221, 255); // Warna fill abu-abu untuk gagang sendok
  rect(525, 300, 10, 80); // Menggambar persegi panjang sebagai gagang sendok
  
  // Membuat kepala sendok 
  ellipse(530, 280, 35, 50); // Menggambar elips sebagai kepala sendok
  
  // Membuat ujung setengah lingkaran 
   arc(530, 380, 10, 10, 0, PI, OPEN); // Menggambar setengah lingkaran sebagai ujung sendok
  }

void drawPattern(float x, float y, float w, float h, float spacing) {
  // Menggambar pola kotak-kotak di dalam serbet
  for (float i = x; i < x + w; i += spacing) {
    for (float j = y; j < y + h; j += spacing) {
      if (isPink) {
        fill(255, 182, 193); // Warna pink
      } else {
        fill(255); // Warna putih
      }
      quad(i, j, i + spacing, j, i + spacing, j + spacing, i, j + spacing);
      isPink = !isPink; // Bergantian antara warna pink dan putih
    }
    isPink = !isPink; // Bergantian antara warna pink dan putih untuk baris berikutnya
  }
}
