import 'package:asbeza/bloc/update_bloc.dart';
import 'package:asbeza/screen/Account.dart';
import 'package:asbeza/screen/History.dart';
import 'package:asbeza/screen/item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Base(),


      ),
    );
  }
}
class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}
class _BaseState extends State<Base> {
  int _currentindex = 0;
  final tabs = [
    Item_screen(),
    History(),
    Account(),
    // RepositoryProvider(
    //   create: (context) => Foodrepositery(),
    //   child: const Foo,
    // )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Colors.blue,
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              backgroundColor: Colors.black,
              label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              backgroundColor: Colors.green,
              label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}