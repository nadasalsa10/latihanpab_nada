import 'package:dart_application_nada/kendaraan.dart';
import 'package:dart_application_nada/mixin.dart';

class Mobil extends Kendaraan with Perawatan {
  int jumlahKursi;
  String bahanBakar;

  Mobil(
    String merk,
    String model,
    int tahun,
    this.jumlahKursi,
    this.bahanBakar,
  ) : super(merk, model, tahun);

  @override
  double hitungBiayaOperasional() {
    return 150000 + (jumlahKursi * 25000);
  }

  @override
  void tampilkanInfo() {
    print("=== INFO MOBIL ===");
    print("Merk          : $merk");
    print("Model         : $model");
    print("Tahun         : $tahun");
    print("Jumlah Kursi  : $jumlahKursi");
    print("Bahan Bakar   : $bahanBakar");
  }
}