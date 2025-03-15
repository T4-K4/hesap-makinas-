import 'dart:math';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _deger = TextEditingController();
  Color _color = Colors.transparent;
  String _newMesaj = '';


  void _rand() {
    setState(() {
      _deger.text = Random().nextInt(11).toString();
    });
  }

  void _kontrol(String islemler) {
    int number = int.tryParse(_deger.text) ?? 0;
    if (number < 0 || number > 10) {
      // 1-10 aralığı dışındaki durumlar için hata mesajı
      setState(() {
        _newMesaj = 'Hata: Geçersiz sayı girişi!';
        _color = Colors.red; // Kırmızı arka plan
      });
      return;
    }

    int result;
    switch (islemler) {
      case 'faktoriyel':
        result = _fak(number);
        setState(() {
          _newMesaj = 'Sonuç: $result';
          _color = Colors.green; // Yeşil arka plan
        });
        break;
      case 'kare':
        result = _kare(number);
        setState(() {
          _newMesaj = 'Sonuç: $result';
          _color = Colors.green; // Yeşil arka plan
        });
        break;
      case 'küp':
        result = _kup(number);
        setState(() {
          _newMesaj = 'Sonuç: $result';
          _color = Colors.green; // Yeşil arka plan
        });
        break;
      default:
        _newMesaj = '';
    }
  }

  int _fak(int n) {
    if (n <= 1) return 1;
    return n * _fak(n - 1);
  }

  int _kare(int n) {
    return n * n;
  }

  int _kup(int n) {
    return n * n * n;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: Center(child: Text("Matematik Hesaplayıcı",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _deger,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Bir sayı giriniz (1-10 arası)",
                  suffixStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _kontrol('faktoriyel'),
                    child: Text('FAKTÖRİYEL'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _kontrol('kare'),
                    child: Text('KARE'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _kontrol('küp'),
                    child: Text('KÜP'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      color: _color,
                      height: 100,
                      width: 300,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 30,
                      ),
                      child: Text(_newMesaj),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _rand();
          },
          backgroundColor: const Color.fromARGB(255, 227, 243, 3),
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
