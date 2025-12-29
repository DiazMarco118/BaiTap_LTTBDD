import 'package:flutter/material.dart';

class TimePickerDetailScreen extends StatefulWidget {
  const TimePickerDetailScreen({super.key});

  @override
  State<TimePickerDetailScreen> createState() => _TimePickerDetailScreenState();
}

class _TimePickerDetailScreenState extends State<TimePickerDetailScreen> {
  TimeOfDay selectedTime = const TimeOfDay(hour: 7, minute: 0);

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
          'Time pickers',
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
              'Time pickers',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Time pickers help users select and set a\nspecific time.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  Text(
                    '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: selectedTime,
                      );
                      if (pickedTime != null) {
                        setState(() {
                          selectedTime = pickedTime;
                        });
                      }
                    },
                    child: const Text('Pick Time'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
