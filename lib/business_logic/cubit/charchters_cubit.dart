import 'package:bloc/bloc.dart';
import 'package:breakingbad/data/model/character.dart';
import 'package:breakingbad/data/web_services/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'charchters_state.dart';

class CharacterCubit extends Cubit<CharchtersState> {
  CharacterCubit() : super(CharchtersInitial());
  static CharacterCubit get(context) => BlocProvider.of(context);

   CharModel? characterModel;
    List<String?> realNames=[];
    List<String?> charImages=[];
    List<int?> charId=[];
    List<String?> charBirthday=[];
    List<String?> charStatus=[];
    List<String?> charNakename=[];
    List<String?> charname=[];
    List<String?> catergory=[];

  void getCharacters(){
    emit(GetCharchtersLoadingState());
    DioHelper.getCharacters(url: 'characters')
        .then((value){
      value.data.forEach((element){
        characterModel=CharModel.fromJson(element);
        realNames.add(characterModel!.actorName);
        charId.add(characterModel!.char_id);
        charImages.add(characterModel!.image);
        charBirthday.add(characterModel!.birthDay);
        charStatus.add(characterModel!.status);
        charNakename.add(characterModel!.nakeName);
        charname.add(characterModel!.name);
        catergory.add(characterModel!.category);
      });
      print(charImages);
      emit(GetCharchtersSuccessState());
          //characterModel=CharModel.fromJson(value.data);

    })
        .catchError((error){
          print('error getting character => ${error.toString()}');
          emit(GetCharchtersErrorState());
    });
  }
}
