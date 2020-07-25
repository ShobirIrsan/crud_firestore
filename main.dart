
import 'package:flutter/material.dart';
import 'package:flutter_crud_firestore/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 String value="data";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "shobir_firestore",
      home: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Write"),
                  onPressed: (){
                    DatabaseServices.createOrUppdateProduk("1", name: "masker", price: 100000);

                }),
                 RaisedButton(
                  child: Text("Read"),
                  onPressed: ()async{
                    DocumentSnapshot snapshot = await DatabaseServices.getProduk("1");
                    print(snapshot.data['nama']);
                    print(snapshot.data['harga']);
                    value = snapshot.data['nama'];
                }),
                 RaisedButton(
                  child: Text("Update"),
                  onPressed: (){
                      DatabaseServices.createOrUppdateProduk("1", name: "masker", price: 200000);
                }),
                 RaisedButton(
                  child: Text("Delate"),
                  onPressed: ()async{
                    await DatabaseServices.delateProduk("1");
                }),
                Text(value)
                
              ],
            ),
          ),
        )
      )
    );
  }
}
