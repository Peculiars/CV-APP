import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CvScreen(),
    );
  }
}

class CvScreen extends StatefulWidget {
  const CvScreen({Key? key}) : super(key: key);

  @override
  State<CvScreen> createState() => _CvScreenState();
}

class _CvScreenState extends State<CvScreen> {
  String fullName = 'Olaitan Damilare';
  String slackUserName = 'Peculiars';
  String githubHandle = 'Peculiars';
  String bio = "I'm a passionate Mobile Developer";

  // Callback function to update data
  void updateData(String newFullName, String newSlackUserName, String newGithubHandle, String newBio) {
    setState(() {
      fullName = newFullName;
      slackUserName = newSlackUserName;
      githubHandle = newGithubHandle;
      bio = newBio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'CV APP',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Full Name: $fullName",
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 10.0,),
            Text(
              "Slack Username: $slackUserName",
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 10.0,),
            Text(
              "GitHub Handle: $githubHandle",
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 10.0,),
            Text(
              "Bio: $bio",
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 25.0,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditCv(onSave: updateData),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text('Edit CV'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditCv extends StatefulWidget {
  final Function(String, String, String, String) onSave;

  const EditCv({Key? key, required this.onSave}) : super(key: key);

  @override
  State<EditCv> createState() => _EditCvState();
}

class _EditCvState extends State<EditCv> {
  final fullNameController = TextEditingController();
  final slackUsernameController = TextEditingController();
  final githubHandleController = TextEditingController();
  final bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fullNameController.text = 'Olaitan Damilare';
    slackUsernameController.text = 'Peculiars';
    githubHandleController.text = 'Peculiars';
    bioController.text = 'I am a passionate Mobile App developer';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Edit CV',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 80.0, right: 80.0),
        child: Column(
          children: [
            TextFormField(
              controller: fullNameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            TextFormField(
              controller: slackUsernameController,
              decoration: const InputDecoration(
                labelText: 'Slack Username',
              ),
            ),
            TextFormField(
              controller: githubHandleController,
              decoration: const InputDecoration(
                labelText: 'GitHub Handle',
              ),
            ),
            TextFormField(
              controller: bioController,
              decoration: const InputDecoration(
                labelText: 'My Bio',
              ),
            ),
            const SizedBox(height: 35.0,),
            ElevatedButton(
              onPressed: () {
                // Get the updated data from the controllers
                final newFullName = fullNameController.text;
                final newSlackUserName = slackUsernameController.text;
                final newGithubHandle = githubHandleController.text;
                final newBio = bioController.text;

                // Call the onSave callback to pass the updated data back to CvScreen
                widget.onSave(newFullName, newSlackUserName, newGithubHandle, newBio);

                // Close the EditCv screen
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text('Save Change'),
            ),
          ],
        ),
      ),
    );
  }
}
