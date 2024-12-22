void main() {
  //a şıkkı

  int a = 5;
  print("int: $a");

  String metin = "Merhaba Flutter";
  print("String: $metin");

  double sayi = 3.7;
  print("double: $sayi");

  bool degisken = true;
  print("bool: $degisken");

  dynamic dinamikDegisken = "Bu bir dynamic değişken";
  print("dynamic: $dinamikDegisken");

  String myChar = "a";
  print("char: $myChar");

  //b şıkkı

  var sayiIlk = 5;
  print("integer (camelCase): $sayiIlk");

  var sayi_ilk = 5;
  print("integer (snake_case): $sayi_ilk");

  var SayiIlk = 5;
  print("integer (PascalCase): $SayiIlk");

  //c şıkkı

  String ad = "Elif";
  String soyad = "AY";
  int yas = 22;
  bool resit = yas >= 18;

  print(
      "Merhaba ben en $ad $soyad. $yas yaşında olduğum için reşitlik durumum: $resit");
}
