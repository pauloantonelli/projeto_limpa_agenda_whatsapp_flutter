import 'package:mobx/mobx.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:whatsapp_agenda/app/pages/historic/model/historico.model.dart';

class Sqlite {
  String databaseName = 'historico';
  String tableName = 'contatos';
  String criarTabela =
      'CREATE TABLE contatos(id INTEGER PRIMARY KEY, ddd TEXT, telefone TEXT, mensagem TEXT)';

  Future<Database> _getDatabase() async {
    return openDatabase(join(await getDatabasesPath(), databaseName),
        onCreate: (db, version) {
      return db.execute(criarTabela);
    }, version: 1);
  }

  Future<List<Map<String, dynamic>>> getHistorico() async {
    try {
      final Database db = await this._getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(this.tableName);
      return maps;
    } catch (e) {
      print(e);
      return new List<Map<String, dynamic>>();
    }
  }

  Future create(HistoricoModel model) async {
    try {
      final Database db = await this._getDatabase();

      final res = await db.insert(this.tableName, model.toMap());
      print('create: $res');
    } catch (e) {
      print('erro sql dart $e');
      return;
    }
  }

  Future updateDB(HistoricoModel model) async {
    try {
      final Database db = await this._getDatabase();
      final res = await db.update(this.tableName, model.toMap(),
          where: 'id = ?', whereArgs: [model.id]);
      print('update: $res');
    } catch (e) {
      print(e);
    }
  }

  Future delete(int id) async {
    try {
      final Database db = await this._getDatabase();

      final res =
          await db.delete(this.tableName, where: 'id = ?', whereArgs: [id]);
      print('delete: $res');
    } catch (e) {
      print(e);
    }
  }
}
