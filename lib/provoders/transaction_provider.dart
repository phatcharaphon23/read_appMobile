import 'package:flutter/foundation.dart';
import 'package:flutter_application_3/database/transaction_db.dart';
import 'package:flutter_application_3/model/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];
  void intitData() async {
    var db = TransectionDB(dbName: "transactions.db");
    transactions = await db.loadAllData();
    notifyListeners();
  }

  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactions statement) async {
    // transactions.add(statement);
    //transactions.insert(0, statement);
    var db = TransectionDB(dbName: 'transactions.db');
    await db.insertData(statement);

    transactions = await db.loadAllData();
    notifyListeners();
  }
}
