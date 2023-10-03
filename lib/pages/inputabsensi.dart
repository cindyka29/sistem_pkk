import 'package:flutter/material.dart';
import 'Absensi_Models.dart';

// ignore: must_be_immutable
class InputAbsensiPage extends StatefulWidget {
  DateTime selectedDate;
  final String kegiatan;
  final TextEditingController
      tanggalController; // Tambahkan controller untuk tanggal

  InputAbsensiPage({
    required this.selectedDate,
    required this.kegiatan,
    required this.tanggalController,
    required TextEditingController
        kegiatanController, // Tambahkan parameter tanggalController
  });

  @override
  _InputAbsensiPageState createState() => _InputAbsensiPageState();
}

class _InputAbsensiPageState extends State<InputAbsensiPage> {
  late TextEditingController namaController;
  late TextEditingController jabatanController;
  late TextEditingController kegiatanController;
  bool hadir = false;
  bool tidakHadir = false;

  @override
  void initState() {
    super.initState();
    // Mengisi nilai awal kontroler
    namaController = TextEditingController();
    jabatanController = TextEditingController();
    kegiatanController = TextEditingController(
        text: widget.kegiatan); // Isi dengan nilai dari widget.kegiatan
  }

  @override
  Widget build(BuildContext context) {
    debugDisableShadows:
    false;
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Absensi"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input Nama
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: "Nama",
                  prefixIcon: Icon(Icons.person), // Ikon untuk Nama
                ),
              ),
              SizedBox(height: 16.0),

              // Input Jabatan
              TextField(
                controller: jabatanController,
                decoration: InputDecoration(
                  labelText: "Jabatan",
                  prefixIcon: Icon(Icons.work), // Ikon untuk Jabatan
                ),
              ),
              SizedBox(height: 16.0),

              // Input Kegiatan
              TextField(
                controller: kegiatanController,
                decoration: InputDecoration(
                  labelText: "Kegiatan",
                  prefixIcon: Icon(Icons.event), // Ikon untuk Kegiatan
                ),
              ),
              SizedBox(height: 16.0),

              // Input Tanggal (gunakan TextFormField untuk mengaktifkan date picker)
              TextFormField(
                controller: widget
                    .tanggalController, // Gunakan controller untuk tanggal
                readOnly: true,
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: widget.selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != widget.selectedDate) {
                    setState(() {
                      widget.selectedDate = pickedDate;
                      widget.tanggalController.text =
                          pickedDate.toLocal().toString().split(' ')[0];
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText: "Tanggal",
                  prefixIcon: Icon(Icons.calendar_today), // Ikon untuk Tanggal
                ),
              ),

              SizedBox(height: 16.0),

              // Checkbox untuk Kehadiran
              Row(
                children: [
                  Checkbox(
                    value: hadir,
                    onChanged: (value) {
                      setState(() {
                        hadir = value!;
                        tidakHadir =
                            false; // Set "Tidak Hadir" ke false saat "Hadir" dipilih
                      });
                    },
                  ),
                  Text("Hadir"),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: tidakHadir,
                    onChanged: (value) {
                      setState(() {
                        tidakHadir = value!;
                        hadir =
                            false; // Set "Hadir" ke false saat "Tidak Hadir" dipilih
                      });
                    },
                  ),
                  Text("Tidak Hadir"),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Simpan data absensi ke dalam variabel atau database
          String nama = namaController.text;
          String jabatan = jabatanController.text;

          // Kirim data ke halaman sebelumnya (TransactionPage)
          Navigator.pop(
            context,
            Absensi(
              nama: nama,
              jabatan: jabatan,
              hadir: hadir,
              tidakHadir: tidakHadir,
              kegiatan: kegiatanController.text,
              tanggal: widget.selectedDate, // Menggunakan nilai dari parameter
            ),
          );
        },
        child: Icon(Icons.save),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up controller ketika halaman di dispose
    namaController.dispose();
    jabatanController.dispose();
    kegiatanController.dispose();
    super.dispose();
  }
}
