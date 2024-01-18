import 'package:erp_school/src/utilities/asset_images.dart';
import 'package:erp_school/src/widgets/addText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'utilities/colors.dart';
import 'utilities/mySize.dart';

class SchoolGallery extends StatefulWidget {
  const SchoolGallery({super.key});

  @override
  State<SchoolGallery> createState() => _SchoolGalleryState();
}

class _SchoolGalleryState extends State<SchoolGallery> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final List<int> _itemLengths =
        List.generate(20, (index) => (index % 4 + 1) * 100);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
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
                            data: 'School Gallery',
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
          Padding(
            padding: EdgeInsets.only(
              top: MySize.size150,
            ),
            child: Container(
              decoration: const BoxDecoration(
                //color: Colors.amber
                gradient: LinearGradient(
                  colors: [AppColors.appGradient1, AppColors.appGradient2],
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MySize.size15,
                      right: MySize.size15,
                      top: MySize.size5),
                  child: StaggeredGridView.builder(
                    gridDelegate:
                        SliverStaggeredGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: MySize.size15,
                      crossAxisSpacing: MySize.size15,
                      staggeredTileBuilder: (int index) => StaggeredTile.extent(
                          2, _itemLengths[index].toDouble()),
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        height: _itemLengths[index].toDouble(),
                        child: Center(
                          child: Text(
                            'Item $index',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                    itemCount: _itemLengths.length,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      //  Column(
      //   children: [
      //     Container(
      //       height: MySize.size150,
      //       width: width,
      //       decoration: const BoxDecoration(
      //         //color: Colors.amber
      //         gradient: LinearGradient(
      //             colors: [AppColors.appGradient1, AppColors.appGradient2]),
      //       ),
      //       child: Container(
      //         height: MySize.size150,
      //         width: width,
      //         decoration: const BoxDecoration(
      //           //color: Colors.amber
      //           gradient: LinearGradient(
      //               colors: [AppColors.appGradient1, AppColors.appGradient2]),
      //         ),
      //         child: Stack(
      //           children: [
      //             Padding(
      //               padding:
      //                   EdgeInsets.only(left: width * 0.1, top: height * 0.1),
      //               child: Image.asset(
      //                   height: height * 0.2,
      //                   width: width * 0.8,
      //                   AssetImages.starPatternDashboard),
      //             ),
      //             Container(
      //               margin: EdgeInsets.symmetric(horizontal: width * 0.05
      //                   //MySize.size18
      //                   ),
      //               width: width * 0.9, //MySize.size360,
      //               child: GestureDetector(
      //                 onTap: () {
      //                   Navigator.pop(context);
      //                 },
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Image.asset(
      //                         width: MySize.size12,
      //                         height: MySize.size20,
      //                         AssetImages.backIconWhite),
      //                     const SizedBox(
      //                       width: 15,
      //                     ),
      //                     AddText(
      //                       data: 'School Gallery',
      //                       color: Colors.white,
      //                       textSize: MySize.size20,
      //                     ),
      //                     Expanded(child: Container()),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       child: Container(
      //         decoration: const BoxDecoration(
      //           //color: Colors.amber
      //           gradient: LinearGradient(
      //             colors: [AppColors.appGradient1, AppColors.appGradient2],
      //           ),
      //         ),
      //         child: Container(
      //           height: height,
      //           width: width,
      //           //color: Colors.green,
      //           decoration: const BoxDecoration(
      //             color: Colors.white,
      //             borderRadius: BorderRadius.only(
      //                 topLeft: Radius.circular(30),
      //                 topRight: Radius.circular(30)),
      //           ),
      //           child: Padding(
      //             padding: EdgeInsets.symmetric(horizontal: MySize.size15),
      //             child: Column(
      //               children: [
      //                 SizedBox(
      //                   height: MySize.size15,
      //                 ),
      //                 // StaggeredGrid.count(crossAxisCount: 2,

      //                 // )
      //                 // MasonryGridView.builder(
      //                 //   itemCount: 6,
      //                 //   gridDelegate:
      //                 //       SliverSimpleGridDelegateWithFixedCrossAxisCount(
      //                 //           crossAxisCount: 2),
      //                 //   itemBuilder: (context, index) => Padding(
      //                 //     padding:
      //                 //         EdgeInsets.symmetric(horizontal: MySize.size15),
      //                 //     child: Container(
      //                 //       height: 20,
      //                 //       width: 20,
      //                 //       color: Colors.blue,
      //                 //     ),
      //                 //   ),
      //                 // ),

      //                 //                     MasonryGridView.count(
      //                 //                       crossAxisCount: 4,
      //                 //                       mainAxisSpacing: 4,
      //                 //                       crossAxisSpacing: 4,
      //                 //                       itemBuilder: (context, index) {
      //                 //   return ListView(
      //                 //     shrinkWrap: true,
      //                 //     children: [Text("A")],
      //                 //   );
      //                 // },
      //                 //                     )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
