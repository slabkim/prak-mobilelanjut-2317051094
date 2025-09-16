import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Column Widget')),
      body: const Column(
        children: const [
          Text('Ilmu Komputer'),
          Text('FMIPA'),
          Text('Universitas Lampung'),
          Text('2025'),
        ],
      ),
    );
  }
}
