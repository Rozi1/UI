// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rozi_design/view/widgets/scroll_behavior.dart';

// class Step12Screen extends StatefulWidget {
//   Step12Screen(
//       {Key? key})
//       : super(key: key);
  
//   @override
//   State<Step12Screen> createState() => _Step12ScreenState();
// }

// class _Step12ScreenState extends State<Step12Screen> {

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: ScrollConfiguration(
//         behavior: PlainScrollBehavior(),
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               pinned: true,
//               automaticallyImplyLeading: false,
//               elevation: 0.0,
//               floating: true,
//               // backgroundColor: Get.theme.colorScheme.primaryVariant,
//               expandedHeight: height * .45,
//               flexibleSpace: FlexibleSpaceBar(
//                 titlePadding: const EdgeInsets.all(0.0),
//                 title: Padding(
//                   padding: const EdgeInsets.only(left: 20, bottom: 20 / 3),
//                   child: Text(
//                     "Now for the fun part, set your price",
//                     textAlign: TextAlign.left,
//                     // style: subTitlWhiteeBoldTextStyle(),
//                   ),
//                 ),
//                 background: Container(
//                   height: height * .4,
//                   width: double.infinity,
//                   foregroundDecoration: BoxDecoration(
//               // gradient: LinearGradient(
//               //   colors: [Colors.transparent, primaryColor],
//               //   begin: Alignment.topCenter,
//               //   end: Alignment.bottomCenter,
//               //   stops: [0.3, 2],
//               // ),
//             ),
//                   decoration: BoxDecoration(color: primaryColor,image: DecorationImage(image: AssetImage('assets/dummy/sauna.png'),fit: BoxFit.cover)),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: padding),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             width: width * .8,
//                             child: ListTile(
//                                 leading: CircleAvatar(
//                                   radius: padding,
//                                   backgroundColor:
//                                       Colors.black.withOpacity(0.5),
//                                   child: IconButton(
//                                       onPressed: () {
//                                         Navigator.pushAndRemoveUntil(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) =>
//                                                   BecomeHostScreen(),
//                                             ),
//                                             (route) => false);
//                                       },
//                                       icon: Image.asset('assets/icons/close.png',width: 15,height: 15 ,)),
//                                 ),
//                                 /*trailing: Container(
//                                   height: padding * 2,
//                                   width: width * .35,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(50),
//                                     color: Colors.black.withOpacity(0.5),
//                                   ),
//                                   child: IconButton(
//                                       onPressed: () {},
//                                       icon: Text(
//                                         'Ask a superhost',
//                                         style: TextStyle(color: whiteColor),
//                                       )),
//                                 )*/
//                             ),
//                           ),
//                           SizedBox(
//                             width: width * .2,
//                             child: ListTile(
//                               trailing: CircleAvatar(
//                                 radius: padding,
//                                 backgroundColor: Colors.black.withOpacity(0.5),
//                                 child: IconButton(
//                                     onPressed: () {},
//                                     icon: Image.asset('assets/icons/help.png',width: 15,height: 15 ,)),
//                               ),
//                             ),
//                           ),
//                         ]),
//                   ),
//                 ),
//               ),
//             ),
//             SliverList(
//               delegate: SliverChildListDelegate(
//                 [
//                   Stack(
//                     children: [
//                       Container(
//                           height: 200,
//                           decoration: BoxDecoration(
//                             color: primaryColor,
//                           )),
//                       Container(
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(25),
//                                 topRight: Radius.circular(25))),
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: padding),
//                           child: Column(
//                             children: [
//                               ScrollConfiguration(
//                                 behavior: PlainScrollBehavior(),
//                                 child: Container(
//                                   height: height,
//                                   width: double.infinity,
//                                   child: Column(
//                                     children: [
//                                       SizedBox(
//                                         height: padding * 1.5,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           SizedBox(
//                                             height: padding * 1.5,
//                                             child: FloatingActionButton(
//                                               heroTag: '-btn1',
//                                                 child: Text(
//                                                   "-",
//                                                   style: titleTextStyle(),
//                                                 ),
//                                                 backgroundColor: whiteColor,
//                                                 splashColor: primaryColor,
//                                                 onPressed: () {
//                                                   setState(() {
//                                                     if (price <= 0) {
//                                                       price = 0;
//                                                     }
//                                                     price--;
//                                                   });
//                                                 }),
//                                           ),
//                                           PriceWidget(
//                                               child: Center(
//                                             child: Text(
//                                               "US\$$price",
//                                               style: TextStyle(
//                                                   fontSize: 40,
//                                                   color: blackColor,
//                                                   fontWeight: FontWeight.w600),
//                                             ),
//                                           )),
//                                           SizedBox(
//                                             height: padding * 1.5,
//                                             child: FloatingActionButton(
//                                               heroTag: '+btn1',
//                                                 child: Icon(
//                                                   Icons.add,
//                                                   color: blackColor,
//                                                 ),
//                                                 backgroundColor: whiteColor,
//                                                 splashColor: primaryColor,
//                                                 onPressed: () {
//                                                   setState(() {
//                                                     ++price;
//                                                   });
//                                                 }),
//                                           ),
//                                         ],
//                                       ),
//                                       Text(
//                                         'per day',
//                                         style: descriptionTextStyle(),
//                                       ),
//                                       SizedBox(
//                                         height: padding * 2,
//                                       ),
//                                       Text(
//                                         'Places like your usually range from \$25 to \$42',
//                                         textAlign: TextAlign.center,
//                                         style: titleTextStyle(),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Stack(children: [
//         BottomNavigationBar(
//             selectedItemColor: primaryColor,
//             unselectedItemColor: secondaryColor,
//             currentIndex: 0,
//             items: [
//               BottomNavigationBarItem(
//                 label: '',
//                 icon: SizedBox(
//                   width: double.infinity,
//                   child: IconButton(
//                     icon: Text(
//                       'Back',
//                       style: buttonBlackTextStyle(),
//                     ),
//                     onPressed: () {
//                       Get.back();
//                     },
//                   ),
//                 ),
//               ),
//               BottomNavigationBarItem(icon: Text(''), label: ''),
//               BottomNavigationBarItem(
//                   label: '',
//                   icon: Container(
//                     height: customContainerHeight,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.4),
//                           spreadRadius: 3,
//                           blurRadius: 7,
//                           offset: Offset(0, 3), // changes position of shadow
//                         ),
//                       ],
//                     ),
//                     child: FlatButton(
//                       child: Text("Next"),
//                       onPressed: price <= 0
//                           ? () {}
//                           : () {
//                               packages.add(package);
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => Step13Screen(
//                                         category: widget.category,
//                                         subCategory: widget.subCategory,
//                                         guestList: widget.guestList,
//                                         lat: widget.lat,
//                                         long: widget.long,
//                                         address: widget.address,
//                                         offerList: widget.offerList,
//                                         imageList: widget.imageList,
//                                         title: widget.title,
//                                         describePlaceMore_list:
//                                             widget.describePlaceMore_list,
//                                         description: widget.description,
//                                         packages: packages),
//                                   ));
//                             },
//                       color: price <= 0
//                           ? primaryColor.withOpacity(0.5)
//                           : primaryColor,
//                       textColor: buttonTextColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ))
//             ]),
//         Container(
//           height: 2,
//           width: width,
//           decoration: BoxDecoration(color: blackColor.withOpacity(0.2)),
//         ),
//         Container(
//           height: 2,
//           width: width * .55,
//           decoration: BoxDecoration(color: blackColor),
//         )
//       ]),
//     );
//   }
// }

// class PriceWidget extends StatelessWidget {
//   final Widget child;
//   const PriceWidget({
//     Key? key,
//     required this.child,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       height: MediaQuery.of(context).size.height * .12,
//       width: size.width * .4,
//       margin: EdgeInsets.symmetric(vertical: padding / 3),
//       // padding: EdgeInsets.only(left: padding, top: 5, bottom: 5, right: 8),
//       decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.4),
//               spreadRadius: 3,
//               blurRadius: 7,
//               offset: Offset(0, 3), // changes position of shadow
//             ),
//           ],
//           color: whiteColor,
//           borderRadius: BorderRadius.circular(containerRoundCorner),
//           border: Border.all(color: Colors.grey.withOpacity(0.5))),
//       child: Center(child: child),
//     );
//   }
// }