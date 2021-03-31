import 'package:flutter/material.dart';
import 'package:flutter_pizza_list/pizza.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Pizza Order'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pizza> pizzasInOrder = new List();

  _MyHomePageState() {
    //pizzasInOrder[0] = new Pizza("Large", 1);
    //pizzasInOrder.add(new Pizza("Small", 1));
  }

  void _addPizza() {
    final pizzaToppingTextField = TextEditingController();
    int _sizeSelected = 1;
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SizedBox(
              height: 200,
              child:  Column(
                children: <Widget>[
                  Text(
                    'Toppings:',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  TextField(
                    controller: pizzaToppingTextField,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  DropdownButton(
                      style: Theme.of(context).textTheme.headline4,
                      value: _sizeSelected,
                      items:[
                        DropdownMenuItem(child: Text("Small"), value: 0),
                        DropdownMenuItem(child: Text("Medium"), value: 1),
                        DropdownMenuItem(child: Text("Large"), value: 2),
                        DropdownMenuItem(child: Text("X-Lareg"), value: 3)
                      ],
                      onChanged: (value) {
                        setState(() {
                          _sizeSelected = value;
                        });
                      }),
                  ElevatedButton(
                    child: Text('Add Pizza'),
                    onPressed: () {
                      print("Adding a pizza");
                      setState(() {
                        Pizza newPizza = new Pizza(pizzaToppingTextField.text, _sizeSelected);
                        pizzasInOrder.add(newPizza);
                        Navigator.pop(context);
                      });
                    },
                  ),
                ],
              ),
            )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: pizzasInOrder.length,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              child: ListTile(
                leading: Icon(Icons.restaurant),
                title: Text(pizzasInOrder[position].description),
                onTap: () {
                  print("You tapped on items $position");
                },
              )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPizza,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}






