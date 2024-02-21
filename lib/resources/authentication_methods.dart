import 'package:amazon/model/user_details_model.dart';
import 'package:amazon/resources/cloudfirestore_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CloudfirestoreClass cloudfirestoreClass = CloudfirestoreClass();

Future<String> signUpUser(

  {required String name,
   required String address,
  required String email,
    required String password}) async{
  name.trim();
  address.trim();
  email.trim();
  password.trim();
  String output = "oops! an error occurred";
  if (name!= "" && address!= "" && email!= "" &&password!= ""){
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
        UserDetailsModel user = UserDetailsModel(name: name, address: address);
        await cloudfirestoreClass.uploadNameAndAddressToDatabase(
         user: user);
      output = "success";
    } on FirebaseAuthException catch (e) {
      output = e.message.toString();
    }
  
  } else {
    output = "please fill up all the fields";
  }
  return output;
}

Future<String> signInUser(

  {
  required String email,
    required String password}) async{
 
  email.trim();
  password.trim();
  String output = "oops! an error occurred";
  if (email != "" &&password != ""){
    try{
         await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
        output = "success";
    } on FirebaseAuthException catch (e) {
      output = e.message.toString();
    } 
  } else {
    output = "please fill up all the fields";
  }
  return output;
}
}