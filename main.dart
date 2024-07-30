// prototip3

import 'package:flutter/material.dart';

void main() {
  runApp(HabitTrackerApp());
}

class HabitTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HabitTrackerHomePage(),
    );
  }
}

class HabitTrackerHomePage extends StatefulWidget {
  @override
  _HabitTrackerHomePageState createState() => _HabitTrackerHomePageState();
}

class _HabitTrackerHomePageState extends State<HabitTrackerHomePage> {
  Map<String, bool> _habits = {
    'Sağlıklı Beslenme': false,
    'Sosyalleşme': false,
    'Kitap Okuma': false,
    'Kişisel Bakım': false,
    'Pazarlama Eğitimi': false,
    'Spor': false,
    'İngilizce': false,
    'Yazı Yaz': false,
    'Yazılım': false,
    'Namaz': false,
  };

  String _selectedDateRange = 'Bugün';

  @override
  void initState() {
    super.initState();
  }

  void _toggleHabit(String habit) {
    setState(() {
      _habits[habit] = !_habits[habit]!;
    });
  }

  void _showAddHabitDialog() {
    final TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.grey[900]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Alışkanlık',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: '',
                    hintStyle: TextStyle(color: Colors.black54),
                    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        setState(() {
                          _habits[_controller.text] = false;
                        });
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      'EKLE',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1.5,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      side: BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDateRangeSelector() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tarih Seçin'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Bugün'),
                onTap: () {
                  setState(() {
                    _selectedDateRange = '30 Temmuz Salı';
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Hafta'),
                onTap: () {
                  setState(() {
                    _selectedDateRange = 'Hafta';
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Ay'),
                onTap: () {
                  setState(() {
                    _selectedDateRange = 'Ay';
                  });
                  Navigator.of(context).pop();
                },
              ),

              ListTile(
                title: Text('100 Gün'),
                onTap: () {
                  setState(() {
                    _selectedDateRange = '100 Gün';
                  });
                  Navigator.of(context).pop();
                },
              ),
              // Diğer seçenekleri buraya ekleyebilirsiniz.
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) => IconButton(
            icon: Icon(Icons.menu),
            color: Colors.red,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text(
          'Sadece Yap',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Menü',
                style: TextStyle(color: Colors.red, fontSize: 36),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text('Ana Sayfa', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.show_chart, color: Colors.white),
              title: Text('İstatistikler', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Handle tap
              },
            ),
            ListTile(
              leading: Icon(Icons.build, color: Colors.white),
              title: Text('Modüler Yapı', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Handle tap
              },
            ),
            ListTile(
              leading: Icon(Icons.school, color: Colors.white),
              title: Text('Eğitim', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Handle tap
              },
            ),
            ListTile(
              leading: Icon(Icons.article, color: Colors.white),
              title: Text('Yazılar', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Handle tap
              },
            ),
            ListTile(
              leading: Icon(Icons.timeline, color: Colors.white),
              title: Text('Verimlilik', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Handle tap
              },
            ),
            ListTile(
              leading: Icon(Icons.lightbulb, color: Colors.white),
              title: Text('Öneriler', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Handle tap
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('Ayarlar', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.share, color: Colors.white),
              title: Text('Paylaş', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Handle tap
              },
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.grey[900]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: _showDateRangeSelector,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Text(
                    _selectedDateRange,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: _habits.keys.map((habit) {
                    return habitCard(habit, _habits[habit]!);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddHabitDialog,
        child: Icon(Icons.close, size: 36, color: Colors.white),
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget habitCard(String title, bool isChecked) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isChecked
                ? [Colors.grey[900]!, Colors.grey[850]!]
                : [Colors.grey[800]!, Colors.grey[700]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    isChecked ? Icons.close : Icons.check_box_outline_blank,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    _toggleHabit(title);
                  },
                ),
                Container(
                  width: 75,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    ),
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ayarlar',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'Ayarlar Sayfası',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
