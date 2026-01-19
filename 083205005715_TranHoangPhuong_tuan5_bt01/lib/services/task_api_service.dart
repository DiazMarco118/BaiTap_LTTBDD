import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class TaskApiService {
  static const String baseUrl = 'https://amock.io/api/researchUTH';

  // GET all tasks
  Future<List<Task>> getTasks() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/tasks'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final dynamic jsonData = json.decode(response.body);

        print('API Response Type: ${jsonData.runtimeType}');
        print('API Response: $jsonData');

        // Check if response is a Map (with data property) or List
        if (jsonData is Map<String, dynamic>) {
          // If it's a map, try to get the tasks from different possible keys
          dynamic tasksList =
              jsonData['data'] ??
              jsonData['tasks'] ??
              jsonData['items'] ??
              jsonData['results'] ??
              [];

          if (tasksList is List) {
            return (tasksList as List)
                .map((json) => Task.fromJson(json as Map<String, dynamic>))
                .toList();
          } else {
            // Maybe the map itself is a task
            return [Task.fromJson(jsonData)];
          }
        } else if (jsonData is List) {
          // If it's already a list
          return (jsonData as List)
              .map((json) => Task.fromJson(json as Map<String, dynamic>))
              .toList();
        } else {
          throw Exception(
            'Unexpected response format: ${jsonData.runtimeType}',
          );
        }
      } else {
        throw Exception('Failed to load tasks: ${response.statusCode}');
      }
    } catch (e) {
      print('Error details: $e');
      throw Exception('Error fetching tasks: $e');
    }
  }

  // GET task by ID
  Future<Task> getTaskById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/task/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return Task.fromJson(jsonData);
      } else {
        throw Exception('Failed to load task: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching task: $e');
    }
  }

  // DELETE task by ID
  Future<bool> deleteTask(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/task/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return true;
      } else {
        throw Exception('Failed to delete task: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error deleting task: $e');
    }
  }
}
