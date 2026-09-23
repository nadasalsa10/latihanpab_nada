abstract class Kendaraan {
  String _merk;
  String _model;
  int _tahun;

  Kendaraan(this._merk, this._model, int tahun) : _tahun = 1900 {
    this.tahun = tahun;
  }

  String get merk => _merk;
  set merk(String value) => _merk = value;

  String get model => _model;
  set model(String value) => _model = value;

  int get tahun => _tahun;
  set tahun(int value) {
    if (value >= 1900) {
      _tahun = value;
    } else {
      print("Warning: Tahun $value tidak valid (harus >= 1900). Nilai tidak diubah.");
    }
  }

  double hitungBiayaOperasional();
  void tampilkanInfo();
}