import 'package:flutter/material.dart';

class Experiment3 extends StatelessWidget {
  const Experiment3({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size using MediaQuery
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;
    final isTablet = screenSize.width >= 600 && screenSize.width < 1024;

    // Define responsive layout parameters
    final int crossAxisCount;
    final double aspectRatio;

    if (isMobile) {
      crossAxisCount = 1;
      aspectRatio = 1.5;
    } else if (isTablet) {
      crossAxisCount = 2;
      aspectRatio = 1.2;
    } else {
      // isDesktop
      crossAxisCount = 3;
      aspectRatio = 1.0;
    }
    final double paddingValue = isMobile ? 8.0 : 16.0;
    final double fontSize = isMobile ? 14.0 : (isTablet ? 16.0 : 18.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 3: Responsive Layout'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(paddingValue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Device Info Card
            Card(
              child: Padding(
                padding: EdgeInsets.all(paddingValue * 1.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Device Information',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text('Width: ${screenSize.width.toStringAsFixed(1)}'),
                    Text('Height: ${screenSize.height.toStringAsFixed(1)}'),
                    Text(
                        'Aspect Ratio: ${screenSize.aspectRatio.toStringAsFixed(2)}'),
                    const SizedBox(height: 8),
                    Text(
                      'Device Type: ${isMobile ? 'Mobile' : (isTablet ? 'Tablet' : 'Desktop')}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Responsive Grid
            Text(
              'Responsive Grid Layout',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: paddingValue,
                mainAxisSpacing: paddingValue,
                childAspectRatio: aspectRatio,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  color: _getColorForIndex(index),
                  child: Center(
                    child: Text(
                      'Item ${index + 1}',
                      style: TextStyle(
                        fontSize: fontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),

            // Responsive Layout Builder
            Text(
              'LayoutBuilder Example',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(paddingValue),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Text(
                    'This container is ${constraints.maxWidth.toStringAsFixed(1)}px wide. '
                    'On ${isMobile ? 'mobile' : (isTablet ? 'tablet' : 'desktop')}, '
                    'the layout adjusts accordingly.',
                    style: TextStyle(fontSize: fontSize),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Responsive Row/Column
            Text(
              'Responsive Row/Column',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            isMobile
                ? _buildVerticalLayout()
                : _buildHorizontalLayout(paddingValue),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalLayout() {
    return Column(
      children: [
        _buildInfoCard('Mobile Layout', 'This is optimized for small screens.',
            Icons.phone_android),
        const SizedBox(height: 8),
        _buildInfoCard('Portrait Mode', 'Content stacks vertically.',
            Icons.screen_rotation),
      ],
    );
  }

  Widget _buildHorizontalLayout(double padding) {
    return Row(
      children: [
        Expanded(
          child: _buildInfoCard('Wide Screen',
              'This is optimized for larger screens.', Icons.laptop),
        ),
        SizedBox(width: padding),
        Expanded(
          child: _buildInfoCard('Landscape Mode',
              'Content displays side by side.', Icons.screen_rotation),
        ),
      ],
    );
  }

  Widget _buildInfoCard(String title, String content, IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 24, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(content),
          ],
        ),
      ),
    );
  }

  Color _getColorForIndex(int index) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
    ];
    return colors[index % colors.length];
  }
}
