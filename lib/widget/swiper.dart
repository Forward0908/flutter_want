import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:toast/toast.dart' as prefix0;

typedef void OnTap(int index);
class SwiperView extends StatefulWidget {
  final List bannerImg;
  final OnTap onTap;

  @override
  _SwiperViewState createState() => _SwiperViewState();

  SwiperView(this.bannerImg, {this.onTap});
}

class _SwiperViewState extends State<SwiperView> {
  List<Widget> imageList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[firstSwiperView()],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      imageList = widget.bannerImg;
    });
  }

  Widget firstSwiperView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Swiper(
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) => (imageList[index]),
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
          builder: DotSwiperPaginationBuilder(
              color: Colors.grey[200], size: 8, activeColor: Colors.red[400]),
        ),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        autoplayDelay: 2000,
        onTap: (index) =>{
          widget.onTap(index)
        },
      ),
    );
  }
}
