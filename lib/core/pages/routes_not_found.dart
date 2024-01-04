import 'package:flutter/material.dart';

class RouteNotFound extends StatelessWidget {
  const RouteNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Routes Not found"),
      ),
    );
  }
}
