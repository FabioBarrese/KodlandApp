
import 'dart:core';

import 'package:kodland_app/my_objects/my_objects.dart';

class Course {
  final int id;
  final int minAge;
  final int maxAge;
  final String name;
  final String imagePath;
  final String description;
  final List<String> skills;

  final String prerequisites;
  final Level level;
  final PositiveInteger duration;

  const Course({
    required this.id,
    required this.minAge,
    required this.maxAge,
    required this.name,
    required this.imagePath,
    required this.description,
    required this.skills,
    required this.prerequisites,
    required this.level,
    required this.duration
  });
}