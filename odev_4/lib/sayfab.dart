import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odev_4/sayfay.dart';

class Sayfa_B extends StatefulWidget {
  const Sayfa_B({Key? key}) : super(key: key);

  @override
  State<Sayfa_B> createState() => _Sayfa_BState();
}

class _Sayfa_BState extends State<Sayfa_B> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text("Saya B"),
        centerTitle: true,
      ),
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("SAYFA B",style: TextStyle(fontSize: 30),),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=> Sayfa_Y()));
          }, child: Text("GİT Y",style: TextStyle(fontSize: 30),))
      ],
    ),
    ),
    );
  }
}
