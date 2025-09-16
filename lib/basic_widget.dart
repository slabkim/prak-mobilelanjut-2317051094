import 'package:flutter/material.dart';

class BasicWidget extends StatelessWidget {
  const BasicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Row')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/shines.png', width: 200, height: 200),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Be A star in Your Own Universe'),
            ),
          ],
        ),
      ),
    );
  }
}
