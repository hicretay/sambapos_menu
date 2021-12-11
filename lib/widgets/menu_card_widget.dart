// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:sambapos_menu/settings/constants.dart';
import 'package:sambapos_menu/settings/extensions.dart';

class MenuCardWidget extends StatelessWidget {
  const MenuCardWidget({Key? key, required this.image, required this.leading}) : super(key: key);

  final Widget image;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 10,
        child: Column(
          children:[
             Padding(
               padding: const EdgeInsets.all(defaultPadding),
               child: ClipRRect(
                 borderRadius: BorderRadius.all(Radius.circular(maxPadding)),
                 child: image
               ),
             ),
            Center(child: leading),
            SizedBox(height: ScreenSizes(context).height*0.03)
          ],
        ),
      ),
    );
  }
}

