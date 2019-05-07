import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(new ImageSwiper());

var list = [1,2,3]; 
const image1 = 'assets/flutter.png';

class ImageSwiper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
   body:  new Swiper(
        itemBuilder: (BuildContext context,int index){
         return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
        },
  //       itemBuilder: (context, index) {
  //   return new Container(
  //     color: Colors.grey,
  //     child: new Center(
  //       child: new SizedBox(
  //                   height: 55.0,
  //                   child: Image.asset(
  //                     "assets/flutter.png",
  //                     fit: BoxFit.contain,
  //                   ),
  //                 ),
  //     ),
  //   );
  // },
        itemCount: 3,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}
