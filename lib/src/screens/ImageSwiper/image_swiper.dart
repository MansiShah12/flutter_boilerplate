import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


void main() => runApp(new ImageSwiper());

var list = [1,2,3]; 
Image image1 = 'assets/flutter.png' as Image;

final images = Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
 appBar(fromTab,context){
   if(!fromTab){
   return AppBar(
                title: Text("Images"),
                automaticallyImplyLeading: true,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context, false),
                ));
                }else{
                  return null;
                }
 }

class ImageSwiper extends StatelessWidget {
    bool fromTab;
ImageSwiper({Key key, @required this.fromTab}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
double height = MediaQuery.of(context).size.height;
    return new Scaffold(
       appBar: appBar(fromTab,context),
    body: 
 new Swiper(
        itemBuilder: (BuildContext context,int index){
        //  return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
        return Stack(
            children: [
              Center(child: CircularProgressIndicator()),
              Center(
                child: FadeInImage.memoryNetwork(
                   placeholder: kTransparentImage,
                  image: "http://via.placeholder.com/350x150",
                  fit:BoxFit.fill,
                  width:width,
                  height:height-50,

                ),
              ),
            ],
          );
        },
        itemCount: 3,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}
