// import 'package:flutter/material.dart';
//
// import '../../../model/slider_model.dart';
//
// class ImageSlider extends StatelessWidget {
//   final List<SliderData> imgSlides;
//   final PageController _pageController = PageController(initialPage: 0);
//   final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
//
//   ImageSlider({Key? key, required this.imgSlides});
//
//   Widget _buildIndicator() {
//     return ValueListenableBuilder<int>(
//       valueListenable: _currentPage,
//       builder: (context, currentPage, _) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: imgSlides.map((image) {
//             int index = imgSlides.indexOf(image);
//             return Container(
//               margin: const EdgeInsets.symmetric(horizontal: 4),
//               width: 8,
//               height: 8,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: currentPage == index ? Colors.blue : Colors.grey,
//               ),
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: PageView.builder(
//             controller: _pageController,
//             itemCount: imgSlides.length,
//             itemBuilder: (context, index) {
//               return Container(
//                 margin: EdgeInsets.symmetric(vertical: 5),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.network(
//                     imgSlides[index].image!,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Center(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(Icons.error,size: 50,color: Colors.red,),
//                             Text('No data')
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               );
//             },
//             onPageChanged: (index) {
//               _currentPage.value = index;
//             },
//           ),
//         ),
//         _buildIndicator(),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'dart:async';

import '../../../model/slider_model.dart';

class ImageSlider extends StatefulWidget {
  final List<SliderData> imgSlides;

  ImageSlider({Key? key, required this.imgSlides}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController(initialPage: 0);
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    _currentPage.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(Duration(seconds: 6), (timer) {
      if (_currentPage.value < widget.imgSlides.length - 1) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Widget _buildIndicator() {
    return ValueListenableBuilder<int>(
      valueListenable: _currentPage,
      builder: (context, currentPage, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgSlides.map((image) {
            int index = widget.imgSlides.indexOf(image);
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPage == index ? Colors.blue : Colors.grey,
              ),
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imgSlides.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.imgSlides[index].image!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.error, size: 50, color: Colors.red),
                            Text('No data')
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
            onPageChanged: (index) {
              _currentPage.value = index;
            },
          ),
        ),
        _buildIndicator(),
      ],
    );
  }
}
