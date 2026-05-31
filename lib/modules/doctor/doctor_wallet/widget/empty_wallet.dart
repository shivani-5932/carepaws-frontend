import 'package:flutter/material.dart';

class EmptyWallet extends StatelessWidget {
  const EmptyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Empty !",
        style: TextStyle(
          fontSize: 18,
          color: Color(0xff4E4038),
        ),
      ),
    );
  }
}