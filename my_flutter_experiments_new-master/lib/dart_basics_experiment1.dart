import 'package:flutter/material.dart';

class Experiment1 extends StatelessWidget {
  const Experiment1({super.key});

  // Function to demonstrate basic Dart functions
  String greet(String name) {
    return 'Hello, $name!';
  }

  // Function to demonstrate loops and conditionals
  List<String> getEvenNumbers(int limit) {
    List<String> evens = [];
    for (int i = 1; i <= limit; i++) {
      if (i % 2 == 0) {
        evens.add('Even: $i');
      }
    }
    return evens;
  }

  @override
  Widget build(BuildContext context) {
    // Variables demonstration
    const int number = 42;
    dynamic dynamicVar = 'This can change type';
    dynamicVar = 100; // Now it's an int

    // List demonstration
    const numbers = [0, 2, 4, 6, 8];

    // Map demonstration
    const person = {
      'name': 'John Doe',
      'age': 30,
      'isDeveloper': true,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 1: Dart Basics'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // String interpolation and function call
            Text(
              greet('Flutter Learner'),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),

            // Variables
            const Text('Variables:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Title: Dart Basics'),
            const Text('Number: 42'),
            Text('Dynamic Variable: $dynamicVar'),
            const SizedBox(height: 16),

            // Lists
            const Text('List of numbers:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(numbers.join(', ')),
            const SizedBox(height: 16),

            // Maps
            const Text('Person Map:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Name: ${person['name']}'),
            Text('Age: ${person['age']}'),
            Text('Is Developer: ${person['isDeveloper']}'),
            const SizedBox(height: 16),

            // Function with loop
            const Text('Even Numbers (1-10):',
                style: TextStyle(fontWeight: FontWeight.bold)),
            ...getEvenNumbers(10).map((e) => Text(e)).toList(),
            const SizedBox(height: 16),

            // For loop in widget building
            const Text('For Loop Example:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            for (int i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text('Count: $i'),
              ),

            // Conditional rendering
            const SizedBox(height: 16),
            const Text('Conditional Rendering:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            if (number > 30)
              const Text('The number is greater than 30')
            else
              const Text('The number is 30 or less'),
          ],
        ),
      ),
    );
  }
}
