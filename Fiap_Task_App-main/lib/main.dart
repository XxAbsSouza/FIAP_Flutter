import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/pages/home/home_page.dart';

import 'provider/task_group_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://pwvsowcxkfyvhodlmwyn.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB3dnNvd2N4a2Z5dmhvZGxtd3luIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg0MzQ2NDAsImV4cCI6MjA0NDAxMDY0MH0.ZqIS0B1SZ2qqYpMGMrQEc5yzIgDU53Xwfa2ajd_D6co',
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskGroupProvider()..listTaskGroups()), //cria um provider para a classe TaskGroupProvider e chama o método listTaskGroups
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task APP',
      themeMode: ThemeMode.light,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
