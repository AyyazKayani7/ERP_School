import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:erp_school/src/model/event&Program.dart';
import 'package:erp_school/src/model/fees.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';

import '../model/student.dart';

class StudentController {
  Future<List<EventProgram>> getEvents() async {
    List<EventProgram> elist = [];
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var snapshot = await FirebaseFirestore.instance.collection('Events').get();
    var m = snapshot.docs;
    //print(m.toString());
    for (var i = 0; i < snapshot.docs.length; i++) {
      var singleSnapshot = m[i];
      print(singleSnapshot.toString() + '----------');
      EventProgram e = EventProgram.fromJson(singleSnapshot.data());
      print(e.dateTime);
      print(e.eventName.toString());
      elist.add(e);
    }
    // Sort the elist based on dateTime
    elist.sort((a, b) => a.dateTime!.compareTo(b.dateTime!));
    return elist;
  }

  Future<List<Fees>> getFees() async {
    List<Fees> flist = [];
    String uid = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('Student')
        .doc(uid)
        .collection('FeesDue')
        .where('uid', isEqualTo: uid)
        .get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> ss = snapshot.docs;
    print(ss.length);
    //print(snapshot.size);

    for (int i = 0; i < ss.length; i++) {
      Fees f = Fees();
      Map<String, dynamic> m = ss[i].data();
      //print(m.toString());
      Fees ff = Fees.fromJson(m);
      //Map<String, dynamic> map=qds.data()!;
      // f.receiptNo = m['receiptNo'];
      // f.amount = m['amount'];
      //f.paymentDate = m['paymentDate'];
      //f.payMode = m['payMode'];
      //f.status = m['status'];
      flist.add(ff);
    }
// Sort the elist based on dateTime
    // flist.sort((a, b) => a.paymentDate!.compareTo(b.paymentDate!));
    flist.sort((a, b) => b.paymentDate!.compareTo(a.paymentDate!));
    print(flist.toList().toString());

    return flist;
  }

  Future<Student> getStudent() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('Student').doc(uid).get();

    Map<String, dynamic> data = snapshot.data()!;
    //print(data);
    Student s = Student.setValues(
      name: data['name'] ?? '',
      className: data['className'] ?? '',
      rollNo: data['rollNo'] ?? '',
      adharNo: data['adharNo'] ?? '',
      academicYear: data['academicYear'] ?? '',
      adClass: data['adClass'] ?? '',
      oldAdNo: data['oldAdNo'] ?? '',
      parentMail: data['parentMail'] ?? '',
      motherName: data['motherName'] ?? '',
      fatherName: data['fatherName'] ?? '',
      permanentAddress: data['permanentAddress'] ?? '',
      profileImg: data['profileImg'] ?? '',
      // doa: DateTime.fromMillisecondsSinceEpoch(data['doa']),
      // dob: DateTime.parse(data['dob']),
    );
    //print(s.name);
    return s;
  }
}
