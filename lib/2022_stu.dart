import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'item_student.dart';
import 'model/student_model.dart';

class Student2022 extends StatefulWidget {
  const Student2022({super.key});

  @override
  State<Student2022> createState() => _Student2022State();
}

class _Student2022State extends State<Student2022> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference stu2022 = FirebaseFirestore.instance.collection('2022');
 List<Student> studentList22 = [];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: stu2022.snapshots(),
        builder: (context, snapshot) {
          
          print(studentList22);
          studentList22.clear();
          try {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              studentList22.add(Student.fromJson(snapshot.data!.docs[i]));
              print(studentList22);
            }
          } catch (e) {
            print(e);
          }
          if (snapshot.hasData) {
            print(studentList22.length);
            return ListView.builder(
              padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
              itemCount: studentList22.length,
              itemBuilder: (context, index) {
                return ItemStudent(
                  name: studentList22[index].name,
                  grade: studentList22[index].grade,
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


// ListView.builder(
//                 padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
//                 itemCount: 4,
//                 itemBuilder: (context, index) {
//                   return ItemStudent(

//                     name: 'Mohamed Hosny',
//                     grade: '20',
//                   );
//                 },
//               );