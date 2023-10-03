import 'package:flutter/material.dart';

void main() {
  runApp(MyEdit());
}

class MyEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Ni Made Budi Ayu';
  String email = 'budiayu123@gmail.com';

  void _editProfile(BuildContext context) async {
    final Map<String, String?> result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => EditProfilePage(name, email)),
    );

    if (result.containsKey('name') && result.containsKey('email')) {
      setState(() {
        name = result['name'] ?? name;
        email = result['email'] ?? email;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage('assets/logo google.png'),
            ),
            SizedBox(height: 20.0),
            Text(
              name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              email,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _editProfile(context),
              child: Text('Edit Profil'),
              style: ElevatedButton.styleFrom(),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final String initialName;
  final String initialEmail;

  EditProfilePage(this.initialName, this.initialEmail);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.initialName);
    emailController = TextEditingController(text: widget.initialEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              maxLines: 1, // Menambahkan maksimum 1 baris
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              maxLines: 1, // Menambahkan maksimum 1 baris
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final String newName = nameController.text;
                final String newEmail = emailController.text;

                Navigator.pop(context, {'name': newName, 'email': newEmail});
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
