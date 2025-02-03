import 'package:duckdo_todo/config/environment.dart';
import 'package:duckdo_todo/config/router/app_router.dart';
import 'package:duckdo_todo/providers/theme_provider.dart';
import 'package:duckdo_todo/providers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Environment.initEnvironment();
  await Supabase.initialize(
      url: Environment.supabaseUrl, anonKey: Environment.supabaseAnon);
  runApp(ChangeNotifierProvider(
    create: (context) => TodoProvider(),
    child: ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.read<TodoProvider>();
    todoProvider.getAll();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'DuckDo Todo',
      routerConfig: appRouter,
    );
  }
}
