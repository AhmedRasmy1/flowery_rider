import 'package:flutter/material.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'v 6.3.0 - (446)',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}