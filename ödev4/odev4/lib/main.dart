import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Kişilik Anketi"),
          backgroundColor: Colors.deepOrange,
        ),
        body: const AnketSayfasi(),
      ),
    );
  }
}

class AnketSayfasi extends StatefulWidget {
  const AnketSayfasi({super.key});

  @override
  _AnketSayfasiState createState() => _AnketSayfasiState();
}

class _AnketSayfasiState extends State<AnketSayfasi> {
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _soyadController = TextEditingController();
  String _cinsiyet = 'Erkek';
  bool _resitMi = false;
  bool _sigaraKullaniyor = false;
  double _sigaraMiktari = 0;

  // Bilgileri gösteren fonksiyon
  void _gosterBilgiler() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Bilgileriniz"),
          content: Text(
            "Ad: ${_adController.text}\n"
            "Soyad: ${_soyadController.text}\n"
            "Cinsiyet: $_cinsiyet\n"
            "Reşit: ${_resitMi ? 'Evet' : 'Hayır'}\n"
            "Sigara Kullanıyor: ${_sigaraKullaniyor ? 'Evet' : 'Hayır'}\n"
            "Günlük Sigara Sayısı: ${_sigaraKullaniyor ? _sigaraMiktari.toStringAsFixed(0) : 'N/A'}",
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Kapat'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ad ve Soyad TextField'leri aynı satırda
          const Text("Adınız ve Soyadınız", style: TextStyle(fontSize: 18)),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _adController,
                  decoration: const InputDecoration(),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),

          const SizedBox(height: 20),

          // Cinsiyet DropdownButton
          const Text("Cinsiyetinizi Seçiniz", style: TextStyle(fontSize: 18)),
          DropdownButton<String>(
            value: _cinsiyet,
            onChanged: (String? newValue) {
              setState(() {
                _cinsiyet = newValue!;
              });
            },
            items: <String>['Erkek', 'Kadın', 'Diğer']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          // Reşit mi Checkbox
          const Text("Reşit misiniz?", style: TextStyle(fontSize: 18)),
          CheckboxListTile(
            title: const Text("Reşit olduğumu onaylıyorum"),
            value: _resitMi,
            onChanged: (bool? value) {
              setState(() {
                _resitMi = value!;
              });
            },
          ),

          const SizedBox(height: 20),

          // Sigara Kullanıyor musunuz? Switch
          const Text("Sigara kullanıyor musunuz?",
              style: TextStyle(fontSize: 18)),
          SwitchListTile(
            title: const Text("Sigara kullanıyorum"),
            value: _sigaraKullaniyor,
            onChanged: (bool value) {
              setState(() {
                _sigaraKullaniyor = value;
              });
            },
          ),

          // Sigara kullanıyorsa Slider
          if (_sigaraKullaniyor)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Günde kaç sigara içiyorsunuz?",
                    style: TextStyle(fontSize: 18)),
                Slider(
                  value: _sigaraMiktari,
                  min: 0,
                  max: 30,
                  divisions: 30,
                  label: _sigaraMiktari.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _sigaraMiktari = value;
                    });
                  },
                ),
              ],
            ),

          const SizedBox(height: 20),

          // Bilgileri Gönder Butonu
          ElevatedButton(
            onPressed: _gosterBilgiler,
            child: const Text("Bilgilerimi Gönder"),
          ),
        ],
      ),
    );
  }
}
