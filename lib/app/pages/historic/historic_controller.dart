import 'package:limpa_agenda_whatsapp/app/pages/historic/model/historico.model.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

part 'historic_controller.g.dart';

class HistoricController = _HistoricControllerBase with _$HistoricController;

abstract class _HistoricControllerBase with Store {
  @observable
  var sqflite;
  String databaseName = 'historico';
  String tableName = 'contatos';
  String criarTabela =
      'CREATE TABLE contatos(id INTEGER PRIMARY KEY, telefone TEXT, mensagem TEXT)';
  Future<Database> _getDatabase() async {
    return openDatabase(join(await getDatabasesPath(), databaseName),
        onCreate: (db, version) {
      return db.execute(criarTabela);
    }, version: 1);
  }

  Future create(HistoricoModel model) async {
    try {
      final Database db = await this._getDatabase();

      final res = await db.insert(this.tableName, model.toMap());
      print(res);
    } catch (e) {
      print(e);
      return;
    }
  }

  @action
  Future<List<Map<String, dynamic>>> getHistorico() async {
    try {
      final Database db = await this._getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(this.tableName);

      final response = maps;
      this.sqflite = response;
      return response;
      // final response = List.generate(maps.length, (index) => {
      //  return HistoricoModel.fromMap(maps) as List<Map<String, dynamic>>;
      // }).toList();
      // return response;
    } catch (e) {
      print(e);
      return new List<Map<String, dynamic>>();
    }
  }

  Future updateDB(HistoricoModel model) async {
    try {
      final Database db = await this._getDatabase();
      final res = await db.update(this.tableName, model.toMap(),
          where: 'id = ?', whereArgs: [model.id]);

      print(res);
    } catch (e) {
      print(e);
    }
  }

  Future delete(HistoricoModel model) async {
    try {
      final Database db = await this._getDatabase();

      final res = await db
          .delete(this.tableName, where: 'id = ?', whereArgs: [model.id]);
      print(res);
    } catch (e) {
      print(e);
    }
  }
}
