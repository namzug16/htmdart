import 'package:sqlite3/sqlite3.dart';

final db = sqlite3.openInMemory();

void initDb() {
  db.execute('''
CREATE TABLE tasks (
    id TEXT PRIMARY KEY DEFAULT (lower(hex(randomblob(16)))),
    owner_ip TEXT NOT NULL,
    content TEXT NOT NULL,
    is_completed INTEGER NOT NULL DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
  ''');
}
