import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_uygulamasi/ui/cubit/ana_sayfa_cubit.dart';
import 'package:todo_uygulamasi/ui/cubit/detay_sayfa_cubit.dart';
import 'package:todo_uygulamasi/ui/cubit/kayit_sayfa_cubit.dart';
import 'package:todo_uygulamasi/ui/screen/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnaSayfaCubit()),
        BlocProvider(create: (context) => DetaySayfaCubit()),
        BlocProvider(create: (context) => KayitSayfaCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AnaSayfa(),
      ),
    );
  }
}
