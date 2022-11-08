# counter_7

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