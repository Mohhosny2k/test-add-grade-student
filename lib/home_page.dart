import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:test_student_app/custom_text_form_field.dart';
import 'package:test_student_app/item_student.dart';
import 'package:test_student_app/model/student_model.dart';

import '2020_stu.dart';
import '2021_stu.dart';
import '2022_stu.dart';
import 'constants.dart';
import 'custom_bottom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference stu2020 = FirebaseFirestore.instance.collection('2020');
  CollectionReference stu2021 = FirebaseFirestore.instance.collection('2021');
  CollectionReference stu2022 = FirebaseFirestore.instance.collection('2022');
  var nn = Student2020.studentList20.length;
  // var nm = Student2021.studentList21..length;
  // var nk = Student2022.studentList22.length;

  @override
  Widget build(BuildContext context) {
      //print('wwwwwwwwwwwwwwwwww${Student2020.studentList20.length}');
      // print('wwwwwwwwwwwwwwwwww$nm');
      // print('wwwwwwwwwwwwwwwwww$nk');
     
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                context: context,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: SingleChildScrollView(child: AddNoteForm()),
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Color(0xff006D84),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(
                //   kLogo,
                //   height: 50,
                // ),
                Text('Teacher and Student'),
              ],
            )),
        body: Column(children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: DChartBar(
              data: const [
                {
                  'id': 'Bar',
                  'data': [
                    {'domain': '2020', 'measure': 5},
                    {'domain': '2021', 'measure': 3},
                    {'domain': '2022', 'measure': 3},
                    // {'domain': '2023', 'measure': 15},
                  ],
                },
              ],
              barValueColor: Colors.white, //
              borderColor: Colors.white, //
              domainLabelColor: Colors.white,
              domainAxisTitleColor: Colors.white, //
              measureAxisTitleColor: Colors.white, //
              measureLabelColor: Colors.white,
              domainLabelPaddingToAxisLine: 6,
              axisLineTick: 1,
              axisLinePointTick: 1,
              //axisLinePointWidth: 10,
              axisLineColor: Colors.white,
              measureLabelPaddingToAxisLine: 14,
              barColor: (barData, index, id) => Colors.white,
              showBarValue: true,
            ),
          ),
          Divider(),
          SizedBox(
            height: 60,
            child: TabBar(
              indicatorColor: Colors.grey.shade100,
              isScrollable: true,
              labelStyle: TextStyle(letterSpacing: .5),
              tabs: [
                Text('2020'),
                Text('2021'),
                Text('2022'),
                //  Text('2023'),
              ],
            ),
          ),
          Flexible(
            child: TabBarView(children: [
              Student2020(),
              Student2021(),
              Student2022(),

              // ListView.builder(
              //   padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
              //   itemCount: 4,
              //   itemBuilder: (context, index) {
              //     return ItemStudent();
              //   },
              // ),
            ]),
          )
        ]),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  AddNoteForm({
    super.key,
  });
  String? name, grade, year;
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> fromKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController namecon = TextEditingController();
  TextEditingController gradecon = TextEditingController();
  TextEditingController yearcon = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference stu2020 = FirebaseFirestore.instance.collection('2020');
  CollectionReference stu2021 = FirebaseFirestore.instance.collection('2021');
  CollectionReference stu2022 = FirebaseFirestore.instance.collection('2022');
  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        //padding:const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextFormFeild(
            controller: namecon,
            hientText: 'Name',
            onSaved: (value) {
              setState(() {
                widget.name = value;
              });
            },
            onSubmitted: (d) {
              stu2020.add({
                'name': d,
                'grade': d,
                'year': d,
              });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormFeild(
            controller: gradecon,
            hientText: 'Grade',
            onSaved: (value) {
              setState(() {
                widget.grade = value;
              });
            },
            onSubmitted: (d) {
              stu2020.add({
                'name': d,
                'grade': d,
                'year': d,
              });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          // CustomTextFormFeild(
          //   controller: yearcon,
          //   hientText: 'year',
          //   onSaved: (value) {
          //     setState(() {
          //       widget.year = value;
          //     });
          //   },
          //   onSubmitted: (d) {
          //     stu2020.add({
          //       'name': d,
          //       'grade': d,
          //       'year': d,
          //     });
          //     setState(() {});
          //   },
          // ),
          const SizedBox(
            height: 32,
          ),
          CustomButtom(
            // isLoading: state is AddNoteLoading ? true : false,
            onTap: () {
              if (fromKey.currentState!.validate()) {
                fromKey.currentState!.save();

                stu2020.add({
                  'name': namecon.text,
                  'grade': gradecon.text,
                  'year': '2020',///yearcon.text,
                });
                Navigator.pop(context);
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
            text: 'Add',
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
