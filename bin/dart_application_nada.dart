import 'package:dart_application_nada/kendaraan.dart';
import 'package:dart_application_nada/mobil.dart';
import 'package:dart_application_nada/motor.dart';
import 'package:dart_application_nada/mixin.dart';

// 1. TANTANGAN: Menghitung total seluruh biaya operasional
double totalBiayaOperasional(List<Kendaraan> daftarKendaraan) {
  double total = 0;
  for (var k in daftarKendaraan) {
    total += k.hitungBiayaOperasional();
  }
  return total;
}

// 2. TANTANGAN: Mencari kendaraan dengan biaya operasional terbesar
Kendaraan kendaraanTermahal(List<Kendaraan> daftarKendaraan) {
  Kendaraan termahal = daftarKendaraan[0];
  for (var k in daftarKendaraan) {
    if (k.hitungBiayaOperasional() > termahal.hitungBiayaOperasional()) {
      termahal = k;
    }
  }
  return termahal;
}

void main() {
  // Membuat 2 objek Mobil & 2 objek Motor
  Mobil mobil1 = Mobil("Toyota", "Avanza", 2022, 7, "Bensin");
  Mobil mobil2 = Mobil("Honda", "HR-V", 2023, 5, "Bensin");

  Motor motor1 = Motor("Honda", "Vario", 2022, "Matic", 150);
  Motor motor2 = Motor("Yamaha", "NMAX", 2024, "Matic", 155);

  // Menyimpan seluruh objek ke dalam List<Kendaraan>
  List<Kendaraan> daftarKendaraan = [mobil1, mobil2, motor1, motor2];

  print("=========================================");
  print("   SISTEM PENGELOLAAN KENDARAAN (PBO)    ");
  print("=========================================\n");

  // Looping Polimorfisme
  for (var kendaraan in daftarKendaraan) {
    kendaraan.tampilkanInfo();
    print("Biaya Operasional : Rp ${kendaraan.hitungBiayaOperasional().toStringAsFixed(0)}");
    
    // Panggil method mixin jika objek menerapkan mixin Perawatan
    if (kendaraan is Perawatan) {
      (kendaraan as Perawatan).jadwalPerawatan();
    }
    
    print("-----------------------------------------");
  }

  // Menjalankan fungsi tantangan tambahan
  print("\n================ TANTANGAN ================");
  double totalBiaya = totalBiayaOperasional(daftarKendaraan);
  print("Total Biaya Operasional Seluruh Kendaraan : Rp ${totalBiaya.toStringAsFixed(0)}");

  Kendaraan termahal = kendaraanTermahal(daftarKendaraan);
  print("Kendaraan dengan Biaya Operasional Terbesar: ${termahal.merk} ${termahal.model} (Rp ${termahal.hitungBiayaOperasional().toStringAsFixed(0)})");
  print("=========================================");
}