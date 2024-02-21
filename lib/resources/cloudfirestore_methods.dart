import 'package:amazon/model/user_details_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudfirestoreClass {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future uploadNameAndAddressToDatabase(
    {required UserDetailsModel user}) async {
      await firebaseFirestore
      .collection("users")
      .doc(firebaseAuth.currentUser!.uid)
      .set(user.getJson());
    }
}