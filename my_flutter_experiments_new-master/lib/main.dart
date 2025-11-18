import 'package:flutter/material.dart';
import 'dart_basics_experiment1.dart';
import 'widgets_layouts_experiment.dart';
import 'responsive_layout_experiment.dart';
import 'navigation_experiment.dart' as exp4;
import 'state_management_experiment.dart' as exp5;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Experiments',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const exp5.StateManagementApp(),
    );
  }
}

class ExperimentHome extends StatelessWidget {
  const ExperimentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Experiments'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildExperimentCard(
            context,
            title: 'Experiment 1',
            description: 'Basic Widgets',
            onTap: () => _navigateToExperiment(context, const Experiment1()),
          ),
          _buildExperimentCard(
            context,
            title: 'Experiment 2',
            description: 'Layouts and Styling',
            onTap: () => _navigateToExperiment(context, const Experiment2()),
          ),
          _buildExperimentCard(
            context,
            title: 'Experiment 3',
            description: 'Responsive Layouts',
            onTap: () => _navigateToExperiment(context, const Experiment3()),
          ),
          _buildExperimentCard(
            context,
            title: 'Experiment 4',
            description: 'Navigation Demo',
            onTap: () =>
                _navigateToExperiment(context, const exp4.NavigationApp()),
          ),
          _buildExperimentCard(
            context,
            title: 'Experiment 5',
            description: 'Advanced Features',
            onTap: () =>
                _navigateToExperiment(context, const exp5.StateManagementApp()),
          ),
        ],
      ),
    );
  }

  Widget _buildExperimentCard(
    BuildContext context, {
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8.0),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToExperiment(BuildContext context, Widget experiment) {
    // For experiments that have their own main function, we'll just show them directly
    // without wrapping in a Scaffold
    if (experiment is exp4.NavigationApp ||
        experiment is exp5.StateManagementApp) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => experiment),
      );
    } else {
      // For other experiments, wrap in a Scaffold with an AppBar
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(experiment.toStringShort()),
            ),
            body: experiment,
          ),
        ),
      );
    }
  }
}
