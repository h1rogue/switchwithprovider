import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switchwithprovider/providers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>providers(),
      child: MyHome(),
    );
  }
}
class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Material App',
      home: Scaff()
    );
  }
}

class Scaff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<providers>(context);
    print('hello value: ${prov.heelo}');
    print('smile value: ${prov.smil}');
    return Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Hello World'),
                  Switch(
                    value: prov.heelo,
                    onChanged: (bool value) {
                      prov.setheelo(value);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Smile'),
                  Switch(
                    value: prov.smil,
                    onChanged: (bool value) {
                      prov.setsmil(value);
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

