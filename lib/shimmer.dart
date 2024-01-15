import 'package:flutter/material.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              width: 100.wp,
              color: Colors.grey.withOpacity(0.1),
            ),
            subtitle: Container(
              width: 100.wp,
              color: Colors.grey.withOpacity(0.1),
            ),
            leading: Container(
              width: 100.wp,
              height: 100.hp,
              color: Colors.grey.withOpacity(0.1),
            ),
          );
        },
      ),
    );
  }
}
