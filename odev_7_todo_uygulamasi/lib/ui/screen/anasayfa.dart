import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_uygulamasi/data/entity/todo.dart';
import 'package:todo_uygulamasi/ui/cubit/ana_sayfa_cubit.dart';
import 'package:todo_uygulamasi/ui/screen/renkler.dart';
import 'package:todo_uygulamasi/ui/screen/tododetaysayfa.dart';
import 'package:todo_uygulamasi/ui/screen/todokayitsayfa.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  bool aramaYapiliyormu = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnaSayfaCubit>().todoListGetir();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: renk10,
        title: aramaYapiliyormu ?
        TextField(decoration: const InputDecoration(hintText: "Ara"),onChanged: (aramaSonucu){
          context.read<AnaSayfaCubit>().ara(aramaSonucu);
        },):
        Text("Todo"),
        actions: [
          aramaYapiliyormu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyormu = false;
            });
            context.read<AnaSayfaCubit>().todoListGetir();
          }, icon: Icon(Icons.clear))
              :
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyormu = true;
            });
          }, icon: Icon(Icons.search))
          ,
        ],

      ),
      body: Container(

        decoration: BoxDecoration(
          color:renk8,
          //gradient: SweepGradient(colors: [renk1,Colors.purple.shade50]),
          //boxShadow: [BoxShadow(color: Colors.purple.shade900)],

        ),
        child: BlocBuilder<AnaSayfaCubit,List<Todo>>(
          builder: (context,todoListesi){
            if(todoListesi.isNotEmpty){
              return ListView.builder(
                itemCount: todoListesi.length,
                itemBuilder: (context,indeks){
                  var todo = todoListesi[indeks];

                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TodoDetaySayfa(todo: todo)))
                      .then((value) {context.read<AnaSayfaCubit>().todoListGetir();});
                    },
                    child: Card(
                      color: renk6,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${todo.baslik}",style: TextStyle(
                                  fontSize: 40,
                                  fontFamily: "Cookie" ,
                                  //color: Colors.white,
                                  ),),
                              SizedBox(height: 5,),
                              Text("${todo.aciklama}",style: TextStyle(
                                  fontSize: 20,
                              fontFamily: "Cookie"),),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: (){
                                ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(content: Text("${todo.aciklama} silinsinmi"),
                                 action: SnackBarAction(
                                     label: "Evet",
                                     onPressed: (){
                                       setState(() {
                                        context.read<AnaSayfaCubit>().sil(todo.id);
                                       });
                                     }),),
                                );
                              },
                              icon: Icon(Icons.clear))
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            else{return Center();}
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => TodoKayitSayfa()))
          // geri dönüldüğünde ekranı güncellemeyi sağlar
              .then((value) {context.read<AnaSayfaCubit>().todoListGetir();});
        },
        child: Icon(Icons.add),),

    );
  }
}
