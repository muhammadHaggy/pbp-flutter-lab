# counter_7
# Tugas 7 
## Apa itu Stateless widget dan stateful widget
Stateless widget adalah widget yang tidak bergantung terhadap state. Contoh stateless widget adalah Icon dan Text.

Stateful Widget adalah widget yang bergantung pada sebuah state. Contoh stateful widget adalah Checkbox dan TextField.

## Widget yang saya pakai dan fungsinya
Text widget untuk menampilkan tulisan ganjil, genap, dan angka counter.<br>
Stack untuk menampilkan dua buah floating action button secara bertumpuk.<br>
Floating action button untuk menampilkan tombol mengambang di bawah kiri dan bawah kanan<br>
Pading untuk memberi padding pada floating action button kiri agar masuk ke dalam screen<br>

## Fungsi setState dan Variabel di dalamnya
setState memberitahu framework akan perubahan state, framework akan merespon dengan mengupdate state lalu merender ulang widget tersebut. Pada tugas ini, variabel counter diubah dalam setState.

## Perbedaan const dan final
Const adalah modifier variabel yang membuat value sebuah variabel menjadi tetap dan nilainya harus diketahui saat compile time.

Final adalah modifier yang membuat reference dari sebuah variabel menjadi tetap, namun valuenya masih bisa berubah. Nilai dari final tidak harus diketahui saat compile time.

## Implementasi tugas
Saya membungkus dua floating action button dalam sebuah stack. Lalu membungkus masing-masing button dengan widget Align dengan parameter yang sesuai posisinya masing-masing. Saya juga membungkus button di kiri dengan padding agar berada di dalam screen.  

# Tugas 8
## Perbedaan Navigator.push dan Navigator.pushReplacement
Ketika mengganti pages, Navigator.push menimpa halaman baru di atas halaman saat ini, sedangkan navigator.pushReplacement mengganti halaman lama dengan halaman baru.

## Widget yang dipakai
Form widget yang menjadi parent widget.<br>
DropdownButton widget yang memunculkan beberapa pilihan saat diklik

## Jenis-jenis event pada Flutter
onPressed: event yang di trigger ketika sebuah button di klik.<br>
onChanged: event yang di trigger ketika terjadi perubahan pada widget<br>
onSaved: event yang di trigger

## Cara kerja Navigator mengganti halaman Flutter
Navigator mengganti halaman dengan memanfaatkan Stack. Halaman yang ditampilkan yang paling atas di stack. method push akan menimpa halaman sebelum, sedangkan pushReplacement mengganti halaman saat ini, dan pop kembali ke halaman sebelumnya.

## Jelaskan bagaimana kamu implementasi checklist di atas
Membuat drawer yang berisi navigasi ke halaman form dan budget.<br>
Menambahkan halaman baru pada form.dart dengan form yang berisi judul, nominal, dan jenis budget yang disusun vertikal.<br>
Menambahkan sebuah halaman untuk menampilkan data budget. Data budget ditampilkan dalam listview secara vertikal.<br>
Membuat sebuah class Budget sebagai model penyimpanan data.