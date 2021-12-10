import 'package:flutter/material.dart';
import 'apiService.dart';
import 'cuaca.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future data;
  late Cuaca data2;

  void ambilData(){
    data = ApiService().getCuaca();
    data.then((value) {
      setState(() {
        data2 = value;
        print(data2.main.pressure);
        //DATA NYA UDAH DAPAT TINGGAL EKSEKUSI
      });
    });
  }

  @override
  void initState() {
    ambilData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cuaca")),
      body: Center(child: Text("Cuaca"),),
    );
  }
}