import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_uygulamasi/data/repo/tododao_repository.dart';

class KayitSayfaCubit extends Cubit<void>
{
  KayitSayfaCubit():super(0);

  var krepo = TodoDaoRepository();

  Future<void> kaydet(String baslik, String Aciklama) async
  {
    await krepo.kaydet(baslik, Aciklama);
  }
}