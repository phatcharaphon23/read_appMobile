import 'package:flutter/material.dart';
import 'package:flutter_application_3/model/transaction.dart';
import 'package:flutter_application_3/provoders/transaction_provider.dart';
import 'package:flutter_application_3/screens/from_screen.dart';
import 'package:flutter_application_3/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) {
              return TransactionProvider();
            },
          )
        ],
        child: MaterialApp(
          title: 'APP',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: const MyHomePage(title: 'แอปเติมเกมส์'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).intitData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Colors.black,
            body: TabBarView(
              children: [
                HomeScreen(),
                FormScreen(),
              ],
            ),
            bottomNavigationBar: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.list),
                  text: 'รายการ',
                ),
                Tab(
                  icon: Icon(Icons.add_box_rounded),
                  text: 'เพิ่มข้อมูล',
                )
              ],
            )));
  }
}
