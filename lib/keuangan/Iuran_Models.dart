class Iuran {
  final String nama;
  final String jenisKegiatan;
  final int nominalUang;
  final String? buktiPembayaranPath;

  Iuran({
    required this.nama,
    required this.jenisKegiatan,
    required this.nominalUang,
    this.buktiPembayaranPath,
  });
}
