import 'package:breakingbad/business_logic/cubit/charchters_cubit.dart';
import 'package:breakingbad/constants/app_colors.dart';
import 'package:breakingbad/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/appbar.dart';
import '../widgets/characters_widget.dart';
class CharacterScreen extends StatelessWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocConsumer<CharacterCubit,CharchtersState>(
      builder: (context,state){
        if(state is GetCharchtersLoadingState){
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  const Text('Loading...',style: TextStyle(
                    color: Colors.black,
                    fontFamily: AppStrings.appFontFamily,
                    fontSize: 15
                  ),),
                ],
              ),
            ),
          );
        }else{
          return  Scaffold(
          backgroundColor: AppColors.mywhite,
          body:Padding(
            padding: const EdgeInsets.only(top:40,right: 8,left: 8),
            child: Column(
              children: [
                mainAppBar(),
                SizedBox(height: 10,),
                Expanded(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index)=>buildCharactersWidget(context,index),
                      separatorBuilder: (context , index){
                        return SizedBox(height:10);
                      },
                      itemCount:CharacterCubit.get(context).realNames.length),
                ),
              ],
            ),
          ),
        );
        }

      },
      listener: (context,state){

      },
    );
  }
}
