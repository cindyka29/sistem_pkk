import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'Anggota_Models.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'anggota.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE anggota(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            pokja TEXT,
            jabatan TEXT,
            nama TEXT,
            hadir INTEGER
          )
        ''');
      },
    );
  }

  Future<void> insertAnggota(Anggota anggota) async {
    final db = await database;
    await db.insert('anggota', anggota.toMap());
  }

  Future<List<Anggota>> getAnggotaList() async {
    final db = await database;
    final List<Map<String, dynamic>> anggotaMaps = await db.query('anggota');
    return List.generate(anggotaMaps.length, (index) {
      return Anggota.fromMap(anggotaMaps[index]);
    });
  }
}
