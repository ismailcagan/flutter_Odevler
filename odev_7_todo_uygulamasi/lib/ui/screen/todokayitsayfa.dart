import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_uygulamasi/ui/cubit/kayit_sayfa_cubit.dart';
import 'package:todo_uygulamasi/ui/screen/renkler.dart';

class TodoKayitSayfa extends StatefulWidget {
  const TodoKayitSayfa({Key? key}) : super(key: key);

  @override
  State<TodoKayitSayfa> createState() => _TodoKayitSayfaState();
}

class _TodoKayitSayfaState extends State<TodoKayitSayfa> {

  var tfTodoBaslik = TextEditingController();
  var tfTodoAciklama = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: renk10,
        title: Text("Ekle"),),
      body: Container(
          decoration: BoxDecoration(
            color:renk8,
            //gradient: SweepGradient(colors: [renk1,Colors.purple.shade50]),
            //boxShadow: [BoxShadow(color: Colors.purple.shade900)],

          ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  color: renk6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: tfTodoBaslik,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: "Cookie",
                    ),
                  ),
                ),
                Card(
                  color: renk6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: tfTodoAciklama,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: "Cookie",
                    ),
                  ),
                ),

                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        context.read<KayitSayfaCubit>().kaydet(tfTodoBaslik.text,tfTodoAciklama.text);
                      });
                    },
                    child: Text("Kaydet",style: TextStyle(fontSize: 40,
                    fontFamily: "Cookie"),)),
              ]),

        ),
      ),
    );
  }
}
