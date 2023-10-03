import 'package:flutter/material.dart';
import 'Absensi_Models.dart';
import 'inputabsensi.dart'; // Impor halaman InputAbsensiPage

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  TextEditingController kegiatanController = TextEditingController();
  TextEditingController tanggalController =
      TextEditingController(); // Tambahkan controller untuk tanggal

  List<Absensi> absensiAnggota = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Absensi Anggota PKK Desa Kubutambahan"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: absensiAnggota.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(absensiAnggota[index].nama),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(absensiAnggota[index].jabatan),
                      SizedBox(height: 4.0),
                      Text(
                        absensiAnggota[index].hadir ? "Hadir" : "Tidak Hadir",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: absensiAnggota[index].hadir
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      Text(
                        "Kegiatan: ${absensiAnggota[index].kegiatan}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Tanggal: ${absensiAnggota[index].tanggal.toLocal().toString().split(' ')[0]}", // Menampilkan tanggal
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InputAbsensiPage(
                                selectedDate: DateTime.now(),
                                kegiatanController: kegiatanController,
                                tanggalController:
                                    tanggalController, // Kirim controller tanggal
                                kegiatan: '',
                              ),
                            ),
                          );
                          if (result != null) {
                            setState(() {
                              absensiAnggota[index] = result;
                            });
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            absensiAnggota.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputAbsensiPage(
                      selectedDate: DateTime.now(),
                      kegiatanController: kegiatanController,
                      tanggalController:
                          tanggalController, // Kirim controller tanggal
                      kegiatan: '',
                    ),
                  ),
                );

                if (result != null) {
                  setState(() {
                    absensiAnggota.add(result);
                  });
                }
              },
              child: Text("Tambah Absensi"),
            ),
          ),
        ],
      ),
    );
  }
}
