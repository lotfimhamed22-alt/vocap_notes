import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vocap_notes/constants/hive_constants.dart';
import 'package:vocap_notes/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:vocap_notes/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:vocap_notes/models/word_type_adapter.dart';
import 'package:vocap_notes/view/screens/home_screen.dart';
import 'package:vocap_notes/view/style/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordTypeAdapter());
  await Hive.openBox(HiveConstants.wordsBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WriteDataCubit()),
        BlocProvider(create: (context) => ReadDataCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getAppTheme(),
        home: const HomeScreen(),
      ),
    );
  }
}
