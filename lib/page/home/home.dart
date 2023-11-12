import 'package:dnc_test/Utils/custom_dialog.dart';
import 'package:dnc_test/Utils/shared_pref_utils.dart';
import 'package:dnc_test/Utils/utils.dart';
import 'package:dnc_test/api/auth.dart';
import 'package:dnc_test/components/highlight_text.dart';
import 'package:dnc_test/components/search_header.dart';
import 'package:dnc_test/model/response_data.dart';
import 'package:dnc_test/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart' as foundation;

class Home extends StatefulWidget {
  Function onTab;

  Home({Key? key, required this.onTab}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var navHeight = 0.0;

  User? myUser;

  @override
  void initState() {
    _initMyUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, ext) => [
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: false,
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Image.asset('assets/images/logo-blue.png'),
                      ),
                      IconButton(
                        icon: Image.asset('assets/images/list-icon.png', width: 20, height: 20, fit: BoxFit.contain),
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            floating: false,
            snap: false,
            expandedHeight: 160,
            collapsedHeight: 100,
            automaticallyImplyLeading: false,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                navHeight = constraints.biggest.height;
                print(navHeight);
                return SearchHeader(isExpanded: navHeight <= 140.0, onTab: widget.onTab);
              },
            ),
            actions: [
              Icon(
                Icons.search,
                size: 25,
                color: Colors.transparent,
              ),
            ],
          ),
        ],
        body: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Text(
                          '노는공간',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                        HighlightText(
                          topMargin: 5,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: BorderSide(width: 1, color: HexColor('#222222'))
                      ),
                      onPressed: () {
                        widget.onTab(1);
                      },
                      child: Text(
                        '더 많은 방 보러가기',
                        style: TextStyle(
                            color: HexColor('#222222'),
                            fontSize: 15
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.symmetric(vertical: 20),
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 10,
                  //   decoration: BoxDecoration(color: HexColor('#ededed'))
                  // ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 20),
                  //   margin: EdgeInsets.only(bottom: 20),
                  //   child: Row(
                  //     children: [
                  //       const Text(
                  //         '공간후기',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 23,
                  //         ),
                  //       ),
                  //       HighlightText(
                  //         topMargin: 5,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // interiorTradeReviews != null && interiorTradeReviews!.isNotEmpty ?
                  // Container(
                  //     child: CarouselSlider.builder(
                  //       options: CarouselOptions(
                  //         aspectRatio: 1.25,
                  //         viewportFraction: 0.9,
                  //         enableInfiniteScroll: false,
                  //       ),
                  //       itemCount: interiorTradeReviews != null ? (interiorTradeReviews!.length / 2).round() : 0,
                  //       itemBuilder: (BuildContext context, int index, int realIndex) {
                  //         final int first = index * 2;
                  //         final int second = first + 1;
                  //         return Row(
                  //           children: [first, second].map((idx) {
                  //             if (interiorTradeReviews!.length <= idx) {
                  //               return Expanded(
                  //                   flex: 1,
                  //                   child: Container()
                  //               );
                  //             }
                  //
                  //             TradeReview item = interiorTradeReviews![idx];
                  //
                  //             InteriorOffice? interiorOffice;
                  //             if (item.has_interior_join_offer != null
                  //                 && item.has_interior_join_offer!.has_interior_office != null) {
                  //               interiorOffice = item.has_interior_join_offer!.has_interior_office;
                  //             }
                  //
                  //             InteriorOffer? interiorOffer;
                  //             if (item.has_interior_join_offer != null
                  //                 && item.has_interior_join_offer!.has_interior_offer != null) {
                  //               interiorOffer = item.has_interior_join_offer!.has_interior_offer;
                  //             }
                  //
                  //             ImageProvider<Object> bgImage;
                  //             if (item.has_trade_review_files != null && item.has_trade_review_files!.isNotEmpty) {
                  //               bgImage = ExtendedNetworkImageProvider(
                  //                 // 'https://photo.tuchong.com/4870004/f/298584322.jpg',
                  //                 Utils.getImageFilePath(item.has_trade_review_files!.first.has_file!),
                  //               );
                  //             } else {
                  //               bgImage = const AssetImage('assets/images/no-image.png');
                  //             }
                  //
                  //             Widget? companyThumbnail;
                  //             if (interiorOffice != null
                  //                 && interiorOffice.has_thumbnail != null) {
                  //               companyThumbnail = ExtendedImage.network(
                  //                   Utils.getImageFilePath(interiorOffice.has_thumbnail!),
                  //               );
                  //             } else {
                  //               companyThumbnail = Image.asset('assets/images/no-image.png');
                  //             }
                  //
                  //             return Expanded(
                  //               flex: 1,
                  //               child: Container(
                  //                 margin: EdgeInsets.symmetric(horizontal: 5),
                  //                 child: Column(
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     TextButton(
                  //                       onPressed: () {
                  //                         Navigator.pushNamed(
                  //                           context,
                  //                           '/interior/review/show',
                  //                           arguments: {
                  //                             'id': item.id,
                  //                           },
                  //                         );
                  //                       },
                  //                       style: TextButton.styleFrom(
                  //                         minimumSize: Size.zero,
                  //                         padding: EdgeInsets.zero,
                  //                         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //                       ),
                  //                       child: Column(
                  //                         crossAxisAlignment: CrossAxisAlignment.start,
                  //                         children: [
                  //                           Container(
                  //                             margin: EdgeInsets.only(bottom: 10),
                  //                             child: LayoutBuilder(builder: (context, constraints) {
                  //                               return AspectRatio(
                  //                                 aspectRatio: 484/576,
                  //                                 child: Container(
                  //                                   padding: EdgeInsets.all(10),
                  //                                   width: constraints.biggest.width,
                  //                                   height: constraints.biggest.height,
                  //                                   decoration: BoxDecoration(
                  //                                     image: DecorationImage(
                  //                                       image: bgImage,
                  //                                       fit: BoxFit.cover,
                  //                                     ),
                  //                                     borderRadius: BorderRadius.circular(5),
                  //                                   ),
                  //                                   child: Container(),
                  //                                 ),
                  //                               );
                  //                             }),
                  //                           ),
                  //                           Container(
                  //                             margin: const EdgeInsets.only(bottom: 5),
                  //                             height: 16,
                  //                             child: Text(
                  //                               interiorOffer != null ? interiorOffer.address : '',
                  //                               overflow: TextOverflow.ellipsis,
                  //                               textAlign: TextAlign.left,
                  //                               style: TextStyle(
                  //                                 fontSize: 13.0,
                  //                                 color: HexColor('#222222'),
                  //                                 fontWeight: FontWeight.bold,
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           Container(
                  //                             margin: const EdgeInsets.only(bottom: 7),
                  //                             height: 16,
                  //                             child: Text(
                  //                               interiorOffer != null ? interiorOffer.address_detail : '',
                  //                               overflow: TextOverflow.ellipsis,
                  //                               textAlign: TextAlign.left,
                  //                               style: TextStyle(
                  //                                 fontSize: 12.0,
                  //                                 color: HexColor('#7ca3aa'),
                  //                                 fontWeight: FontWeight.bold,
                  //                               ),
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                     Container(
                  //                       margin: const EdgeInsets.only(bottom: 7),
                  //                       width: MediaQuery.of(context).size.width,
                  //                       height: 1,
                  //                       decoration: BoxDecoration(color: HexColor('#ededed'))
                  //                     ),
                  //                     interiorOffice != null ?
                  //                       TextButton(
                  //                         onPressed: () {
                  //                           Navigator.pushNamed(
                  //                             context,
                  //                             '/interior/company/show',
                  //                             arguments: {
                  //                               'id': interiorOffice!.id,
                  //                             },
                  //                           );
                  //                         },
                  //                         child: Container(
                  //                           padding: const EdgeInsets.only(bottom: 5),
                  //                           child: Row(
                  //                             mainAxisAlignment: MainAxisAlignment.start,
                  //                             children: [
                  //                               Container(
                  //                                 margin: const EdgeInsets.only(right: 8),
                  //                                 child: ClipRRect(
                  //                                   borderRadius: BorderRadius.circular(50),
                  //                                   child: SizedBox(
                  //                                     width: 30,
                  //                                     height: 30,
                  //                                     child: companyThumbnail,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                               Expanded(
                  //                                 flex: 1,
                  //                                 child: Container(
                  //                                   child: Column(
                  //                                     mainAxisAlignment: MainAxisAlignment.start,
                  //                                     crossAxisAlignment: CrossAxisAlignment.start,
                  //                                     children: [
                  //                                       Container(
                  //                                         padding: EdgeInsets.only(bottom: 1),
                  //                                         child: Text(
                  //                                           interiorOffice.title,
                  //                                           overflow: TextOverflow.ellipsis,
                  //                                           textAlign: TextAlign.start,
                  //                                           style: TextStyle(
                  //                                             fontSize: 13,
                  //                                             fontWeight: FontWeight.w500,
                  //                                             color: HexColor('#404040'),
                  //                                           ),
                  //                                         ),
                  //                                       ),
                  //                                       Text(
                  //                                         interiorOffice.explanation,
                  //                                         overflow: TextOverflow.ellipsis,
                  //                                         textAlign: TextAlign.start,
                  //                                         style: TextStyle(
                  //                                           fontSize: 11,
                  //                                           fontWeight: FontWeight.w400,
                  //                                           color: HexColor('#404040'),
                  //                                         ),
                  //                                       ),
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                         style: TextButton.styleFrom(
                  //                           minimumSize: Size.zero,
                  //                           padding: EdgeInsets.zero,
                  //                           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //                         ),
                  //                       )
                  //                       :
                  //                       Container(),
                  //                   ],
                  //                 ),
                  //               ),
                  //             );
                  //           }).toList(),
                  //         );
                  //       },
                  //     )
                  // )
                  // :
                  // Container(
                  //   margin: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Text(
                  //     interiorTradeReviews != null ? '아직 등록된 리뷰가 없습니다.' : '불러오는 중입니다.',
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 14,
                  //     ),
                  //   ),
                  // ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 10,
                      decoration: BoxDecoration(color: HexColor('#ededed'))
                  ),
                  // Container(
                  //   padding: EdgeInsets.only(left: 20, right: 20),
                  //   margin: EdgeInsets.only(bottom: 20),
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         '홍보영상',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 23,
                  //         ),
                  //       ),
                  //       HighlightText(
                  //         topMargin: 5,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // marketingVideos != null && marketingVideos!.isNotEmpty ?
                  //   Container(
                  //     margin: EdgeInsets.only(bottom: 40),
                  //     child: CarouselSlider.builder(
                  //       options: CarouselOptions(
                  //         viewportFraction: 747/1125,
                  //         aspectRatio: 1125/415,
                  //         enableInfiniteScroll: false,
                  //       ),
                  //       itemCount: marketingVideoControllers.length,
                  //       itemBuilder: (BuildContext context, int index, int realIndex) {
                  //         VideoPlayerController controller = marketingVideoControllers[index];
                  //
                  //         return FractionallySizedBox(
                  //           widthFactor: 1,
                  //           heightFactor: 1,
                  //           child: TextButton(
                  //             onPressed: () {
                  //               setState(() {
                  //                 controller.value.isPlaying
                  //                     ? controller.pause()
                  //                     : controller.play();
                  //               });
                  //             },
                  //             style: TextButton.styleFrom(
                  //               minimumSize: Size.zero,
                  //               padding: EdgeInsets.zero,
                  //               tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //             ),
                  //             child: Container(
                  //               margin: EdgeInsets.symmetric(horizontal: 0),
                  //               // child: Image.asset(promotionalVideoItems[index].imageUrl, fit: BoxFit.cover),
                  //               child: Stack(
                  //                 children: [
                  //                   VideoPlayer(controller),
                  //                   !controller.value.isPlaying ?
                  //                     Positioned(
                  //                       child: Opacity(
                  //                         opacity: .5,
                  //                         child: Container(
                  //                           color: HexColor('#000000'),
                  //                         ),
                  //                       ),
                  //                     )
                  //                     :
                  //                     Container(),
                  //                   !controller.value.isPlaying ?
                  //                     Positioned(
                  //                       child: Container(
                  //                         child: Center(
                  //                           child: Icon(
                  //                             controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  //                             size: 25,
                  //                             color: Colors.white,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     )
                  //                     :
                  //                     Container(),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //     )
                  //   )
                  //   :
                  //   Container(
                  //     margin: EdgeInsets.only(left: 20, right: 20, bottom: 40),
                  //     child: Text(
                  //       marketingVideos != null ? '아직 등록된 홍보영상이 없습니다.' : '불러오는 중입니다.',
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 14,
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            )
        ),
      ),
    );
  }

  _clickTab() {
    print('tab btn');
  }

  void _initMyUser() {
    SharedPrefUtils.getUser().then((value) {
      setState(() {
        myUser = value;
      });
    });
  }



  @override
  void dispose() {
    // marketingVideoControllers.forEach((controller) {
    //   controller.dispose();
    // });
    super.dispose();
  }
}