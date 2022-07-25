import 'package:bloc/bloc.dart';
import 'package:breakingbad/business_logic/bloc/bloc_observer.dart';
import 'package:breakingbad/business_logic/cubit/charchters_cubit.dart';
import 'package:breakingbad/data/web_services/dio_helper.dart';
import 'package:breakingbad/presentation/screens/characgters_screen.dart';
import 'package:breakingbad/presentation/screens/character_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer= MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>CharacterCubit()..getCharacters())
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/':(context)=>const CharacterScreen(),
          //'detailsScreen':(context)=> CharacterDetailsScreen(characterId:CharacterCubit.get(context).characterModel!.char_id!),
        },
      ),
    );
  }
}




