import 'package:disneyplus/btnChip.dart';
import 'package:disneyplus/disneyplus.dart';
import 'package:disneyplus/renkler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'disneyplus.dart';

class FilmlerSayfa extends StatefulWidget {
  const FilmlerSayfa({Key? key}) : super(key: key);

  @override
  State<FilmlerSayfa> createState() => _FilmlerSayfaState();
}

class _FilmlerSayfaState extends State<FilmlerSayfa> {

  late CarouselSlider carouselSlider;

  int sayac=0;
  int secilenindeks=0;
  var Resim ="image/disney+arma.webp";
  Future<List<Filmler>> filmGetir() async
  {
    var filmlerListesi =<Filmler>[];
    var f1 = Filmler(id: 1, ad: "Sihir Şehir", resimAdi: "image/SihirliSehir.jpg", fiyat: 15);
    var f2 = Filmler(id: 2, ad: "2012", resimAdi: "image/2012.jpg", fiyat: 13);
    var f3 = Filmler(id: 3, ad: "Black Adam", resimAdi: "image/blackadam.jpg", fiyat: 25);
    var f4 = Filmler(id: 4, ad: "Diriliş", resimAdi: "image/dirilis.jpg", fiyat: 15);
    //var f5 = Filmler(id: 5, ad: "Gerçek Kahraman", resimAdi: "image/gercekkahraman.JPG", fiyat: 20);
    var f6 = Filmler(id: 6, ad: "KaptanMarvel", resimAdi: "image/kaptanmarvel.jpg", fiyat: 30);
    var f7 = Filmler(id: 7, ad: "Thor 4", resimAdi: "image/Thordort.jpg", fiyat: 35);
    var f8 = Filmler(id: 8, ad: "Yarının Dünyası", resimAdi: "image/yarinindunyasi.jpg", fiyat: 13);
    var f9 = Filmler(id: 9, ad: "Prey", resimAdi: "image/prey.jpg", fiyat: 13);

    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    //filmlerListesi.add(f5);
    filmlerListesi.add(f6);
    filmlerListesi.add(f7);
    filmlerListesi.add(f8);
    filmlerListesi.add(f9);

    return filmlerListesi;
//Image.asset("image/prey.jpg"),
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: arkaPlan,
        title: Image.asset("image/disneyicon.png",width: 100),
      ),
      body:SingleChildScrollView(
        child: Column(
          children:[
            // ------------------- yUKARIDAKİ sLİDER --------------------------------------------
            FutureBuilder<List<Filmler>>(
              future: filmGetir(),
              builder: (context,snapshot){
              if(snapshot.hasData) {
                var filmListesi = snapshot.data;
                return Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    carouselSlider=CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        initialPage: 0,
                        enlargeCenterPage: true,
                        //autoPlay: true,
                        reverse: false,
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 2),
                        autoPlayAnimationDuration: Duration(
                            milliseconds: 2000),
                        scrollDirection: Axis.horizontal,
                          //onPageChanged:
                      ),
                      items:filmListesi!.map((imgAsset) {
                        return Builder(
                          builder: (BuildContext context) {
                            //var film = filmListesi[sayac];
                            return SizedBox(
                              //color: Colors.white,
                              width: 700,
                              //height: 100,
                              //width: MediaQuery.of(context).size.width,
                              //margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset(
                                imgAsset.resimAdi
                                //"image/${film.resimAdi}",
                                ,fit: BoxFit.fill,
                              ),
                            );
                          },
                        );
                      }
                      ).toList(),
                    ),
                  ],
                );
              }
              else {return Column();}
               },
            ),

// -------------------------BUTONLAR---------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.only(right:25,left: 25,top: 10),
              child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(iconlar: "image/disneyicon.png"),
                  MyButton(iconlar:"image/pixalicon.png"),
                  MyButton(iconlar: "image/marvel.png"),
                  MyButton(iconlar:"image/starwarsicon.png"),
                  MyButton(iconlar:"image/geoicon.png"),
                ],
              ),
            ),
            // -------------------------------- YUKARIDAKİ RESİMLER ----------------------------------------
            Column(
              children:[FutureBuilder<List<Filmler>>(
                  future: filmGetir(),
                builder: (context,snapshot){
                    if(snapshot.hasData)
                      {
                        var filmListesi=snapshot.data;
                        return Padding(
                          padding: const EdgeInsets.only(top: 10,left: 25,right: 25),
                          child: Column(// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                              Row(//mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5,top: 5,bottom: 5),
                                    child: Text("Recommended For You",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                              Container(
                                height: 150,
                                child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: filmListesi!.length,
                                    itemBuilder:(context,index){
                                      var film = filmListesi[index];
                                      return Container(
                                        decoration: BoxDecoration(




                                        ),
                                        width:120 ,
                                        child: Card(
                                          child: Image.asset(film.resimAdi, fit: BoxFit.fill,),
                                        ),
                                      );
                                    }
                                ),
                              ),
                            ],
                            //----------------------------------------------------------------------------------
                          ),
                        );
                      }
                    else{ return const Center();}
                },
              ),
              ],
            ),

            // -------------------------- aŞAĞIDAKİ SLİDER--------------------------------
            Padding(
              padding: const EdgeInsets.only(right: 190,top: 10,bottom: 10),
              child: Text("Continue Watching",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
            ),
            FutureBuilder<List<Filmler>>(
              future: filmGetir(),
              builder: (context,snapshot){
                if(snapshot.hasData) {
                  var filmListesi = snapshot.data;
                  return Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      carouselSlider=CarouselSlider(
                        options: CarouselOptions(
                          height: 200,
                          initialPage: 0,
                          enlargeCenterPage: true,
                          //autoPlay: true,
                          reverse: false,
                          enableInfiniteScroll: true,
                          autoPlayInterval: Duration(seconds: 2),
                          autoPlayAnimationDuration: Duration(
                              milliseconds: 2000),
                          scrollDirection: Axis.horizontal,
                          //onPageChanged:
                        ),
                        items:filmListesi!.map((imgAsset) {
                          return Builder(
                            builder: (BuildContext context) {
                              //var film = filmListesi[sayac];
                              return SizedBox(
                                //color: Colors.white,
                                width: 800,
                                //height: 100,
                                //width: MediaQuery.of(context).size.width,
                                //margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Image.asset(
                                  imgAsset.resimAdi
                                  //"image/${film.resimAdi}",
                                  ,fit: BoxFit.fill,
                                ),
                              );

                            },
                          );
                        }
                        ).toList(),
                      ),
                    ],
                  );
                }
                else {return Center();}
              },
            ),

            //--------------------------------------------------------------------------------
          ],
        ),
      ) ,
      bottomNavigationBar: BottomNavigationBar(
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.file_download),label: ""),
          //BottomNavigationBarItem(icon: Icon(Icons.person_rounded),label: ""),
        ],
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: secilenindeks,
        onTap: (index){
          setState(() {
            secilenindeks=index;
          });
        },
      ),
    );
  }
}
