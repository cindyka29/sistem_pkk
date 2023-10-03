class Anggota {
  final int id;
  final String pokja;
  final String jabatan;
  final String nama;
  final bool hadir;
  final bool? myBoolVariable; // Tambahkan field boolean opsional

  Anggota({
    required this.id,
    required this.pokja,
    required this.jabatan,
    required this.nama,
    required this.hadir,
    this.myBoolVariable, // Jadikan parameter opsional
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pokja': pokja, // Tambahkan field pokja dan jabatan
      'jabatan': jabatan,
      'nama': nama,
      'hadir': hadir,
      'myBoolVariable': myBoolVariable, // Simpan myBoolVariable jika tidak null
    };
  }

  factory Anggota.fromMap(Map<String, dynamic> map) {
    return Anggota(
      id: map['id'],
      pokja: map['pokja'], // Ambil nilai dari Map sesuai dengan field yang sesuai
      jabatan: map['jabatan'],
      nama: map['nama'],
      hadir: map['hadir'],
      myBoolVariable: map['myBoolVariable'], // Ambil myBoolVariable jika ada
    );
  }
}
