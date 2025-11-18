import 'package:flutter/material.dart';

void main() {
  runApp(const NavigationApp());
}

class NavigationApp extends StatelessWidget {
  const NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // Initial route when the app starts
      initialRoute: '/',
      // Define all the routes in the app
      routes: {
        '/': (context) => const HomeScreen(),
        '/second': (context) => const SecondScreen(),
        '/third': (context) => const ThirdScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Home Screen!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // Navigation using named routes
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen using a named route
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Go to Second Screen (Named Route)'),
            ),
            const SizedBox(height: 10),
            
            // Navigation with arguments
            ElevatedButton(
              onPressed: () {
                // Navigate to profile screen with arguments
                Navigator.pushNamed(
                  context,
                  '/profile',
                  arguments: {
                    'name': 'John Doe',
                    'email': 'john@example.com',
                  },
                );
              },
              child: const Text('View Profile (With Arguments)'),
            ),
            const SizedBox(height: 10),
            
            // Navigation with result
            ElevatedButton(
              onPressed: () async {
                // Navigate to third screen and wait for a result
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThirdScreen(),
                  ),
                );
                
                // Show a snackbar with the result
                if (result != null) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Received: $result')),
                    );
                  }
                }
              },
              child: const Text('Go to Third Screen (With Result)'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is the Second Screen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // Go back to the previous screen
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
            const SizedBox(height: 10),
            
            // Navigate to a named route
            ElevatedButton(
              onPressed: () {
                // This will replace the current route with the home route
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Go to Home (Replace)'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is the Third Screen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text('This screen can return a result when popped.'),
            const SizedBox(height: 20),
            
            // Return a result when going back
            ElevatedButton(
              onPressed: () {
                // Return a result to the previous screen
                Navigator.pop(context, 'Hello from Third Screen!');
              },
              child: const Text('Return with Result'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            if (args != null) ...[
              Text('Name: ${args['name']}'),
              const SizedBox(height: 8),
              Text('Email: ${args['email']}'),
            ] else
              const Text('No profile data available'),
              
            const Spacer(),
            
            // Button to go back to home
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Go back to the home screen
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
