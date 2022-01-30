import 'package:flutter/material.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/model/transaction.dart';
import 'package:flutter_application_3/provoders/transaction_provider.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final amountControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                decoration: new InputDecoration(labelText: "ชื่อรายการ"),
                autofocus: true,
                controller: titleController,
                validator: (String? str) {
                  if (str == '') return "กรุณาป้อนชื่อรายการ";
                  return null;
                },
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: "จำนวนเงิน"),
                keyboardType: TextInputType.number,
                controller: amountControler,
                validator: (String? str) {
                  if (str!.isEmpty) return "กรุณาป้อนจำนนเงิน";
                  if (double.parse(str.toString()) <= 0)
                    return "กรุณาป้อนตัวเลขมากกว่า 0";
                  return null;
                },
              ),
              TextButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    var title = titleController.text;
                    var amount = amountControler.text;
                    Transactions statement = Transactions(
                        title: title,
                        amount: double.parse(amount),
                        date: DateTime.now());
                    var provider = Provider.of<TransactionProvider>(context,
                        listen: false);
                    provider.addTransaction(statement);

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return MyHomePage(title: 'แอปเติมเกมส์');
                      },
                    ));
                  }
                },
                child: Text("กดบันทึก"),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 15),
                  primary: Colors.white,
                  backgroundColor: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
