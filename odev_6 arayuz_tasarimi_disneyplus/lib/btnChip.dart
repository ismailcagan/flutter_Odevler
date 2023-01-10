import 'package:disneyplus/renkler.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({required this.iconlar});
  var iconlar ;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
        //color: Colors.blue.shade900,
        borderRadius: BorderRadius.circular(10),
    gradient:LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.black,btnAColor],
    ),

    ),
    child: IconButton(onPressed: (){}, icon: Image.asset(iconlar)),
    );
  }
}



/*
Container(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
CarouselSlider(
height: 400,
initialPage: 0,
// ortalama
enlargeCenterPage: true,
// otomatik oynama
autoPlay: true,
// terse gitmesi
reverse: false,
// akışkan şekilde olması
enableInfiniteScroll: true,
// kaçsaniyede dönmesi
autoPlayInterval: Duration(seconds: 2),
//
autoPlayAnimationDuration: Duration(milliseconds: 2000),
// dokununca durması(on saniye duracak sonra devam edecek)
pauseAutoPlayOnTouch:Duration(seconds: 10) ,
// hangi yöne kayması
scrollDirection: Axis.horizontal,
// tıklamam özelliği
onPageChanged: (index)
{
setState(() {
sayac=index;
});
},
items:
{

}

*/