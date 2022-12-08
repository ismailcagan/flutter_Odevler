
class odev_2
{
  // parametre olarak girilen dereceyi fahrenayt'a dönüştürdükten sonra geri döndüren bir metot yazınız. F = C*1.8 +32
  double dereceyifahrenaytdonusturme(double derece)
  {
    double fahrenayt = derece * 1.8 + 32;
    return fahrenayt;
  }

  // kenarları parametre olarak girilen ve dikdörtgenin çevresini hesaplayan bir metod yazın
  double dikdortgencevre(double kisakenar, double uzunkenar)
  {
    double cevre =((2*kisakenar)+(2*uzunkenar));
    return cevre;
  }

  // parametre olarak girilen sayının faktoriyel değerini hesaplayıp geri döndüren metodu yazınız.
  int faktoriyelhesapla(int sayi)
  {
    int faktoriyel=1;
    for(int i=1;i<=sayi;i++)
    {
      faktoriyel *=i;
    }
    return faktoriyel;
  }

  // parametre olarak girilen kelime içinde kaç adet a harfi olduğunu gösteren bir metot yazınız
  void a_harfiYazma(String metin)
  {
    int sayac=0;
    List<String> metinEkle=[];
    for(int i=0;i<metin.length;i++)
    {
      if(metin[i]=="a" || metin[i]=="A")
      {
        metinEkle.add(metin[i]);
        sayac++;
      }
    }
    print("A harfi listesi :$metinEkle");
    print("A harfi sayısı :${metinEkle.length}");
    print("a harfi sayısı :$sayac");
  }

  // parametre olarak girilen kenar sayısına göre her bir iç açıyı hesaplayıp sonucu geri gönderen metod yazınız
  // iç açılar toplamı = ((kenar sayısı - 2)*180) / kenar sayısı

  double icacilartoplami(int kenarsayisi)
  {
    double birAcisi = ((kenarsayisi - 2)*180) / kenarsayisi ;
    double toplamAci = birAcisi * kenarsayisi;
    print("toplam aci :$toplamAci");
    return birAcisi;
  }

  // parametre olarak girilen gün sayısına göre maaş hesabı yapan ve elde edilen değeri döndüren metod yazınız
  /*
    1 günde 8 saat çalışılabilir.
    çalışma ücreti : 40 tl.
    mesai saat ücreti : 80 tl.
    150 saat üzeri mesai sayılır.
    */

  int maashesabi(int gunSayisi)
  {
    int mesaiSaatiHesaplama=0;
    int mesaiSaatiCikilincaNormalSaat =0;
    int AylikCalismaUcreti = 0;
    int saatlikCalismaUcreti = 40;
    int mesaiSaatUcreti = 80;
    int normalCalismaSaati = 150;
    int girilenGunCalismaSaati = 8 * gunSayisi;

    if(girilenGunCalismaSaati>=normalCalismaSaati)
    {
      mesaiSaatiHesaplama = girilenGunCalismaSaati - normalCalismaSaati;
      mesaiSaatiCikilincaNormalSaat = girilenGunCalismaSaati - mesaiSaatiHesaplama;
      AylikCalismaUcreti = ((mesaiSaatiCikilincaNormalSaat * saatlikCalismaUcreti)+(mesaiSaatiHesaplama * mesaiSaatUcreti));
    }
    if(girilenGunCalismaSaati<150)
      {
        AylikCalismaUcreti = girilenGunCalismaSaati * saatlikCalismaUcreti;
      }

    return AylikCalismaUcreti;
  }

  // parametre olarak girilen otopark süresine göre otopark ücreti hesaplayarak geri döndüren metodu yaziniz.
  /*
  1 saat 50 tl.
  1 saat aşımından sonra her 1 saat , 10 tl'dir.
  */

  int otoparkucreti(int otoparkSuresi)
  {
      int otoparkUcreti = 0;
      int fazladanKalmaSuresi = 0;
      int ekUcret = 0;
      int birSaatOtoparkUcreti = 50;
      int birSaatSonraEklenenOtoparkUcreti = 10;

      if(otoparkSuresi == 1)
        {
          otoparkUcreti = 50;
        }
      else if(otoparkSuresi > 1)
        {
          fazladanKalmaSuresi = otoparkSuresi - 1;
          ekUcret = fazladanKalmaSuresi * 10;
          otoparkUcreti = (50 +ekUcret);
        }
      return otoparkUcreti;
  }

}