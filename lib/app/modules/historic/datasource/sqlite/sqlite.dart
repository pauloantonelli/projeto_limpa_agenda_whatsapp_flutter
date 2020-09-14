import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:whatsapp_agenda/app/modules/historic/domain/entity/entitie.dart';
import 'package:whatsapp_agenda/app/modules/historic/infra/datasource/delete_historic_datasource.dart';
import 'package:whatsapp_agenda/app/modules/historic/infra/datasource/get_historic_datasource.dart';
import 'package:whatsapp_agenda/app/modules/historic/infra/datasource/insert_new_historic_datasource.dart';
import 'package:whatsapp_agenda/app/modules/historic/infra/datasource/update_historic_datasource.dart';
import 'package:whatsapp_agenda/app/modules/historic/infra/model/historic.model.dart';

class HistoricSqliteDataSource
    implements
        GetHistoricDatasource,
        InsertNewHistoricDatasource,
        UpdateHistoricDatasource,
        DeleteHistoricDatasource {
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

  @override
  Future<List<Map<String, dynamic>>> getDataFromDataBase() async {
    try {
      final Database db = await this._getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(this.tableName);
      return maps;
    } catch (e) {
      return new List<Map<String, dynamic>>();
    }
  }

  @override
  Future<bool> insertNewHistorico(HistoricEntity model) async {
    try {
      final Database db = await this._getDatabase();
      final HistoricModel modeldto = new HistoricModel(
          ddd: model.ddd, telefone: model.telefone, mensagem: model.mensagem);
      final res = await db.insert(this.tableName, modeldto.toMap());
      // print('insert: $res'); // devolve o id
      if (res != 0) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('erro sql $e');
      return null;
    }
  }

  @override
  Future<bool> updateHistorico(HistoricEntity model) async {
    try {
      final Database db = await this._getDatabase();
      final HistoricModel modeldto = new HistoricModel(
          ddd: model.ddd, telefone: model.telefone, mensagem: model.mensagem);
      final res = await db.update(this.tableName, modeldto.toMap(),
          where: 'id = ?', whereArgs: [model.id]);
      // print('update: $res'); // devolve o id
      if (res != 0) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('erro sql $e');
      return null;
    }
  }

  @override
  Future<bool> deleteHistoricoByID(HistoricEntity model) async {
    try {
      final Database db = await this._getDatabase();
      final HistoricModel modeldto = new HistoricModel(
          ddd: model.ddd,
          telefone: model.telefone,
          mensagem: model.mensagem,
          id: model.id);
      final res = await db
          .delete(this.tableName, where: 'id = ?', whereArgs: [modeldto.id]);
      // print('delete: $res'); // devolve o id
      if (res != 0) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('erro sql $e');
      return null;
    }
  }
}
