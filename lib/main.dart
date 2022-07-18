import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:uas/screen/dosen_viewmodel.dart';
import 'package:uas/utils/app_route.dart';

import 'screen/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DosenViewModel()),
      ],
      child: MaterialApp(
        title: 'Data Dosen',
        navigatorKey: AppRoute.navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
        ],
        home: const HomeScreen(),
      ),
    );
  }
}
