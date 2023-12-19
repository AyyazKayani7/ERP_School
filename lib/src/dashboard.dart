import 'package:erp_school/src/utilities/asset_images.dart';
import 'package:erp_school/src/widgets/addText.dart';
import 'package:flutter/material.dart';

import 'utilities/colors.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            //color: Colors.amber
            gradient: LinearGradient(
                colors: [AppColors.appGradient1, AppColors.appGradient2]),
          ),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.35,
                //flex: 4,
                child: Stack(
                  children: [
                    Positioned(
                      top: height * 0.20,
                      child: Container(
                        width: width * 0.97,
                        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    AssetImages.starPatternDashboard))),
                        child: Image.asset(AssetImages.starPatternDashboard),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.5,
                      width: width * 0.9,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.085,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AddText(
                                      height: 40,
                                      data: 'Hi Akshay',
                                      color: Colors.white,
                                      textSize: 30,
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: [
                                        AddText(
                                          data: 'Class XI-B',
                                          color: const Color.fromARGB(
                                              255, 197, 197, 197),
                                          textSize: 18,
                                        ),
                                        AddText(
                                          data: ' | Roll No: 04',
                                          color: const Color.fromARGB(
                                              255, 197, 197, 197),
                                          textSize: 18,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      height: 25,
                                      width: 110,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Colors.white),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            children: [
                                              AddText(
                                                data: '2020',
                                              ),
                                              AddText(
                                                data: '-2021',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(child: Container()),
                                Container(
                                  height: 65,
                                  width: 65,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100),
                                      )),
                                  child: Center(
                                    child: Container(
                                      // padding: const EdgeInsets.all(10),
                                      height: 61,
                                      width: 61,
                                      decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(100),
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   flex: 7,
              //child:
              Container(
                width: width,
                height: height * 0.6,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  children: [
                    Positioned(
                      bottom: height * 0.25,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: width * 0.45,
                              height: height * 0.25,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.amber),
                              ),
                            ),
                            // SizedBox(
                            //   width: 20,
                            // ),
                            Container(
                              width: width * 0.45,
                              height: height * 0.25,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.amber),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //)
            ],
          ),
        ),
      ),
    );
  }
}
