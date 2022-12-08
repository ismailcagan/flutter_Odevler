import 'package:degiskenler/nesne_tabanli/odev2/odev2_Class.dart';

void main()
{
  var odev2 = odev_2();

  // fahrenayt hesaplama
  print("derecenin fahrenayt karşılığı : ${odev2.dereceyifahrenaytdonusturme(32)}");

  // dikdörtgen hesaplama
  print("dikdörtgen çevre :${odev2.dikdortgencevre(5.2,8)}");

  // faktoriyel hesaplama
  print("faktoriyel :${odev2.faktoriyelhesapla(5)}");

  // girilen metinde a harfi sayısı
  odev2.a_harfiYazma("aiasamaiala");

  // iç açılar toplamı
  print("düzgün çokgenin açısı :${odev2.icacilartoplami(4)}");

  // maas hesabı
  print("maas hesabı :${odev2.maashesabi(20)}");

  // otopark üçreti
  print("otopark üçreti :${odev2.otoparkucreti(5)}");
}