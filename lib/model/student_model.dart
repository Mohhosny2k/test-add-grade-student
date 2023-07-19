class Student {
  final String name;
  // final String id;
  final String grade;
  final String year;
  Student( this.name, this.grade, this.year);
  factory Student.fromJson(jsonData) {
    return Student(jsonData['name'],jsonData['grade'],jsonData['year']); //'message'
  }
}

class StudentName {
  final String name;
  // final String id;
  final String grade;
  final String year;
  StudentName({required this.name,required this.grade,required this.year} );
 
  }
