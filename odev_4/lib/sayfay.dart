import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:odev_4/anasayfa.dart';

class Sayfa_Y extends StatefulWidget {
  const Sayfa_Y({Key? key}) : super(key: key);

  @override
  State<Sayfa_Y> createState() => _Sayfa_YState();
}

class _Sayfa_YState extends State<Sayfa_Y> {

  Future<bool> geriTusu(BuildContext context) async
  {
    print("Navigation geri tuşu tıklandı");
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffc803),
      appBar: AppBar(
        title: Text("SAYFA Y"),
       // centerTitle: true,
        leading: IconButton(onPressed: (){
          print("appbar geri tuşu");
          Navigator.of(context).popUntil((route) => route.isFirst);
        },icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: WillPopScope(onWillPop :() =>geriTusu(context),
      child:
      Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("SAYFA Y",style: TextStyle(fontSize: 30),),
          ],
        ),
      ),
      ),
    );
  }
}
