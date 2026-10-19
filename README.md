# MealMate

MealMate adalah aplikasi mobile pencarian resep makanan yang dibuat menggunakan Flutter dan Dart. Aplikasi mengambil data resep secara dinamis dari TheMealDB API, lalu menampilkannya dalam bentuk kategori, rekomendasi, hasil pencarian, dan detail resep.

## Fitur Utama

- Menampilkan kategori resep dari API.
- Menampilkan rekomendasi resep acak.
- Mencari resep berdasarkan kata kunci.
- Menampilkan daftar resep berdasarkan kategori.
- Menampilkan detail resep berupa gambar, kategori, asal makanan, bahan-bahan, dan cara memasak.
- Menangani kondisi loading, data berhasil dimuat, data kosong, dan kegagalan koneksi API.

## Teknologi yang Digunakan

- Flutter
- Dart
- Material 3
- `HttpClient` bawaan Dart untuk permintaan HTTP
- TheMealDB API

## API

Data resep diperoleh dari [TheMealDB API](https://www.themealdb.com/api.php).

Endpoint yang digunakan:

- `categories.php` untuk daftar kategori.
- `random.php` untuk rekomendasi resep acak.
- `search.php?s=kata_kunci` untuk pencarian resep.
- `filter.php?c=kategori` untuk resep berdasarkan kategori.
- `lookup.php?i=id_resep` untuk detail resep.

## Struktur Project

```text
lib/
├── main.dart
├── models/
│   └── meal.dart
├── pages/
│   ├── home_page.dart
│   ├── list_page.dart
│   └── detail_page.dart
└── services/
    └── meal_api.dart
```

## Cara Menjalankan Aplikasi

1. Pastikan Flutter SDK telah terpasang dan perangkat atau emulator tersedia.
2. Clone repositori ini.

   ```bash
   git clone <url-repositori>
   ```

3. Masuk ke folder project.

   ```bash
   cd mealmate
   ```

4. Ambil dependency Flutter.

   ```bash
   flutter pub get
   ```

5. Jalankan aplikasi.

   ```bash
   flutter run
   ```

## Catatan

Aplikasi membutuhkan koneksi internet untuk mengambil data resep dan gambar makanan dari API.

## Pengembang

Muhammad Faiz Lidinillah - 240605110043
