import 'package:erp_school/src/provider/changePasswordVisibilityProvider.dart';
import 'package:erp_school/src/utilities/mySize.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'utilities/asset_images.dart';
import 'utilities/colors.dart';
import 'widgets/addButton.dart';
import 'widgets/addText.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  void changePassword(
      String email, String oldPassword, String newPassword) async {
    //   FirebaseFirestore firebase=FirebaseFirestore.instance;
    // DocumentReference documentReference =
    //   firebase.collection('User').doc(email);
    FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = FirebaseAuth.instance.currentUser;
    AuthCredential cred =
        EmailAuthProvider.credential(email: email, password: oldPassword);
    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      // if(currentUser.)
      currentUser.updatePassword(newPassword);
      Fluttertoast.showToast(msg: 'Password Updated');
    }).catchError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController retypeNewPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // oldPassword.text = '--';
    // newPassword.text = '--';
    // retypeNewPassword.text = '--';

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: MySize.size150,
            width: width,
            decoration: const BoxDecoration(
              //color: Colors.amber
              gradient: LinearGradient(
                  colors: [AppColors.appGradient1, AppColors.appGradient2]),
            ),
            child: Stack(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.1, top: height * 0.1),
                  child: Image.asset(
                      height: height * 0.2,
                      width: width * 0.8,
                      AssetImages.starPatternDashboard),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05
                      //MySize.size18
                      ),
                  width: width * 0.9, //MySize.size360,

                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Future.delayed(const Duration(seconds: 1), () {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            width: MySize.size12,
                            height: MySize.size20,
                            AssetImages.backIconWhite),
                        const SizedBox(
                          width: 15,
                        ),
                        AddText(
                          data: 'Change Password',
                          color: Colors.white,
                          textSize: MySize.size20,
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  //color: Colors.amber
                  gradient: LinearGradient(colors: [
                AppColors.appGradient1,
                AppColors.appGradient2
              ])),
              child: Container(
                width: width,
                //color: Colors.green,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.0575),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        child: Consumer<ChangePasswordVisibilityProvider>(
                          builder: (context, value, child) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              AddText(
                                data: 'Old Password',
                                textSize: 12,
                                textWeight: FontWeight.w400,
                                color: AppColors.greyTextColor,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextField(
                                controller: oldPassword,
                                obscureText: value.obsecureOld,
                                decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                  onTap: () {
                                    value.setObsecureOld(!value.obsecureOld);
                                  },
                                  child: value.obsecureOld
                                      ? Icon(Icons.visibility_off_outlined)
                                      : Icon(Icons.visibility_outlined),
                                )),
                              ),
                              // const SizedBox(
                              //   height: 15,
                              // ),
                              // const Divider(
                              //   height: 1,
                              //   color: AppColors.greyTextColor,
                              // ),
                              const SizedBox(
                                height: 25,
                              ),
                              AddText(
                                data: 'New Password',
                                textSize: 12,
                                textWeight: FontWeight.w400,
                                color: AppColors.greyTextColor,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextField(
                                controller: newPassword,
                                obscureText: value.obsecureNew,
                                decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                  onTap: () {
                                    value.setObsecureNew(!value.obsecureNew);
                                  },
                                  child: value.obsecureNew
                                      ? Icon(Icons.visibility_off_outlined)
                                      : Icon(Icons.visibility_outlined),
                                )),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              AddText(
                                data: 'Retype Password',
                                textSize: 12,
                                textWeight: FontWeight.w400,
                                color: AppColors.greyTextColor,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextField(
                                controller: retypeNewPassword,
                                obscureText: value.obsecureRe,
                                decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                  onTap: () {
                                    value.setObsecureRe(!value.obsecureRe);
                                  },
                                  child: value.obsecureRe
                                      ? Icon(Icons.visibility_off_outlined)
                                      : Icon(Icons.visibility_outlined),
                                )),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              AddButton(
                                width: width,
                                gradientColor1: AppColors.appGradient2,
                                gradientColor2: AppColors.appGradient1,
                                height: 50,
                                data: 'Change Password',
                                textWeight: FontWeight.w600,
                                onTap: () {
                                  if (newPassword.text ==
                                      retypeNewPassword.text) {
                                    changePassword(
                                        FirebaseAuth
                                            .instance.currentUser!.email!,
                                        oldPassword.text,
                                        newPassword.text);
                                  } else {
                                    // SnackBar(
                                    //     content: Text(
                                    //         'Please enter same password in New Password and Retype Password'));
                                    Fluttertoast.showToast(
                                        msg:
                                            'Please enter same password in New Password and Retype Password');
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset(AssetImages.lowerBackGroundPercentageScreen),
          )
        ],
      ),
    );
  }
}
