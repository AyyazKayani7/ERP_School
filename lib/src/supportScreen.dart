import 'package:flutter/material.dart';

import 'utilities/asset_images.dart';
import 'utilities/colors.dart';
import 'utilities/mySize.dart';
import 'widgets/addText.dart';

class SupportSreen extends StatefulWidget {
  const SupportSreen({super.key});

  @override
  State<SupportSreen> createState() => _SupportSreenState();
}

class _SupportSreenState extends State<SupportSreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
            child: Container(
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
                            data: 'Support',
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
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                //color: Colors.amber
                gradient: LinearGradient(
                  colors: [AppColors.appGradient1, AppColors.appGradient2],
                ),
              ),
              child: Container(
                height: height,
                width: width,
                //color: Colors.green,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MySize.size130,
                    ),
                    Image.asset(
                      AssetImages.supportIcon,
                      height: MySize.size172,
                      width: MySize.size172,
                    ),
                    SizedBox(
                      height: MySize.size40,
                    ),
                    AddText(
                      data: 'Get Support',
                      textSize: 24,
                      textWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: MySize.size30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: AddText(
                        data:
                            'For any support request regards your orders or deliveries please feel free to speak with us at below.',
                        textSize: 16,
                        color: AppColors.greyTextColor,
                        textWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: MySize.size80,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: AddText(
                        data: 'Call us - +91 7838XXXXXX',
                        textSize: 16,
                        textWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: AddText(
                        data: 'Mail us - syalfreelance@gmail.com',
                        textSize: 16,
                        textWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
