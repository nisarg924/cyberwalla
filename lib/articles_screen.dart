import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication_service.dart';

class ArticlesScreen extends StatefulWidget {
  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(hintText: 'Article Title'),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _contentController,
                  decoration: InputDecoration(hintText: 'Article Content'),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    final user = Provider.of<User>(context, listen: false);
                    context.read<AuthenticationService>().createArticle(user.uid, _titleController.text, _contentController.text);
                    _titleController.clear();
                    _contentController.clear();
                  },
                  child: Text('Post Article'),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: context.read<AuthenticationService>().getArticles(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final articles = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return ListTile(
                      title: Text(article['title']),
                      subtitle: Text(article['content']),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

