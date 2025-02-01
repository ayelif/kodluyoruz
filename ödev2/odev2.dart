//dikdörtgen alanı

// double dikdortgenAlani(double uzunKenar, double kisaKenar) {
//   return uzunKenar * kisaKenar;
// }

// void main() {
//   double uzunKenar = 4.6;
//   double kisaKenar = 9.55;
//   double alan = dikdortgenAlani(uzunKenar, kisaKenar);
//   print('Dikdörtgenin alanı: $alan');
// }
//---------------------------------------------

// fonksiyon tanımlama

// int carp(int a, int b) {
//   // İç içe fonksiyon tanımı
//   int multiplyByTwo(int x) => x * 2;

//   int result = a; // Başlangıç değeri
//   for (int i = 1; i < b; i++) {
//     result = multiplyByTwo(result);
//   }

//   return result;
// }

// void main() {
//   int sonuc = carp(5, 3);
//   print("Sonuç: $sonuc");
// }

// -----------------------------------------------

//Girilen listeden girilen veriyi silen fonksiyon örneğini yazınız.

// void veriSil(List<dynamic> liste, dynamic veri) {
//   liste.remove(veri);
// }

// void main() {
//   List<int> sayilar = [10, 20, 30, 40, 50];

//   print("Orijinal Liste: $sayilar");

//   int silinecek = 30;
//   veriSil(sayilar, silinecek);

//   print("Güncellenmiş Liste: $sayilar");
// }
// -----------------------------------------------

//Bir tane şekiller class’ı oluşturunuz ve 5 tane şekil object’i (objesi) tanımlayınız.
class Sekil {
  String adi;
  int kenarSayisi;

  // Constructor (Yapıcı Metot)
  Sekil(this.adi, this.kenarSayisi);

  // Şekil bilgilerini yazdıran metot
  void bilgileriGoster() {
    print("Şekil: $adi, Kenar Sayısı: $kenarSayisi");
  }
}

void main() {
  // 5 farklı şekil nesnesi oluşturuluyor
  Sekil kare = Sekil("Kare", 4);
  Sekil dikdortgen = Sekil("Dikdörtgen", 4);
  Sekil ucgen = Sekil("Üçgen", 3);
  Sekil besgen = Sekil("Beşgen", 5);
  Sekil altigen = Sekil("Altıgen", 6);

  // Şekil bilgilerini ekrana yazdırma
  kare.bilgileriGoster();
  dikdortgen.bilgileriGoster();
  ucgen.bilgileriGoster();
  besgen.bilgileriGoster();
  altigen.bilgileriGoster();
}
