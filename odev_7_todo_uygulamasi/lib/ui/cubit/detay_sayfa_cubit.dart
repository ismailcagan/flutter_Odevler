import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_uygulamasi/data/repo/tododao_repository.dart';

class DetaySayfaCubit extends Cubit<void>
{
  DetaySayfaCubit():super(0);

  var krepo = TodoDaoRepository();

  Future<void> guncelle(int id, String baslik, String aciklama) async
  {
    await krepo.guncelle(id, baslik, aciklama);
  }
}