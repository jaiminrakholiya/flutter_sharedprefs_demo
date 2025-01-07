import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PathProviderExamplethProvider extends StatefulWidget {
  const PathProviderExamplethProvider({super.key});

  @override
  State<PathProviderExamplethProvider> createState() =>
      _PathProviderExamplethProviderState();
}

class _PathProviderExamplethProviderState
    extends State<PathProviderExamplethProvider> {
  //To dispaly the path
  String _appDocumentsPath = 'Not yet fetched';

  //Function to get the application documents directory path
  Future<void> _getAppDocumentsDirectory() async {
    try {
      // Get the directory path where the app stores files
      final directory = await getApplicationDocumentsDirectory();
      setState(() {
        _appDocumentsPath = directory.path;
      });
    } catch (e) {
      //Handle errors
      setState(() {
        _appDocumentsPath = 'Error fectching path: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Path Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Getting the Application Documents Directory.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: _getAppDocumentsDirectory,
              //call the function on button press
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('App Document Directory'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Path: $_appDocumentsPath',
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
