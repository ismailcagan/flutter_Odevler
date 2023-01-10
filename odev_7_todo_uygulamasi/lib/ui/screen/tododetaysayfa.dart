import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_uygulamasi/data/entity/todo.dart';
import 'package:todo_uygulamasi/ui/cubit/detay_sayfa_cubit.dart';
import 'package:todo_uygulamasi/ui/screen/renkler.dart';

class TodoDetaySayfa extends StatefulWidget {

  Todo todo;
  TodoDetaySayfa({required this.todo});

  @override
  State<TodoDetaySayfa> createState() => _TodoDetaySayfaState();
}

class _TodoDetaySayfaState extends State<TodoDetaySayfa> {

  var tfTodoBaslik = TextEditingController();
  var tfTodoAciklama = TextEditingController();



  @override
  void initState() {
    super.initState();

    var todo = widget.todo;
    tfTodoBaslik.text = todo.baslik;
    tfTodoAciklama.text = todo.aciklama;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: renk10,
        title: Text("Güncelle"),
      ),
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
                        context.read<DetaySayfaCubit>().guncelle(widget.todo.id,tfTodoBaslik.text, tfTodoAciklama.text);
                      });
                    },
                    child: Text("Güncelle",style: TextStyle(
                      fontSize: 40,
                      fontFamily: "Cookie"
                    ),)),
          ]),

        ),
      ),
    );
  }
}
