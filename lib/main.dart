import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

import 'pages/main_page/main_page.dart';
import 'providers/cart_provider.dart';
import 'model/product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final data =
      jsonDecode(await rootBundle.loadString('assets/sample_data.json'));
  final dataModel = (data['products'] as List<dynamic>)
      .map((e) => ProductDetail.fromJson(Map<String, dynamic>.from(e)))
      .toList();

  runApp(ProviderScope(
      overrides: [mockDataProvider.overrideWithValue(dataModel)],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
