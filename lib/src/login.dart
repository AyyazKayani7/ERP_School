import 'package:erp_school/src/provider/passwordVisibilityProvider.dart';
import 'package:erp_school/src/stackCheck.dart';
import 'package:erp_school/src/utilities/asset_images.dart';
import 'package:erp_school/src/utilities/colors.dart';
import 'package:erp_school/src/widgets/TextFieldPassword.dart';
import 'package:erp_school/src/widgets/addText.dart';
import 'package:erp_school/src/widgets/buttonSuffixIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final bool _obsecure = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height,
              width: width,
              decoration: const BoxDecoration(
                //color: Colors.amber
                gradient: LinearGradient(
                    colors: [AppColors.appGradient1, AppColors.appGradient2]),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        const SizedBox(
                          //height: MySize.size76,   Giving Error: Field 'size100' has not been initialized.
                          height: 46,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              AssetImages.loginScreenDesign,
                              height: 150,
                              width: width * 0.8,
                            ),
                            const SizedBox(
                              width: 16.27,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AddText(
                              marginLeft: 30,
                              //fontFamily: 'San Francisco',
                              width: 170,
                              height: 40,
                              textWeight: FontWeight.bold,
                              data: 'Hi Student',
                              textSize: 34,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 5,
                              width: double.infinity,
                            ),
                            AddText(
                              marginLeft: 30,
                              width: 175,
                              data: 'Sign in to continue',
                              textSize: 20,
                              color: AppColors.greyMainText,
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60,
                            width: double.infinity,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.1),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: AddText(
                                width: 120,
                                height: 20,
                                data: 'Mobile Number/Email',
                                textSize: 12,
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.8,
                            child: TextField(
                              controller: email,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.1),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: AddText(
                                width: 55,
                                height: 20,
                                data: 'Password',
                                textSize: 12,
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                          Consumer<PasswordVisibilityProvider>(
                              builder: (context, value, child) {
                            return SizedBox(
                              width: width * 0.8,
                              child: TextFieldPassword(
                                //width: width * 0.8,
                                hintText: '',
                                obsecure: value.obsecure,
                                sufixIcon: GestureDetector(
                                  onTap: () {
                                    value.setObsecure(!value.obsecure);
                                  },
                                  child: value.obsecure
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                ),
                                controller: password,
                              ),
                            );
                          }),
                          const SizedBox(
                            height: 40,
                          ),
                          ButtonSuffixIcon(
                            height: 60,
                            width: width * 0.8,
                            data: 'SIGN IN',
                            iconWidthForTextCenter: 25,
                            buttonSuffixIcon: ColorFiltered(
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                                child: SvgPicture.asset(
                                    height: 17,
                                    width: 25,
                                    AssetImages.rightSignInArrow)),
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const StackCheck()),
                                  (context) => true);
                            },
                            gradientColor1: AppColors.appGradient2,
                            gradientColor2: AppColors.appGradient1,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: AddText(
                                    data: 'Forgot Password?',
                                    width: 130,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // // Container(
                  // //   height: height,
                  // //   decoration: const BoxDecoration(
                  // //     //color: Colors.amber
                  // //     gradient: LinearGradient(colors: [
                  // //       Color(0XFF7292CF),
                  // //       Color(0xFF2855ae),
                  // //     ]),
                  // //   ),
                  // //   child: Column(
                  // //     crossAxisAlignment: CrossAxisAlignment.start,
                  // //     children: [
                  // //       Padding(
                  // //         padding: const EdgeInsets.only(
                  // //             left: 64.13, top: 67.4, right: 16.27),
                  // //         child: Image.asset(AssetImages.loginScreenDesign),
                  // //       ),
                  // //       const SizedBox(
                  // //         height: 20,
                  // //         width: double.infinity,
                  // //       ),
                  // //       AddText(
                  // //         marginLeft: 30,
                  // //         fontFamily: 'San Francisco',
                  // //         width: 160,
                  // //         height: 40,
                  // //         data: 'Hi Student',
                  // //         textSize: 34,
                  // //         color: Colors.white,
                  // //       ),
                  // //       const SizedBox(
                  // //         height: 5,
                  // //         width: double.infinity,
                  // //       ),
                  // //       AddText(
                  // //         marginLeft: 30,
                  // //         width: 165,
                  // //         data: 'Sign in to continue',
                  // //         textSize: 20,
                  // //         color: Colors.white,
                  // //       ),
                  // //       Expanded(child: Container()),
                  // //       Container(
                  // //         width: double.infinity,
                  // //         height: height * 0.6,
                  // //         decoration: const BoxDecoration(
                  // //             color: Colors.white,
                  // //             borderRadius: BorderRadius.only(
                  // //                 topLeft: Radius.circular(50),
                  // //                 topRight: Radius.circular(50))),
                  // //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
