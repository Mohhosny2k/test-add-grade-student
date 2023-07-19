import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'item_student.dart';
import 'model/student_model.dart';

class Student2020 extends StatefulWidget {
  const Student2020({super.key});
 static List<Student> studentList20 = [];
  @override
  State<Student2020> createState() => _Student2020State();
}

class _Student2020State extends State<Student2020> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference stu2020 = FirebaseFirestore.instance.collection('2020');
  // Future<void> getStudent2020() async{
  // // DocumentReference courseCollection =
  // //         FirebaseFirestore.instance.collection('2020').doc('6j5Q2EbzyIboP1AzyQQx');
  // //     DocumentSnapshot responsebody = await courseCollection.get();
  //  List<Student> studentList20 = [];
  //   //List<Student> get; allCourse20 => _studentList20;
  // }
   //static List<Student> studentList21 = [];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: stu2020.snapshots(),
        builder: (context, snapshot) {
          List<Student> studentList20 = [];
          print(studentList20);
          studentList20.clear();
          try {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              studentList20.add(Student.fromJson(snapshot.data!.docs[i]));
              print(studentList20);
            }
          } catch (e) {
            print(e);
          }
          if (snapshot.hasData) {
            print(studentList20.length);
            return ListView.builder(
              padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
              itemCount: studentList20.length,
              itemBuilder: (context, index) {
                return ItemStudent(
                  name: studentList20[index].name,
                  grade: studentList20[index].grade,
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