class Absensi {
  final String nama;
  final String jabatan;
  final bool hadir;
  final bool tidakHadir;
  final DateTime tanggal;
  final String kegiatan;

  Absensi({
    required this.nama,
    required this.jabatan,
    required this.hadir,
    required this.tidakHadir,
    required this.tanggal,
    required this.kegiatan,
  });

  Absensi.fromMap(Map<String, dynamic> map)
      : nama = map['nama'].toString(),
        jabatan = map['jabatan'].toString(),
        hadir = map['hadir'],
        tidakHadir = map['tidakHadir'],
        tanggal = map['DateTime'],
        kegiatan = map['kegiatan'];

  Map<String, Object?> toMap() {
    return {'nama': nama, 'jabatan': jabatan, 'hadir': hadir};
  }
}
