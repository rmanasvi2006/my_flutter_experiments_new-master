import 'package:flutter/material.dart';
import 'package:my_flutter_experiments/experiment_6/custom_widgets.dart';
import 'package:my_flutter_experiments/experiment_6/theme_config.dart';

class CustomUIScreen extends StatefulWidget {
  const CustomUIScreen({Key? key}) : super(key: key);

  @override
  State<CustomUIScreen> createState() => _CustomUIScreenState();
}

class _CustomUIScreenState extends State<CustomUIScreen> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom UI Components'),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  _isDarkMode = !_isDarkMode;
                });
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0),
              const Text(
                'Custom Buttons',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                text: 'Primary Button',
                onPressed: () {},
                variant: ButtonVariant.primary,
                isFullWidth: true,
              ),
              const SizedBox(height: 12.0),
              CustomButton(
                text: 'Secondary Button',
                onPressed: () {},
                variant: ButtonVariant.secondary,
                isFullWidth: true,
              ),
              const SizedBox(height: 12.0),
              CustomButton(
                text: 'Outline Button',
                onPressed: () {},
                variant: ButtonVariant.outline,
                isFullWidth: true,
              ),
              const SizedBox(height: 12.0),
              CustomButton(
                text: 'Text Button',
                onPressed: () {},
                variant: ButtonVariant.text,
                isFullWidth: true,
              ),
              const SizedBox(height: 24.0),
              const Text(
                'Button with Icon',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                text: 'Add to Cart',
                onPressed: () {},
                variant: ButtonVariant.primary,
                icon: Icons.shopping_cart,
              ),
              const SizedBox(height: 24.0),
              const Text(
                'Custom Card',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Featured Product',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'This is a custom card component with elevation and rounded corners.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16.0),
                    CustomButton(
                      text: 'Learn More',
                      onPressed: () {},
                      variant: ButtonVariant.primary,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              const Text(
                'Form Elements',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24.0),
              CustomButton(
                text: 'Submit',
                onPressed: () {},
                variant: ButtonVariant.primary,
                isFullWidth: true,
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
