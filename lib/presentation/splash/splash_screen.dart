import 'dart:async';

import 'package:flutter/material.dart';
import '../../domain/bloc_exports.dart';
import '../main/tabs_screen.dart';

class SpalshScreen extends StatefulWidget {
  static const id = '/';
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  void onNextPage() {
    Timer(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacementNamed(TabsScreen.id);
    });
  }

  @override
  void initState() {
    onNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
