# Experiment 9: API Integration

## Overview
This experiment demonstrates how to fetch data from a REST API and display it in a Flutter application using the `http` package and state management.

## Features
- Make HTTP GET requests to a public API
- Parse JSON responses into Dart objects
- Handle loading, success, and error states
- Display data in a ListView/GridView
- Implement pull-to-refresh functionality
- Cache API responses
- Error handling and retry mechanism

## Files
- `api_service.dart` - Handles API requests and response parsing
- `models/` - Contains data models for API responses
- `screens/` - Contains UI screens for displaying API data
  - `api_home_screen.dart` - Main screen with data display
  - `post_detail_screen.dart` - Shows detailed view of a single item
- `widgets/` - Reusable widgets for displaying API data
  - `post_item.dart` - Widget for displaying a single post
  - `loading_indicator.dart` - Loading and error state widgets

## How to Use
1. Add the `http` package to your `pubspec.yaml`
2. Create model classes for your API responses
3. Implement the API service for making requests
4. Use `FutureBuilder` or state management to handle the API state
5. Display the data in your UI

## Example Usage
```dart
// Make an API request
Future<List<Post>> fetchPosts() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  );
  
  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List)
        .map((post) => Post.fromJson(post))
        .toList();
  } else {
    throw Exception('Failed to load posts');
  }
}

// Display the data
FutureBuilder<List<Post>>(
  future: fetchPosts(),
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      return ErrorWidget(snapshot.error!);
    }
    if (!snapshot.hasData) {
      return const LoadingIndicator();
    }
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        return PostItem(post: snapshot.data![index]);
      },
    );
  },
)
```

## API Endpoints Used
- Posts: `https://jsonplaceholder.typicode.com/posts`
- Users: `https://jsonplaceholder.typicode.com/users`
- Comments: `https://jsonplaceholder.typicode.com/comments`

## Dependencies
- `http`: For making HTTP requests
- `dio`: Alternative HTTP client with more features
- `provider` or `bloc`: For state management
- `shared_preferences`: For caching responses
- `connectivity_plus`: For checking network connectivity

## Best Practices
- Use environment variables for API keys and base URLs
- Implement proper error handling and user feedback
- Add loading indicators for better UX
- Cache responses when appropriate
- Handle offline scenarios gracefully
- Implement pagination for large data sets
- Use proper model classes for type safety

## Screenshots
[Add screenshots of the app displaying API data]
