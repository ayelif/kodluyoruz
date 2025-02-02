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

  void _gonderSonucSayfasi() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SonucSayfasi(
          ad: _adController.text,
          soyad: _soyadController.text,
          cinsiyet: _cinsiyet,
          resitMi: _resitMi,
          sigaraKullaniyor: _sigaraKullaniyor,
          sigaraMiktari: _sigaraMiktari,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Adınız ve Soyadınız", style: TextStyle(fontSize: 18)),
          TextField(
            controller: _adController,
            decoration: const InputDecoration(labelText: "Adınız"),
          ),
          TextField(
            controller: _soyadController,
            decoration: const InputDecoration(labelText: "Soyadınız"),
          ),
          const SizedBox(height: 20),
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
          ElevatedButton(
            onPressed: _gonderSonucSayfasi,
            child: const Text("Bilgilerimi Gönder"),
          ),
        ],
      ),
    );
  }
}

class SonucSayfasi extends StatelessWidget {
  final String ad;
  final String soyad;
  final String cinsiyet;
  final bool resitMi;
  final bool sigaraKullaniyor;
  final double sigaraMiktari;

  const SonucSayfasi({
    super.key,
    required this.ad,
    required this.soyad,
    required this.cinsiyet,
    required this.resitMi,
    required this.sigaraKullaniyor,
    required this.sigaraMiktari,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Anket Sonuçları")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ad: $ad", style: const TextStyle(fontSize: 18)),
            Text("Soyad: $soyad", style: const TextStyle(fontSize: 18)),
            Text("Cinsiyet: $cinsiyet", style: const TextStyle(fontSize: 18)),
            Text("Reşit: ${resitMi ? 'Evet' : 'Hayır'}",
                style: const TextStyle(fontSize: 18)),
            Text("Sigara Kullanıyor: ${sigaraKullaniyor ? 'Evet' : 'Hayır'}",
                style: const TextStyle(fontSize: 18)),
            if (sigaraKullaniyor)
              Text("Günlük Sigara Sayısı: ${sigaraMiktari.round()}",
                  style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
