# Experiment 7: Form Validation and Error Handling

## Overview
This experiment demonstrates how to implement form validation and error handling in Flutter using the `Form` widget, `TextFormField`, and validation logic.

## Features
- Form validation with required fields
- Email and password validation
- Real-time validation feedback
- Custom error messages
- Form submission with validation
- Error display and styling

## Files
- `form_validation_screen.dart`: Contains the form implementation with validation
- `validators.dart`: Contains reusable validation functions
- `form_field_widget.dart`: Custom form field widget with built-in validation

## How to Use
1. Import the form validation screen in your app
2. Use the `Form` widget with a `GlobalKey<FormState>`
3. Add `TextFormField` widgets with validation logic
4. Handle form submission with validation

## Example Usage
```dart
// Create a form with validation
Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        validator: (value) => Validators.validateEmail(value),
        onSaved: (value) => _email = value!,
      ),
      // Add more form fields...
      ElevatedButton(
        onPressed: _submitForm,
        child: Text('Submit'),
      ),
    ],
  ),
)

// Handle form submission
void _submitForm() {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();
    // Process form data
  }
}
```

## Validation Rules
- **Required Fields**: All fields are required
- **Email**: Must be a valid email format
- **Password**: At least 8 characters, 1 uppercase, 1 lowercase, 1 number
- **Phone Number**: Valid phone number format
- **Matching Passwords**: Confirm password must match the password field

## Customization
- Customize error messages in the `validators.dart` file
- Style form fields in the `form_field_widget.dart` file
- Add additional validation rules as needed

## Dependencies
- `flutter_form_builder` (optional): For more advanced form handling
- `form_validator`: For additional validation rules

## Screenshots
[Add screenshots of the form with validation errors and success states]
