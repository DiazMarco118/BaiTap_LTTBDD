import 'package:flutter/material.dart';

class DialogsDetailScreen extends StatelessWidget {
  const DialogsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Dialogs',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dialogs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Dialogs provide important prompts\nin a user flow.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.blueGrey[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      icon: Icon(Icons.note, color: Colors.grey, size: 32),
                      title: const Text(
                        'Dialog with hero icon',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      content: Text(
                        'A dialog is a type of modal window that\ncontains critical information or asks for\ncritical information, or ask for a decision.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[700],
                          height: 1.5,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Decline'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Confirm'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
