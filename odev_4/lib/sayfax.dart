import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odev_4/sayfay.dart';

class Sayfa_X extends StatefulWidget {
  const Sayfa_X({Key? key}) : super(key: key);

  @override
  State<Sayfa_X> createState() => _Sayfa_XState();
}

class _Sayfa_XState extends State<Sayfa_X> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Sayfa X"),
        centerTitle: true,
      ),
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
                Text("SAYFA X",style: TextStyle(fontSize: 30),),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Sayfa_Y()));
            }, child: Text("GİT Y",style: TextStyle(fontSize: 30),))
          ],
        ),
      ),
    );
  }
}
