import 'package:flutter/material.dart';

class LinhaHorizontal extends StatelessWidget {
  const LinhaHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: const Color.fromARGB(255, 19, 89, 146), 
      thickness: 2);
  }
}
