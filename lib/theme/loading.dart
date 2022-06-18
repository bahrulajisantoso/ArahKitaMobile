import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project/theme/color.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(int.parse(Warna.colorGrey)),
      ),
      child: Center(
        child: SpinKitCircle(
          color: Color(int.parse(Warna.colorPrimary)),
          size: 60.0,
        ),
      ),
    );
  }
}
