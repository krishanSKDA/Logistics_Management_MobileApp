import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  // Create the new table with the specified fields
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
    CREATE TABLE orders(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    orderNumber TEXT,
    receiverName TEXT,
    receiverAddress TEXT,
    mobileNumber TEXT,
    orderDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");
  }

  // Open the database
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'orders.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        print("...creating orders table...");
        await createTables(database);
      },
    );
  }

  // Insert an order into the table
  static Future<int> createOrder(String orderNumber, String receiverName,
      String receiverAddress, String mobileNumber) async {
    final db = await SQLHelper.db();

    final data = {
      'orderNumber': orderNumber,
      'receiverName': receiverName,
      'receiverAddress': receiverAddress,
      'mobileNumber': mobileNumber,
    };
    final id = await db.insert('orders', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Get all orders
  static Future<List<Map<String, dynamic>>> getOrders() async {
    final db = await SQLHelper.db();
    return db.query('orders', orderBy: "id");
  }

  // Get a single order by ID
  static Future<List<Map<String, dynamic>>> getOrder(int id) async {
    final db = await SQLHelper.db();
    return db.query('orders', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an existing order
  static Future<int> updateOrder(int id, String orderNumber,
      String receiverName, String receiverAddress, String mobileNumber) async {
    final db = await SQLHelper.db();

    final data = {
      'orderNumber': orderNumber,
      'receiverName': receiverName,
      'receiverAddress': receiverAddress,
      'mobileNumber': mobileNumber,
      'orderDate': DateTime.now().toString(), // Update the order date
    };

    final result =
        await db.update('orders', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete an order by ID
  static Future<void> deleteOrder(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete('orders', where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint('Something went wrong when deleting an order: $err');
    }
  }
}
