PFont font; // Deklarasi objek font
PImage headerImage, profile, like, post; // Deklarasi objek gambar header
int likeCount = 312; // Jumlah like awal
int lastUpdateTime = 0;

Star[] stars = new Star[200]; // Jumlah bintang
int period = 25000; // Periode pergerakan planet (milidetik)
float maxScale = 3.0; // Batas maksimum skala bintang yang lebih kecil

void setup() {
  size(500, 800); // Ukuran canvas
  background(255); // Warna background

  font = createFont("Roboto", 16);
  textFont(font);

  // Menambahkan teks di pojok kiri atas
  fill(0); // Warna teks menjadi hitam
  text("Alfi Nor Ihsan (210910608)", 15, 15);

  // Mengambil gambar di folder
  headerImage = loadImage("header.png");
  profile = loadImage("profile.png");
  like = loadImage("like.png");
  post = loadImage("post.jpg");

  // Inisialisasi bintang-bintang
  for (int i = 0; i < stars.length; i++) {
    float x = random(70, 430); // Posisi X acak dalam rentang (70, 430)
    float y = random(350, 665); // Posisi Y acak dalam rentang (350, 665)
    float scale = random(0.1, 0.3); // Skala acak dalam rentang (0.1, 0.3)
    stars[i] = new Star(x, y, scale); // Membuat objek bintang baru dan menyimpannya
  }
}

void draw() {
  // Deklarasi variabel detik
  int s = second();

  // Menggambar latar
  noStroke();
  fill(36, 37, 39, 255);
  quad(70, 80, 430, 80, 430, 720, 70, 720);

  // Membuat bar hitam di bawah
  fill(0);
  rect(70, 700, 360, 40);

  // membuat tombol home
  fill(0);
  stroke(255);
  strokeWeight(1);
  ellipse(250, 720, 15, 15);

  // Segitiga mengarah ke kiri
  triangle(333, 720, 345, 727, 345, 711);

  line(155, 715, 165, 715);
  line(155, 720, 165, 720);
  line(155, 725, 165, 725);

  // Menampilkan gambar header notifikasi
  image(headerImage, 70, 80, 360, 40);

  // Membuat button back
  fill(234, 235, 239, 255);
  strokeCap(ROUND);
  strokeWeight(3);
  line(90, 140, 100, 130);
  line(90, 140, 100, 150);
  line(94, 140, 110, 140);

   //membuat search bar
  strokeWeight(30);
  stroke(49,50,52,255);
  line(140, 140, 395, 140);
  
  //membuat search icon
  strokeWeight(1);
  stroke(164, 165, 169, 255);
  fill(49,50,52,255);
  circle(145, 138, 10);
  line(150, 142, 155, 145);
  
  
  //membuat garis pembatas
  strokeCap (SQUARE);
  strokeWeight(1);
  stroke(86,87,89,255);
  line(70, 163, 429, 163);
  line(70, 220, 429, 220);
  
  //membuat bar "postingan"
  noStroke();
  fill(37,57,81,255);
  arc(164, 192, 30, 30, -HALF_PI, HALF_PI, OPEN); //setengah lingkaran kearah kanan
  circle(105,192,30);
  square(105, 177, 30);
  square(134, 177, 30);
  square(134, 177, 30);

  
  //membuat lingkaran untuk foto profile
  noStroke();
  fill(255);
  circle(110, 255, 40);
  image(profile, 90, 235, 40, 40);
  
  //Menampilkan logo like
  image(like, 60, 660, 63, 50);
  
  //membuat di samping teks "lainnya"
  fill(184,185,189,255);
  noStroke();
  triangle(408, 187, 414, 195, 420, 187);
  
  //membuat titik 3 samping nama dengan perulangan for
  strokeCap(ROUND);
  stroke(184,185,189,255);
  strokeWeight(4);

  for (int i = 0; i < 3; i++) {
    point(405 - (i * 6), 240); // Menambah tiga titik lebih ke kiri dari titik pertama
  }
  
  
  //menambah teks Cari
  fill(164, 165, 169, 255); 
  textSize(16);
  text("Cari", 165, 145);
  
  //menambah teks pilihan (Postingan, tentang, video dan lainnya)
  fill(134,176,229,255);
  textSize(15);
  text("Postingan", 100, 197);
  text("Postingan", 100, 197);
  fill(178,179,183,255);
  text("Tentang", 195, 197);
  text("Video", 275, 197);  
  text("Lainnya", 345, 197);
  
  
  
  //menambah teks nama Pengguna
  fill(255); // Warna teks putih
  textSize(15); // Ukuran font 15
  text("Ayana Nor Ihsan", 140, 246); // agar bold
  text("Ayana Nor Ihsan", 140, 246);
  
  //menambah teks waktu
  fill(167, 168, 172, 255);
  textSize(12);
  text("1 menit yang lalu", 140, 265);
  
  //menambah teks caption
  textSize(13); 
  text("Mohon izin post puh, kemarin dapat posttest,", 90, 295);
  text("daripada sayang kebuang, kan bagus dipost ke FB", 90, 315);
  text("BTW jan di bully ya, beneran pemula :V", 90, 335);
  
  //menambah teks jumlah komentar
  fill(167, 168, 172, 255);
  textSize(13);
  text("20 komentar", 345, 690);
  
  // menampilkan gambar postingan 
  image(post, 70, 350, 360, 315);
 
// Memperbarui jumlah like setiap detik
  int currentTime = second();
  if (currentTime != lastUpdateTime && likeCount < 400) {  
    if (likeCount < 330) {
      likeCount++; // Menambah jumlah like
    } else {
      likeCount += 2; // Menambah jumlah like dengan peningkatan +2 setelah mencapai 330
    }
    lastUpdateTime = currentTime; // Menyimpan waktu terakhir pembaruan
  }

  // Menampilkan jumlah like yang diperbarui
  fill(167, 168, 172, 255);
  textSize(12);
  text(likeCount, 105, 690);

  // Pergerakan planet
  int m = millis() % period;
  
  
  //Menampilkan bintang
  for (int i = 0; i < stars.length; i++) {
   
    stars[i].update();
  }

  for (int i = 0; i < stars.length; i++) {
    strokeWeight(1);
    stars[i].display();

    // Membuat planet hijau
    noStroke();
    fill(209, 161, 141);
    pushMatrix();
    translate(350, 470); 
    rotate(radians(165)); 

    // planet
    strokeWeight(3);
    stroke(23, 169, 146);
    fill(44, 196, 173);
    circle(0 + 0.01 * m, 10, 50);

    //Kawah planet
    fill(23, 169, 146);
    ellipse(1 + 0.01 * m, 9, 10, 12);
    ellipse(10 + 0.01 * m, 9, 6, 9);
    popMatrix(); 

    // Membuat planet merah pink
    fill(241, 127, 161);
    
    strokeWeight(5);
    stroke(199, 104, 134);
    circle(360, 590, 125); 

    // corak pada planet pink
    strokeWeight(10);
    line(320, 570, 360, 570);
    line(350, 580, 390, 580);

    stroke(223, 118, 151);
    line(350, 600, 390, 600);
    line(340, 610, 370, 610);

    // Membuat planet abu-abu
    fill(198, 198, 198);
    stroke(149, 150, 168);
    strokeWeight(5);
    circle(120, 400, 80); 
    
    //corak pada planet abu-abu
    fill(149, 150, 168);

    circle(130, 400, 10);
    circle(140, 390, 6); 
  }
}

//  untuk menciptakan objek bintang
class Star {
  float x, y; // Posisi bintang (Atribut untuk menyimpan posisi (koordinat X dan Y) dari bintang)
  float scale; // Skala bintang
  float growthRate; // Laju pertumbuhan

  Star(float x, float y, float scale) { // Konstruktor untuk membuat objek bintang
    this.x = x;
    this.y = y;
    this.scale = 1.0; // Skala awal bintang menjadi 1.0
    this.growthRate = random(0.1, 0.5); 
}


  void update() {
    // Pertumbuhan dan berkedip
    scale += growthRate;
    if (scale > maxScale || scale < 1.0) {
      //Jika nilai scale melebihi batas maksimum atau kurang dari 1.0, maka nilai growthRate akan dibalik arahnya.
      growthRate *= -1; // Ubah arah pertumbuhan saat mencapai batas ukuran dan mengecil
    }
  }

  void display() {
    // Menggambar bintang
    pushMatrix();
    translate(x, y);
    scale(scale); // Terapkan scaling
    stroke(255); // Warna putih
    point(0, 0); // Gambar titik (bintang)
    popMatrix();
  }
}
