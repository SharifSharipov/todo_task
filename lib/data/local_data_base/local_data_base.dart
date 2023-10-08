import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_task/data/model/model.dart';
class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();
  Database? _database;

  factory LocalDatabase() {
    return getInstance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("tasks.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    await db.execute('''
    CREATE TABLE ${TaskModelFields.taskTable} (
    ${TaskModelFields.id} $idType,
    ${TaskModelFields.eventName} $textType,
    ${TaskModelFields.eventDescription} $textType,
    ${TaskModelFields.eventLocation} $textType,
    ${TaskModelFields.priorityColor} $textType,
    ${TaskModelFields.eventTime} $textType
    )
    ''');
  }

  LocalDatabase._init();

  static Future<TaskModel> addTask(TaskModel taskModel) async {
    final db = await getInstance.database;
    final int id =
    await db.insert(TaskModelFields.taskTable, taskModel.toJson());
    return taskModel.copyWith(id: id);
  }
  static Future<List<TaskModel>> getAllTasks()async {
    List<TaskModel> allTask = [];
    final db = await getInstance.database;
    allTask = (await db.query(TaskModelFields.taskTable))
        .map((e) => TaskModel.fromJson(e))
        .toList();

    return allTask;
  }

 static Future<int> updateTask({required TaskModel task}) async {
    final db = await getInstance.database;
    return db.transaction((txn) async {
      return await txn.update(
        TaskModelFields.taskTable,
        task.toJson(),
        where: '${TaskModelFields.id}= ?',
        whereArgs: [task.id],
      );
    });
  }

 static Future<int> deleteTask({required int id}) async {
    final db = await getInstance.database;
    return db.transaction(
      (txn) async {
        return await txn.delete(
          TaskModelFields.taskTable,
          where: '${TaskModelFields.id}= ?',
          whereArgs: [id],
        );
      },
    );
  }
}
