import 'package:breakingbad/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/charchters_cubit.dart';
class CharacterDetailsScreen extends StatefulWidget {
  final int characterId;
  const CharacterDetailsScreen({required this.characterId}) : super();

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharacterCubit,CharchtersState>(
        builder: (context,state){
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top:30,left:8,right: 8,bottom: 8),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        child: Image(
                          image: NetworkImage('${CharacterCubit.get(context).charImages[widget.characterId-1]}'),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('${CharacterCubit.get(context).realNames[widget.characterId-1]}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontFamily: AppStrings.appFontFamily,
                    ),
                    ),
                    Text('${CharacterCubit.get(context).charBirthday[widget.characterId-1]}',
                    style: const TextStyle(
                      fontSize: 30,
                      fontFamily: AppStrings.appFontFamily,
                    ),
                    ),
                    Text('${CharacterCubit.get(context).catergory[widget.characterId-1]}',
                    style: const TextStyle(
                      fontSize: 30,
                      fontFamily: AppStrings.appFontFamily,
                    ),
                    ),
                    Text('${CharacterCubit.get(context).charname[widget.characterId-1]}',
                    style: const TextStyle(
                      fontSize: 30,
                      fontFamily: AppStrings.appFontFamily,
                    ),
                    ),
                    Text('${CharacterCubit.get(context).charNakename[widget.characterId-1]}',
                    style: const TextStyle(
                      fontSize: 30,
                      fontFamily: AppStrings.appFontFamily,
                    ),
                    ),
                    Text('${CharacterCubit.get(context).charStatus[widget.characterId-1]}',
                    style: const TextStyle(
                      fontSize: 30,
                      fontFamily: AppStrings.appFontFamily,
                    ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
        listener: (context,state){});
  }
}

