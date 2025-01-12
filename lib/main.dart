import 'package:duckdo_todo/config/environment.dart';
import 'package:duckdo_todo/widgets/todo_card.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Environment.initEnvironment();
  runApp(const MyApp());
  await Supabase.initialize(
      url: Environment.supabaseUrl, anonKey: Environment.supabaseAnon);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DuckDo Todo',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(226, 232, 240, 1),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return TodoCard(completed: index % 2 == 0);
            },
          ),
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            // side: BorderSide(color: Colors.white),
          ),
          onPressed: () {},
          child: Icon(
            Icons.add_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
