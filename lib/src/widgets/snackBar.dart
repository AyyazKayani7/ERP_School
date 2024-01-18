import 'package:flutter/material.dart';

class SnackBarCustom extends StatefulWidget {
  const SnackBarCustom({super.key});

  @override
  State<SnackBarCustom> createState() => _SnackBarCustomState();
}

class _SnackBarCustomState extends State<SnackBarCustom> {
  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(''));
  }
}
