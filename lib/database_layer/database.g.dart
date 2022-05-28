// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorReflectionAnswerDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ReflectionAnswerDatabaseBuilder databaseBuilder(String name) =>
      _$ReflectionAnswerDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ReflectionAnswerDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$ReflectionAnswerDatabaseBuilder(null);
}

class _$ReflectionAnswerDatabaseBuilder {
  _$ReflectionAnswerDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$ReflectionAnswerDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$ReflectionAnswerDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<ReflectionAnswerDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$ReflectionAnswerDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ReflectionAnswerDatabase extends ReflectionAnswerDatabase {
  _$ReflectionAnswerDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  LoveMyselfAnswerDao? _loveMyselfAnswerDaoInstance;

  DrawTaskReflectionDao? _drawTaskReflectionDaoInstance;

  LoveMyselfReflectionDao? _loveMyselfReflectionDaoInstance;

  SpiralTaskReflectionDao? _spiralTaskReflectionDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 3,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `LoveMyselfAnswer` (`answerId` INTEGER PRIMARY KEY AUTOINCREMENT, `answerTitle1` TEXT NOT NULL, `answerTitle2` TEXT NOT NULL, `answerTitle3` TEXT NOT NULL, `answerTitle4` TEXT NOT NULL, `answerTitle5` TEXT NOT NULL, `answerTitle6` TEXT NOT NULL, `answerTitle7` TEXT NOT NULL, `answerTitle8` TEXT NOT NULL, `answerDateTime` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `DrawTaskReflection` (`reflectionAnswerId` INTEGER PRIMARY KEY AUTOINCREMENT, `answerTitle1` TEXT NOT NULL, `answerTitle2` TEXT NOT NULL, `answerTitle3` TEXT NOT NULL, `answerTitle4` TEXT NOT NULL, `answerTitle5` TEXT NOT NULL, `answerDateTime` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `LoveMyselfReflection` (`reflectionAnswerId` INTEGER PRIMARY KEY AUTOINCREMENT, `answerTitle1` TEXT NOT NULL, `answerDateTime` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `SpiralTaskReflection` (`reflectionAnswerId` INTEGER PRIMARY KEY AUTOINCREMENT, `answerTitle1` TEXT NOT NULL, `answerTitle2` TEXT NOT NULL, `answerTitle3` TEXT NOT NULL, `answerDateTime` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  LoveMyselfAnswerDao get loveMyselfAnswerDao {
    return _loveMyselfAnswerDaoInstance ??=
        _$LoveMyselfAnswerDao(database, changeListener);
  }

  @override
  DrawTaskReflectionDao get drawTaskReflectionDao {
    return _drawTaskReflectionDaoInstance ??=
        _$DrawTaskReflectionDao(database, changeListener);
  }

  @override
  LoveMyselfReflectionDao get loveMyselfReflectionDao {
    return _loveMyselfReflectionDaoInstance ??=
        _$LoveMyselfReflectionDao(database, changeListener);
  }

  @override
  SpiralTaskReflectionDao get spiralTaskReflectionDao {
    return _spiralTaskReflectionDaoInstance ??=
        _$SpiralTaskReflectionDao(database, changeListener);
  }
}

class _$LoveMyselfAnswerDao extends LoveMyselfAnswerDao {
  _$LoveMyselfAnswerDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _loveMyselfAnswerInsertionAdapter = InsertionAdapter(
            database,
            'LoveMyselfAnswer',
            (LoveMyselfAnswer item) => <String, Object?>{
                  'answerId': item.answerId,
                  'answerTitle1': item.answerTitle1,
                  'answerTitle2': item.answerTitle2,
                  'answerTitle3': item.answerTitle3,
                  'answerTitle4': item.answerTitle4,
                  'answerTitle5': item.answerTitle5,
                  'answerTitle6': item.answerTitle6,
                  'answerTitle7': item.answerTitle7,
                  'answerTitle8': item.answerTitle8,
                  'answerDateTime': item.answerDateTime
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<LoveMyselfAnswer> _loveMyselfAnswerInsertionAdapter;

  @override
  Stream<List<LoveMyselfAnswer>> getAllLoveMyselfTaskSubmissions() {
    return _queryAdapter.queryListStream('SELECT * FROM LoveMyselfAnswer',
        mapper: (Map<String, Object?> row) => LoveMyselfAnswer(
            answerId: row['answerId'] as int?,
            answerTitle1: row['answerTitle1'] as String,
            answerTitle2: row['answerTitle2'] as String,
            answerTitle3: row['answerTitle3'] as String,
            answerTitle4: row['answerTitle4'] as String,
            answerTitle5: row['answerTitle5'] as String,
            answerTitle6: row['answerTitle6'] as String,
            answerTitle7: row['answerTitle7'] as String,
            answerTitle8: row['answerTitle8'] as String,
            answerDateTime: row['answerDateTime'] as String),
        queryableName: 'LoveMyselfAnswer',
        isView: false);
  }

  @override
  Future<void> insertLoveMyselfAnswer(LoveMyselfAnswer loveMyselfAnswer) async {
    await _loveMyselfAnswerInsertionAdapter.insert(
        loveMyselfAnswer, OnConflictStrategy.abort);
  }
}

class _$DrawTaskReflectionDao extends DrawTaskReflectionDao {
  _$DrawTaskReflectionDao(this.database, this.changeListener)
      : _drawTaskReflectionInsertionAdapter = InsertionAdapter(
            database,
            'DrawTaskReflection',
            (DrawTaskReflection item) => <String, Object?>{
                  'reflectionAnswerId': item.reflectionAnswerId,
                  'answerTitle1': item.answerTitle1,
                  'answerTitle2': item.answerTitle2,
                  'answerTitle3': item.answerTitle3,
                  'answerTitle4': item.answerTitle4,
                  'answerTitle5': item.answerTitle5,
                  'answerDateTime': item.answerDateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<DrawTaskReflection>
      _drawTaskReflectionInsertionAdapter;

  @override
  Future<void> insertDrawTaskReflectionAnswer(
      DrawTaskReflection drawTaskReflection) async {
    await _drawTaskReflectionInsertionAdapter.insert(
        drawTaskReflection, OnConflictStrategy.abort);
  }
}

class _$LoveMyselfReflectionDao extends LoveMyselfReflectionDao {
  _$LoveMyselfReflectionDao(this.database, this.changeListener)
      : _loveMyselfReflectionInsertionAdapter = InsertionAdapter(
            database,
            'LoveMyselfReflection',
            (LoveMyselfReflection item) => <String, Object?>{
                  'reflectionAnswerId': item.reflectionAnswerId,
                  'answerTitle1': item.answerTitle1,
                  'answerDateTime': item.answerDateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<LoveMyselfReflection>
      _loveMyselfReflectionInsertionAdapter;

  @override
  Future<void> insertLMReflectionAnswer(
      LoveMyselfReflection loveMyselfReflection) async {
    await _loveMyselfReflectionInsertionAdapter.insert(
        loveMyselfReflection, OnConflictStrategy.abort);
  }
}

class _$SpiralTaskReflectionDao extends SpiralTaskReflectionDao {
  _$SpiralTaskReflectionDao(this.database, this.changeListener)
      : _spiralTaskReflectionInsertionAdapter = InsertionAdapter(
            database,
            'SpiralTaskReflection',
            (SpiralTaskReflection item) => <String, Object?>{
                  'reflectionAnswerId': item.reflectionAnswerId,
                  'answerTitle1': item.answerTitle1,
                  'answerTitle2': item.answerTitle2,
                  'answerTitle3': item.answerTitle3,
                  'answerDateTime': item.answerDateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<SpiralTaskReflection>
      _spiralTaskReflectionInsertionAdapter;

  @override
  Future<void> insertDrawTaskReflectionAnswer(
      SpiralTaskReflection drawTaskReflection) async {
    await _spiralTaskReflectionInsertionAdapter.insert(
        drawTaskReflection, OnConflictStrategy.abort);
  }
}
