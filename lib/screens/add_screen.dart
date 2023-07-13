import 'package:bagstore/screens/home_screen.dart';
import 'package:bagstore/widgets/add_form.dart';

import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  void goToHomeScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        centerTitle: true,
        elevation: 0,
      ),
      body: const AddForm(),
    );
  }
}
