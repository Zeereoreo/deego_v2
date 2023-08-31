// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// class CarouselWithIndicator extends StatelessWidget {
//   final CarouselController carouselController;
//   final List<String> imageList;
//
//   const CarouselWithIndicator({
//     required this.carouselController,
//     required this.imageList,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 300,
//           child: Stack(
//             children: [
//               sliderWidget(),
//               sliderIndicator(),
//             ],
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(20),
//           child: const Text(
//             "Welcome to the carousel slide app",
//             style: TextStyle(fontSize: 18),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget sliderWidget() {
//     return CarouselSlider(
//       carouselController: carouselController,
//       items: imageList.map(
//             (imgLink) {
//           return Builder(
//             builder: (context) {
//               return SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 child: Image(
//                   fit: BoxFit.fill,
//                   image: NetworkImage(
//                     imgLink,
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ).toList(),
//       options: CarouselOptions(
//         height: 300,
//         viewportFraction: 1.0,
//         autoPlay: true,
//         autoPlayInterval: const Duration(seconds: 4),
//         onPageChanged: (index, reason) {
//           // Handle onPageChanged
//         },
//       ),
//     );
//   }
//
//   Widget sliderIndicator() {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: imageList.asMap().entries.map((entry) {
//           return GestureDetector(
//             onTap: () => carouselController.animateToPage(entry.key),
//             child: Container(
//               width: 12,
//               height: 12,
//               margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white.withOpacity(
//                   carouselController.targetPage == entry.key ? 0.9 : 0.4,
//                 ),
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
//
