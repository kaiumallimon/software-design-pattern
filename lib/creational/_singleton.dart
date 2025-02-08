class DBConnection {
  static final DBConnection _connection = DBConnection._internal();

  // always returns the same instance
  factory DBConnection() {
    return _connection;
  }

  DBConnection._internal();
}

void main() {
  var connection1 = DBConnection();
  var connection2 = DBConnection();

  print(connection1 == connection2);
}
