// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'love_myself_answer_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorLMAnswerDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$LMAnswerDatabaseBuilder databaseBuilder(String name) =>
      _$LMAnswerDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$LMAnswerDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$LMAnswerDatabaseBuilder(null);
}

class _$LMAnswerDatabaseBuilder {
  _$LMAnswerDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$LMAnswerDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$LMAnswerDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<LMAnswerDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$LMAnswerDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$LMAnswerDatabase extends LMAnswerDatabase {
  _$LMAnswerDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  LoveMyselfAnswerDao? _loveMyselfAnswerDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
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
