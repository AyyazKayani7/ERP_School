import 'package:erp_school/src/model/student.dart';
import 'package:erp_school/src/provider/profileProvider.dart';
import 'package:erp_school/src/utilities/asset_images.dart';
import 'package:erp_school/src/utilities/mySize.dart';
import 'package:erp_school/src/widgets/addText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'utilities/colors.dart';
import 'widgets/addButton.dart';

class Profile extends StatefulWidget {
  Student s;
  Profile({super.key, required this.s});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);

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

                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: MySize.size18
                //       // left: width * 0.05,
                //       // right: width * 0.05,
                //       // top: MySize.size20,
                //       ),
                //   child:
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05
                      //MySize.size18
                      ),
                  width: width * 0.9, //MySize.size360,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Image.asset(
                                  width: MySize.size12,
                                  height: MySize.size20,
                                  AssetImages.backIconWhite),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            AddText(
                              data: 'My Profile',
                              color: Colors.white,
                              textSize: MySize.size20,
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        height: MySize.size28,
                        width: MySize.size84,
                        decoration: const BoxDecoration(
                            //border: Border.all(width: 1),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                width: MySize.size12,
                                height: MySize.size20,
                                AssetImages.checkedIcon),
                            const SizedBox(
                              width: 5,
                            ),
                            AddText(
                              data: 'Done',
                              color: AppColors.purpleBlue,
                              textSize: 13,
                              textWeight: FontWeight.w700,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              decoration: const BoxDecoration(
                //color: Colors.amber
                gradient: LinearGradient(
                    colors: [AppColors.appGradient1, AppColors.appGradient2]),
              ),
              child: Container(
                width: width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //// Student Name & Image
                      Container(
                        margin: EdgeInsets.all(
                          MySize.size18,
                        ),
                        padding: EdgeInsets.all(MySize.size15),
                        height: MySize.size100,
                        width: width * 0.9, //MySize.size340,

                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColors.blueBorder,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Consumer<ProfileProvider>(
                              builder: (context, value, child) => Container(
                                height: MySize.size75,
                                width: MySize.size75,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: widget.s.profileImg != null
                                    ? Image.network(
                                        widget.s.profileImg!,
                                        //profileProvider.imgLink,
                                        fit: BoxFit.fill,
                                      )
                                    // value.profileImage != null
                                    //     ? Image.file(
                                    //         value.profileImage!,
                                    //         fit: BoxFit.cover,
                                    //       )
                                    : Container(
                                        color: AppColors.greyShade,
                                      ),
                              ),
                            ),
                            SizedBox(
                              width: MySize.size10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AddText(
                                  // data: 'Akshay Syal',
                                  data: widget.s.name!,
                                  textSize: MySize.size20,
                                  textWeight: FontWeight.w700,
                                ),
                                SizedBox(
                                  height: MySize.size10,
                                ),
                                Row(
                                  children: [
                                    AddText(
                                      //data: 'Class VI-B ',
                                      data: 'Class ${widget.s.className} ',
                                      color: AppColors.grey1,
                                      textWeight: FontWeight.w400,
                                    ),
                                    Text(
                                      // '| Roll No: 04',
                                      '| Roll No: ${widget.s.rollNo}',
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: AppColors.grey1,
                                        fontWeight: FontWeight.w400,
                                        //overflow: TextOverflow.ellipsis
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    barrierDismissible: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Consumer<ProfileProvider>(
                                        builder: (context, value, child) =>
                                            AlertDialog(
                                          //backgroundColor: AppColors.themeColor,
                                          title: AddText(
                                            height: 30,
                                            textWeight: FontWeight.bold,
                                            data: 'Select Image Source...',
                                            textSize: 22,
                                          ),
                                          actions: [
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: AddButton(
                                                gradientColor1:
                                                    AppColors.themeColor,
                                                gradientColor2:
                                                    AppColors.themeColor,
                                                data: 'Camera',
                                                onTap: value.isImageLoading
                                                    ? () {}
                                                    : () {
                                                        // value.setIsImageLoading(true);
                                                        // debugPrint(
                                                        //     'image status::::${value.isImageLoading.toString()} ');
                                                        value.pickImage(
                                                            ImageSource.camera,
                                                            context);
                                                        // value.setIsImageLoading(false);
                                                        // debugPrint(
                                                        //     'image status::::${value.isImageLoading.toString()} ');
                                                        Navigator.pop(context);
                                                      },
                                                color: AppColors.themeColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: AddButton(
                                                gradientColor1:
                                                    AppColors.themeColor,
                                                gradientColor2:
                                                    AppColors.themeColor,
                                                data: 'Gallery',
                                                onTap: () {
                                                  value.pickImage(
                                                      ImageSource.gallery,
                                                      context);
                                                  Navigator.pop(context);
                                                },
                                                color:
                                                    Color(AppColors.colorTheme),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: ColorFiltered(
                                colorFilter: const ColorFilter.mode(
                                    AppColors.grey7777, BlendMode.srcIn),
                                child: SvgPicture.asset(AssetImages.cameraIcon),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //// Student Profile Details
                      //// Row 1 Container
                      Container(
                        margin: EdgeInsets.only(
                            left: width * 0.05,
                            right: width * 0.05,
                            top: MySize.size18,
                            bottom: MySize.size12),
                        //padding: EdgeInsets.all(MySize.size15),
                        width: width * 0.9, //MySize.size340, //
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AddText(
                                  data: 'Adhar No',
                                  color: AppColors.grey1,
                                  textSize: MySize.size12,
                                  textWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: MySize.size8,
                                ),
                                AddText(
                                  data: widget.s.adharNo!,
                                  textSize: MySize.size16,
                                  textWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: MySize.size15,
                                ),
                                SizedBox(
                                  width: width * 0.43, //MySize.size160,
                                  child: const Divider(
                                    thickness: 1,
                                    color: AppColors.greyDivider,
                                  ),
                                )
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AddText(
                                  data: 'Academic Year',
                                  color: AppColors.grey1,
                                  textSize: MySize.size12,
                                  textWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: MySize.size8,
                                ),
                                AddText(
                                  data: widget.s.academicYear!,
                                  textSize: MySize.size16,
                                  textWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: MySize.size15,
                                ),
                                SizedBox(
                                  width: width * 0.43, //MySize.size160,
                                  child: const Divider(
                                    thickness: 1,
                                    color: AppColors.greyDivider,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      //// Row 2 Container
                      Container(
                        margin: EdgeInsets.only(
                            left: width * 0.05,
                            right: width * 0.05,
                            top: MySize.size18,
                            bottom: MySize.size12),
                        //padding: EdgeInsets.all(MySize.size15),
                        width: width * 0.9, //MySize.size340, ,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AddText(
                                  data: 'Admision Class',
                                  color: AppColors.grey1,
                                  textSize: MySize.size12,
                                  textWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: MySize.size8,
                                ),
                                SizedBox(
                                  width: MySize.size160,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: AddText(
                                          data: widget.s.adClass!,
                                          textSize: MySize.size16,
                                          textWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Image.asset(
                                          width: MySize.size12,
                                          height: MySize.size16,
                                          AssetImages.lockIcon)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MySize.size15,
                                ),
                                SizedBox(
                                  width: width * 0.43,
                                  child: const Divider(
                                    thickness: 1,
                                    color: AppColors.greyDivider,
                                  ),
                                )
                              ],
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AddText(
                                  data: 'Old Admision No',
                                  color: AppColors.grey1,
                                  textSize: MySize.size12,
                                  textWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: MySize.size8,
                                ),
                                SizedBox(
                                  width: MySize.size160,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: AddText(
                                          data: widget.s.oldAdNo!,
                                          textSize: MySize.size16,
                                          textWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Image.asset(
                                          width: MySize.size12,
                                          height: MySize.size16,
                                          AssetImages.lockIcon)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MySize.size15,
                                ),
                                SizedBox(
                                  width: width * 0.43,
                                  child: const Divider(
                                    thickness: 1,
                                    color: AppColors.greyDivider,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ), //// Row 3 Container
                      //// Row 3 Container
                      Container(
                        margin: EdgeInsets.only(
                            left: width * 0.05,
                            right: width * 0.05,
                            top: MySize.size18,
                            bottom: MySize.size12),
                        //padding: EdgeInsets.all(MySize.size15),
                        width: width * 0.9, //MySize.size340, ,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AddText(
                                  data: 'Date of Admision',
                                  color: AppColors.grey1,
                                  textSize: MySize.size12,
                                  textWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: MySize.size8,
                                ),
                                SizedBox(
                                  width: MySize.size160,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: AddText(
                                          data: widget.s.doa.toString(),
                                          textSize: MySize.size16,
                                          textWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Image.asset(
                                          width: MySize.size12,
                                          height: MySize.size16,
                                          AssetImages.lockIcon)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MySize.size15,
                                ),
                                SizedBox(
                                  width: width * 0.43,
                                  child: const Divider(
                                    thickness: 1,
                                    color: AppColors.greyDivider,
                                  ),
                                )
                              ],
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AddText(
                                  data: 'Date of Birth',
                                  color: AppColors.grey1,
                                  textSize: MySize.size12,
                                  textWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: MySize.size8,
                                ),
                                SizedBox(
                                  width: MySize.size160,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: AddText(
                                          data: widget.s.dob.toString(),
                                          textSize: MySize.size16,
                                          textWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Image.asset(
                                          width: MySize.size12,
                                          height: MySize.size16,
                                          AssetImages.lockIcon)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MySize.size15,
                                ),
                                SizedBox(
                                  width: width * 0.43,
                                  child: const Divider(
                                    thickness: 1,
                                    color: AppColors.greyDivider,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ), //// Row 3 Container
                      //// Row 4 Container
                      Container(
                          margin: EdgeInsets.only(
                              left: width * 0.05,
                              right: width * 0.05,
                              top: MySize.size18,
                              bottom: MySize.size12),
                          //padding: EdgeInsets.all(MySize.size15),
                          width: width * 0.9,
                          child: Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AddText(
                                      data: 'Parent Mail ID',
                                      color: AppColors.grey1,
                                      textSize: MySize.size12,
                                      textWeight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      height: MySize.size15,
                                    ),
                                    SizedBox(
                                      width: width * 0.9,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AddText(
                                            data: widget.s.parentMail!,
                                            textSize: MySize.size16,
                                            textWeight: FontWeight.w600,
                                          ),
                                          Image.asset(
                                              height: 16,
                                              width: 12,
                                              AssetImages.lockIcon)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: MySize.size15,
                                    ),
                                    SizedBox(
                                      width: width * 0.9,
                                      child: const Divider(
                                        thickness: 1,
                                        color: AppColors.greyDivider,
                                      ),
                                    )
                                  ])
                            ],
                          )),
                      //// Row 5 Container
                      Container(
                          margin: EdgeInsets.only(
                              left: width * 0.05,
                              right: width * 0.05,
                              top: MySize.size18,
                              bottom: MySize.size12),
                          //padding: EdgeInsets.all(MySize.size15),
                          width: width * 0.9,
                          child: Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AddText(
                                      data: 'Mother Name',
                                      color: AppColors.grey1,
                                      textSize: MySize.size12,
                                      textWeight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      height: MySize.size15,
                                    ),
                                    SizedBox(
                                      width: width * 0.9,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AddText(
                                            data: widget.s.motherName!,
                                            textSize: MySize.size16,
                                            textWeight: FontWeight.w600,
                                          ),
                                          Image.asset(
                                              height: 16,
                                              width: 12,
                                              AssetImages.lockIcon)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: MySize.size15,
                                    ),
                                    SizedBox(
                                      width: width * 0.9,
                                      child: const Divider(
                                        thickness: 1,
                                        color: AppColors.greyDivider,
                                      ),
                                    )
                                  ])
                            ],
                          )),
                      ///// Row 6 Container
                      Container(
                          margin: EdgeInsets.only(
                              left: width * 0.05,
                              right: width * 0.05,
                              top: MySize.size18,
                              bottom: MySize.size12),
                          //padding: EdgeInsets.all(MySize.size15),
                          width: width * 0.9,
                          child: Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AddText(
                                      data: 'Father Name',
                                      color: AppColors.grey1,
                                      textSize: MySize.size12,
                                      textWeight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      height: MySize.size15,
                                    ),
                                    SizedBox(
                                      width: width * 0.9,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AddText(
                                            data: widget.s.fatherName!,
                                            textSize: MySize.size16,
                                            textWeight: FontWeight.w600,
                                          ),
                                          Image.asset(
                                              height: 16,
                                              width: 12,
                                              AssetImages.lockIcon)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: MySize.size15,
                                    ),
                                    SizedBox(
                                      width: width * 0.9,
                                      child: const Divider(
                                        thickness: 1,
                                        color: AppColors.greyDivider,
                                      ),
                                    )
                                  ])
                            ],
                          )),
                      //// Row 7 Container
                      Container(
                          margin: EdgeInsets.only(
                              left: width * 0.05,
                              right: width * 0.05,
                              top: MySize.size18,
                              bottom: MySize.size12),
                          //padding: EdgeInsets.all(MySize.size15),
                          width: width * 0.9,
                          child: Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AddText(
                                      data: 'Parmanent Add',
                                      color: AppColors.grey1,
                                      textSize: MySize.size12,
                                      textWeight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      height: MySize.size15,
                                    ),
                                    SizedBox(
                                      width: width * 0.9,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AddText(
                                            data: widget.s.permanentAddress!,
                                            textSize: MySize.size16,
                                            textWeight: FontWeight.w600,
                                          ),
                                          Image.asset(
                                              height: 16,
                                              width: 12,
                                              AssetImages.lockIcon)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: MySize.size15,
                                    ),
                                    SizedBox(
                                      width: width * 0.9,
                                      child: const Divider(
                                        thickness: 1,
                                        color: AppColors.greyDivider,
                                      ),
                                    )
                                  ])
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
