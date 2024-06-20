import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication_service.dart';

class EditProfileScreen extends StatefulWidget {
  final String currentBio;
  final List<String> currentInterests;

  EditProfileScreen({required this.currentBio, required this.currentInterests});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _bioController;
  late TextEditingController _interestsController;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _bioController = TextEditingController(text: widget.currentBio);
    _interestsController = TextEditingController(text: widget.currentInterests.join(', '));
  }

  @override
  void dispose() {
    _bioController.dispose();
    _interestsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _bioController,
              decoration: InputDecoration(labelText: 'Bio'),
            ),
            TextField(
              controller: _interestsController,
              decoration: InputDecoration(labelText: 'Interests (comma separated)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String bio = _bioController.text.trim();
                List<String> interests = _interestsController.text.trim().split(',').map((interest) => interest.trim()).toList();

                try {
                  await context.read<AuthenticationService>().updateProfile(user.uid, bio, interests);
                  Navigator.pop(context);
                } catch (e) {
                  setState(() {
                    _errorMessage = e.toString();
                  });
                }
              },
              child: Text('Save Changes'),
            ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
