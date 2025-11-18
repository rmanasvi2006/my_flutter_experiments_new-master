import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Wrap the app with the ChangeNotifierProvider
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const StateManagementApp(),
    ),
  );
}

class StateManagementApp extends StatelessWidget {
  const StateManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const StateManagementHome(),
    );
  }
}

// 1. Stateless Widget Example
class GreetingWidget extends StatelessWidget {
  final String name;

  const GreetingWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello, $name!',
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

// 2. Stateful Widget Example
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Counter using setState',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Count: $_counter',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. Provider Model
class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

// 4. Consumer Widget
class ProviderCounter extends StatelessWidget {
  const ProviderCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Counter using Provider',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            // Using Consumer to listen to changes in CounterProvider
            Consumer<CounterProvider>(
              builder: (context, counter, child) {
                return Column(
                  children: [
                    Text(
                      'Count: ${counter.count}',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: counter.increment,
                          child: const Text('Increment'),
                        ),
                        ElevatedButton(
                          onPressed: counter.reset,
                          child: const Text('Reset'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// 5. Home Screen
class StateManagementHome extends StatelessWidget {
  const StateManagementHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management Examples'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Stateless Widget
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Stateless Widget',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    GreetingWidget(name: 'Flutter Developer'),
                    SizedBox(height: 5),
                    Text(
                        'This is a simple stateless widget that displays a greeting.'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 2. Stateful Widget with setState
            const CounterWidget(),

            const SizedBox(height: 20),

            // 3. Provider State Management
            const Text(
              '3. Provider State Management',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const ProviderCounter(),

            const SizedBox(height: 20),

            // 4. Accessing Provider from another widget
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      '4. Accessing Provider from another widget',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Consumer<CounterProvider>(
                      builder: (context, counter, child) {
                        return Text(
                          'Current count from another widget: ${counter.count}',
                          style: const TextStyle(fontSize: 16),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Notice how this updates when you use the buttons above!',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
