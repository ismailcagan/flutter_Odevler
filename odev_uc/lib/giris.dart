
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odev_uc/renkler.dart';

class Giris extends StatefulWidget {
  const Giris({Key? key}) : super(key: key);

  @override
  State<Giris> createState() => _GirisState();
}

class _GirisState extends State<Giris> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: anaRenk,
      appBar: AppBar(
        title: Text(
          "Food Bank",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,fontFamily: "Quicksand"),
        ),
        backgroundColor: barRenk,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 25),
            child: Column(
              children: [
                Image.asset(
                  "image/catal_bicak.jpg",
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 25,),
                Text(
                  "Food Bank",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Text(
                  "Special & Delicious food",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Log In",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: btnRenk1,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                SizedBox(height: 5,),
                TextButton(

                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.black87, fontSize: 20),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
              ],
            ),
          ),

          Column(
            children: [
              Image.asset("image/indirim.PNG",width: 400,height: 200,
                alignment: Alignment.center, ),
            ],
          ),
        ],
      ),
    );
  }
}
