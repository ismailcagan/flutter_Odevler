import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_uygulamasi/data/entity/todo.dart';
import 'package:todo_uygulamasi/data/repo/tododao_repository.dart';

class AnaSayfaCubit extends Cubit<List<Todo>>
{
    AnaSayfaCubit():super(<Todo>[]);

    var krepo = TodoDaoRepository();

    // LİSTE GETİRME
    Future<void> todoListGetir() async
    {
      var liste = await krepo.todoListGetir();
      emit(liste);
    }

    // SİLME
    Future<void> sil(int id) async
    {
      await krepo.sil(id);
      await todoListGetir();
    }

    // ARAMA

    Future<void> ara(String aramaKelimesi) async
    {
      var liste = await krepo.ara(aramaKelimesi);
      emit(liste);
    }
}