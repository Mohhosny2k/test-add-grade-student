import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'item_student.dart';
import 'model/student_model.dart';

class Student2021 extends StatefulWidget {
  const Student2021({super.key});
  //static List<Student> studentList21 = [];
  @override
  State<Student2021> createState() => _Student2021State();
}

class _Student2021State extends State<Student2021> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference stu2021 = FirebaseFirestore.instance.collection('2021');
  
static List<Student> studentList21 = [];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: stu2021.snapshots(),
        builder: (context, snapshot) {
         
         // print(widget.studentList21);
         studentList21.clear();
          try {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              studentList21.add(Student.fromJson(snapshot.data!.docs[i]));
              print(studentList21);
            }
          } catch (e) {
            print(e);
          }
          if (snapshot.hasData) {
            print(studentList21.length);
            return ListView.builder(
              padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
              itemCount: studentList21.length,
              itemBuilder: (context, index) {
                return ItemStudent(
                  name: studentList21[index].name,
                  grade: studentList21[index].grade,
                );
              },
            );
          }
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text('Error Wait......')),
            );
          } else {
            return Scaffold(
              body: Center(child: Text('loading......')),
            );
          }
        });
  }
}


