import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Open Data",
    theme: ThemeData(
      primarySwatch: Colors.blue,
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    home: const Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Open Data", style: Theme.of(context).textTheme.titleLarge),
        bottom: TabBar(
          controller: controller,
          tabs: const <Widget>[
            Tab(icon: Icon(Icons.home), text: 'Welcome'),
            Tab(icon: Icon(Icons.info), text: 'About'),
            Tab(icon: Icon(Icons.people), text: 'Jumlah Siswa'),
            Tab(icon: Icon(Icons.calendar_today), text: 'Tempat Tanggal Lahir'),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const <Widget>[
          WelcomePage(),
          AboutPage(),
          JumlahSiswaPage(),
          TempatTanggalLahirPage(),
        ],
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Selamat datang di aplikasi Open Data', style: TextStyle(fontSize: 18)),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Ini adalah aplikasi Open Data yang dibuat untuk memberikan informasi.', style: TextStyle(fontSize: 18)),
    );
  }
}

class JumlahSiswaPage extends StatelessWidget {
  const JumlahSiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Jumlah siswa saat ini adalah 300.', style: TextStyle(fontSize: 18)),
    );
  }
}

class TempatTanggalLahirPage extends StatelessWidget {
  const TempatTanggalLahirPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tempat lahir: Jakarta\nTanggal lahir: 1 Januari 2000', style: TextStyle(fontSize: 18)),
    );
  }
}