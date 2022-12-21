import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odev_4/sayfab.dart';

class Sayfa_A extends StatefulWidget {
  const Sayfa_A({Key? key}) : super(key: key);

  @override
  State<Sayfa_A> createState() => _Sayfa_AState();
}

class _Sayfa_AState extends State<Sayfa_A> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff8400),
      appBar: AppBar(
        title: Text("Sayfa_A"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Sayfa A",
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Sayfa_B()));
            }, child: Text("GİT B",style: TextStyle(fontSize: 30),)),

            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Geri Dön",style: TextStyle(fontSize: 30),))
          ],
        ),
      ),
    );
  }
}
