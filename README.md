# MealMate

MealMate adalah aplikasi pencarian resep makanan berbasis Flutter. Aplikasi mengambil data secara dinamis dari TheMealDB API dan menampilkan kategori, rekomendasi, hasil pencarian, serta detail resep.

## Fitur utama

- Kategori resep dari API
- Rekomendasi resep acak
- Pencarian resep berdasarkan kata kunci
- Daftar resep berdasarkan kategori
- Detail resep, bahan-bahan, dan cara memasak
- Penanganan kondisi loading, berhasil, dan gagal mengambil data

## Teknologi

- Flutter dan Dart
- Material 3
- `HttpClient` bawaan Dart
- TheMealDB API: `https://www.themealdb.com/api.php`

## Menjalankan aplikasi

1. Pastikan Flutter SDK dan perangkat/emulator tersedia.
2. Jalankan `flutter pub get` pada folder project.
3. Jalankan `flutter run`.

Perangkat memerlukan koneksi internet untuk memuat data resep dan gambar dari API.
