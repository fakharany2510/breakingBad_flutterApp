import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';

Widget mainAppBar()=>Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children:  [
    const Text('Breaking',style: TextStyle(
        fontFamily: AppStrings.appFontFamily,
        color: Colors.black,
        fontSize: 35
    ),),
    const SizedBox(width: 5,),
    Container(
      width: 100,
      height: 100,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: AppColors.myYellow,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Image(
        image: AssetImage('assets/images/b1.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    const SizedBox(width: 5,),
    const Text('bad',style: TextStyle(
        fontFamily: AppStrings.appFontFamily,
        color: Colors.black,
        fontSize: 35
    ),),
  ],
);