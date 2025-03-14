import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    TrapeziumPage(),
    CubePage(),
    DayCounterPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Kuis TPM"),
          backgroundColor: Colors.blue, // Warna AppBar
        ),
        body:
            _pages[_selectedIndex], // Menampilkan halaman sesuai _selectedIndex
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "Trapesium",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Kubus",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: "Hari",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profil",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}

// 1. Menu Trapesium
class TrapeziumPage extends StatefulWidget {
  @override
  _TrapeziumPageState createState() => _TrapeziumPageState();
}

class _TrapeziumPageState extends State<TrapeziumPage> {
  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();
  final TextEditingController hController = TextEditingController();
  double area = 0;
  double perimeter = 0;

  void calculate() {
    double a = double.tryParse(aController.text) ?? 0;
    double b = double.tryParse(bController.text) ?? 0;
    double h = double.tryParse(hController.text) ?? 0;
    setState(() {
      area = 0.5 * (a + b) * h;
      perimeter = a + b + (2 * h);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trapesium"),
        backgroundColor: Colors.blue, // Warna AppBar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: aController,
              decoration: InputDecoration(labelText: "Sisi Atas"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: bController,
              decoration: InputDecoration(labelText: "Sisi Bawah"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: hController,
              decoration: InputDecoration(labelText: "Tinggi"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculate,
              child: Text("Hitung"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Warna tombol
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Luas: $area",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Keliling: $perimeter",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. Menu Kubus
class CubePage extends StatefulWidget {
  @override
  _CubePageState createState() => _CubePageState();
}

class _CubePageState extends State<CubePage> {
  final TextEditingController sideController = TextEditingController();
  double volume = 0;
  double perimeter = 0;

  void calculate() {
    double s = double.tryParse(sideController.text) ?? 0;
    setState(() {
      volume = s * s * s;
      perimeter = 12 * s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kubus"),
        backgroundColor: Colors.blue, // Warna AppBar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: sideController,
              decoration: InputDecoration(labelText: "Sisi"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculate,
              child: Text("Hitung"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Warna tombol
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Volume: $volume",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Keliling: $perimeter",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. Menu Penghitung Hari
class DayCounterPage extends StatefulWidget {
  @override
  _DayCounterPageState createState() => _DayCounterPageState();
}

class _DayCounterPageState extends State<DayCounterPage> {
  final TextEditingController dayController = TextEditingController();
  String dayName = "";
  final List<String> days = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
    "Minggu"
  ];

  void findDay() {
    int dayIndex = int.tryParse(dayController.text) ?? 0;
    setState(() {
      if (dayIndex >= 1 && dayIndex <= 7) {
        dayName = days[dayIndex - 1];
      } else {
        dayName = "Hari tidak valid";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Penghitung Hari"),
        backgroundColor: Colors.blue, // Warna AppBar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: dayController,
              decoration: InputDecoration(labelText: "Masukkan angka (1-7)"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: findDay,
              child: Text("Cek Hari"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Warna tombol
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Hari: $dayName",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

// 4. Menu Data Diri
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        backgroundColor: Colors.blue, // Warna AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/galvin.jpg"),
            ),
            SizedBox(height: 10),
            Text("Nama: Galvin Suryo Asmoro", style: TextStyle(fontSize: 18)),
            Text("NIM: 123220125", style: TextStyle(fontSize: 18)),
            Text("Hobby: Berolahraga", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
