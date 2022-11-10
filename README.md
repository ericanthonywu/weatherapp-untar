# Untar Weather App Project


## Flutter and Dart version used
Flutter Version: `3.3.8`

Dart Version: `2.18.4`

DevTools `2.15.0`

## Masalah pada code yang terdeteksi :
* Kesalahan pada concatenate string ketika menggenerate url di `weather.dart:21`.
* State di `_WeatherPageeState` tidak di initialized dengan data dari `WeatherService` yang harus diisi terlebih dahulu dengan `getWeatherData()`.

## Solusi yang di berikan :
* Pada class `WeatherService` di method `getWeatherData()` -> mengreturn class yang sudah diisi dengan data yang sudah di get di weather api.
* Memperbaiki kesalahan syntax ketika concatenate string ketika menggenerate url di `weather.dart:21`.
* `_WeatherPageeState` mengambil data pada class `WeatherService` di method `getWeatherData()` kemudian mengisiinya di `setState`.
* Menambahkan state baru dengan nama `isLoading` sebagai indikator ketika mengambil data untuk menghindari error not initialized.
* Mengisi default value di setiap state pada `_WeatherPageeState` dan setiap method di `WeatherService` untuk antisipasi ketika `getWeatherData()` gagal mengambil data untuk menghindari error not initialized.
* temperature balikan dari API berbentuk kelvin, perlu di ubah ke celcius 

Best practice :
* Image diload dalam bentuk static (di download dan di masukan ke asset), untuk menghindari `Connection terminated during handshake` error [https://stackoverflow.com/a/61073515/8423291](https://stackoverflow.com/a/61073515/8423291)  
