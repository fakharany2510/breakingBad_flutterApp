import 'package:breakingbad/business_logic/cubit/charchters_cubit.dart';
import 'package:breakingbad/data/model/character.dart';
import 'package:breakingbad/presentation/screens/character_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';

Widget buildCharactersWidget(context, index)=>  Container(
  width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height*.2,
  decoration:  BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Colors.amber.shade200,
        Colors.yellow.shade200,
      ],
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Row(
    children: [
      Container(
        width:  MediaQuery.of(context).size.width*.4,
        height:  MediaQuery.of(context).size.height*.2,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black
        ),
        child: Image(
          image: NetworkImage('${CharacterCubit.get(context).charImages[index]}'),
          fit: BoxFit.fill,
        ),
      ),
      SizedBox(width:  MediaQuery.of(context).size.width*.05,),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('${CharacterCubit.get(context).charId[index]}',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: AppStrings.appFontFamily,
                    fontSize: 30
                ),
              ),
              Text('${CharacterCubit.get(context).realNames[index]}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: AppStrings.appFontFamily,
                    fontSize: 30
                ),
              ),
              Expanded(
                child: TextButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>CharacterDetailsScreen(
                              characterId: CharacterCubit.get(context).charId[index]!)));
                      print('index .......> ${index}');
                  print('id .......> ${ CharacterCubit.get(context).charId[index]!}');
                },
                  child: Text('Show Details >',style: TextStyle(
                      color: Colors.amber.shade900,
                      fontFamily: AppStrings.appFontFamily,
                      fontSize: 20
                  )),

                ),
              ),
            ],
          ),
        ),
      )
    ],
  ),
);