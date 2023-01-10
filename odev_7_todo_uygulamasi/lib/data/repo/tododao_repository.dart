
import 'package:todo_uygulamasi/data/entity/todo.dart';
import 'package:todo_uygulamasi/data/sqlite/veritabani.dart';

class TodoDaoRepository
{

  // LİSTE GETİRME
  Future<List<Todo>> todoListGetir() async
  {
    var db = await Veritabani.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM yapilacaklar");

    return List.generate(maps.length, (index){
      var satir = maps[index];
      return Todo(id: satir["id"], baslik: satir["baslik"], aciklama: satir["aciklama"]);
    });
  }

  // SİLME
  Future<void> sil(int id) async
  {
     var db = await Veritabani.veritabaniErisim();
     await db.delete("yapilacaklar",where: "id = ?",whereArgs: [id]);
  }

  // GÜNCELLEME
  Future<void> guncelle(int id, String baslik, String aciklama) async
  {
    var db =await Veritabani.veritabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["baslik"]=baslik;
    bilgiler["aciklama"] = aciklama;

    await db.update("yapilacaklar", bilgiler,where: "id=?",whereArgs: [id]);
  }

  // KAYDETME
  Future<void> kaydet(String baslik, String aciklama) async
  {
    var db = await Veritabani.veritabaniErisim();

    var bilgiler = Map<String,dynamic>();

    bilgiler["baslik"] = baslik;
    bilgiler["aciklama"] = aciklama;

    await db.insert("yapilacaklar", bilgiler);
  }

  //ARA

  Future<List<Todo>> ara(String aramaKelimesi) async
  {
    var db = await Veritabani.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM yapilacaklar WHERE baslik like '%$aramaKelimesi%'");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Todo(id: satir["id"], baslik: satir["baslik"], aciklama: satir["aciklama"]);
    });
  }

}