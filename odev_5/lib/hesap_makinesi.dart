
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HesapMakinesi extends StatefulWidget {
  const HesapMakinesi({Key? key}) : super(key: key);

  @override
  State<HesapMakinesi> createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {

  String alinanVeri="";

  var tfKontrol=TextEditingController();

  Future<String> toplama( String deger) async
  {
    //<List<double>>
    double toplam =0.0;
    List<double> tut=[];

    List<String> tut2 = deger.split("+");

    for(var item in tut2)
      {
        tut.add(double.parse(item));
      }
    for(var item in tut)
    {
      toplam += item;
    }
    return   toplam.toString();
  }

  Future<int> toplamabir(int sayi1, int sayi2) async
  {
    int toplam = sayi1 + sayi2;
    return toplam;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesap Makinesi"),
        centerTitle: true,
      ),
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: tfKontrol,
             // keyboardType: TextInputType.number,
            ),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    tfKontrol.text += 1.toString();
                    alinanVeri=tfKontrol.text;
                  });
                }, child: Text("1")),
                ElevatedButton(onPressed: (){
                  setState(() {
                    tfKontrol.text +=2.toString();
                    alinanVeri=tfKontrol.text;
                  });
                }, child: const Text("2")),
                ElevatedButton(onPressed: (){
                  setState(() {
                    tfKontrol.text += 3.toString();
                    alinanVeri=tfKontrol.text;
                  });
                }, child: const Text("3")),
              ],
            ),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    tfKontrol.text += 4.toString();
                    alinanVeri=tfKontrol.text;
                  });
                }, child: const Text("4")),

                ElevatedButton(onPressed: (){
                  setState(() {
                    tfKontrol.text += 5.toString();
                    alinanVeri=tfKontrol.text;
                  });
                }, child: const Text("5")),

                ElevatedButton(onPressed: (){
                  setState(() {
                    tfKontrol.text += 6.toString();
                    alinanVeri=tfKontrol.text;
                  });
                }, child: const Text("6")),
              ],
            ),

            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    tfKontrol.text += 7.toString();
                    alinanVeri=tfKontrol.text;
                  });
                }, child: const Text("7")),

                ElevatedButton(onPressed: (){
                  setState(() {
                    tfKontrol.text += 8.toString();
                    alinanVeri=tfKontrol.text;
                  });
                }, child: const Text("8")),

                ElevatedButton(onPressed: (){
                  setState(() {
                    tfKontrol.text += 9.toString();
                    alinanVeri=tfKontrol.text;

                  });
                }, child: const Text("9")),
              ],
            ),

            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    tfKontrol.text ="";
                  });
                }, child: const Text("c")),

                ElevatedButton(onPressed: (){
                  setState(() {
                    tfKontrol.text += 0.toString();
                    alinanVeri=tfKontrol.text;
                  });
                }, child: const Text("0")),

                ElevatedButton(onPressed: (){
                  setState(() {
                    tfKontrol.text += ".";
                    alinanVeri=tfKontrol.text;
                  });
                }, child: const Text(".")),
              ],
            ),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                FutureBuilder<String>(
                    future: toplama(tfKontrol.text),
                    builder:(context,snaphot)
                    {
                      if(snaphot.hasError){return
                    ElevatedButton(onPressed: (){
                    setState(() {
                      tfKontrol.text="hata oluştu";
                    });
                    }, child: Text("="));}

                      if(snaphot.hasData)
                      {
                        return
                      ElevatedButton(onPressed: (){
                        setState(() {
                          tfKontrol.text= snaphot.data.toString();
                         // tfKontrol.text=toplama(tfKontrol.text).toString();
                          //snaphot.data;
                        });
                      }, child: Text("="));}
                      else
                      {
                        return  ElevatedButton(onPressed: (){
                        setState(()
                        {
                          tfKontrol.text="Sonuç yok";
                        });
                      }, child: Text("="));}
                    },
                  ),

                ElevatedButton(onPressed: (){
                  setState(() {
                    tfKontrol.text +="+";
                    alinanVeri=tfKontrol.text;
                  });
                }, child: const Text("+")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
