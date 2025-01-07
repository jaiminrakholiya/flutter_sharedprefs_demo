import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp()); // Entry point of the Flutter app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // Application title
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Theme with deep purple color
        useMaterial3: true, // Material 3 design
      ),
      home: MyHomePage(), // Setting MyHomePage as the starting screen
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final nameController = TextEditingController(); // Controller to handle text input for name

  static const String KEYNAME = "name"; // Key used to store/retrieve value in SharedPreferences
  String nameValue = 'No Value Saved'; // Default value if no data is found in SharedPreferences

  @override
  void initState() {
    super.initState();
    getValue(); // Fetch saved value from SharedPreferences when the app starts
  }

  // Method to retrieve value from SharedPreferences
  void getValue() async {
    var prefs = await SharedPreferences.getInstance(); // Access SharedPreferences instance
    var getName = prefs.getString(KEYNAME); // Retrieve the value associated with the key
    setState(() {
      nameValue = getName ?? 'No Value Saved'; // Update the UI, handle null with a default value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Pref'), // App bar title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          children: [
            TextField(
              controller: nameController, // Attach the controller to TextField
              decoration: InputDecoration(
                label: const Text('Name'), // Input label
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21), // Rounded border for TextField
                ),
              ),
            ),
            const SizedBox(height: 11), // Add spacing between elements
            ElevatedButton(
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance(); // Access SharedPreferences instance
                await prefs.setString(KEYNAME, nameController.text.toString()); // Save input text
                getValue(); // Fetch and update the displayed value after saving
              },
              child: const Text('Save'), // Button text
            ),
            const SizedBox(height: 11), // Add spacing
            Text(
              nameValue, // Display the fetched value
              style: const TextStyle(fontSize: 18), // Style for displayed value
            ),
          ],
        ),
      ),
    );
  }
}