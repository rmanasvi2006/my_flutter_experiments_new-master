import 'package:flutter/material.dart';

class Experiment2 extends StatelessWidget {
  const Experiment2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 2: Basic Widgets & Layouts'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text Widget
            const Text(
              '1. Text Widget',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'This is a simple text widget with different styles.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),

            // Image Widget
            const Text(
              '2. Image Widget',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: const Center(
                child: Text('Image Placeholder', style: TextStyle(color: Colors.grey)),
              ),
            ),
            const SizedBox(height: 20),

            // Container Widget
            const Text(
              '3. Container Widget',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue[200]!),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(77), // ~30% opacity of grey
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Text('This is a styled Container widget'),
            ),
            const SizedBox(height: 20),

            // Row Widget
            const Text(
              '4. Row Widget',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildColoredBox(Colors.red, '1'),
                _buildColoredBox(Colors.green, '2'),
                _buildColoredBox(Colors.blue, '3'),
              ],
            ),
            const SizedBox(height: 20),

            // Column Widget
            const Text(
              '5. Column Widget',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                children: [
                  Text('First item in column'),
                  Divider(),
                  Text('Second item in column'),
                  Divider(),
                  Text('Third item in column'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Stack Widget
            const Text(
              '6. Stack Widget',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.blue[100],
                  ),
                  Positioned(
                    right: 20,
                    top: 10,
                    child: Container(
                      width: 80,
                      height: 80,
                      color: Colors.red[200],
                      child: const Center(child: Text('Top Right')),
                    ),
                  ),
                  const Positioned(
                    left: 20,
                    bottom: 10,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green,
                      child: Text('Avatar', style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColoredBox(Color color, String text) {
    return Container(
      width: 60,
      height: 60,
      color: color,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
