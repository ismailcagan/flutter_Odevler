import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odev_4/sayfaa.dart';
import 'package:odev_4/sayfax.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6495ed),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Ana Sayfa"),
      ),
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Ana Sayfa",style: TextStyle(fontSize: 30),),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Sayfa_A(),),);
            }, child: Text("GİT A",style: TextStyle(fontSize: 30),)),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Sayfa_X(),),);
            }, child: Text("GİT X",style: TextStyle(fontSize: 30),)),

          ],

        ),
      ),
    );
  }
}

