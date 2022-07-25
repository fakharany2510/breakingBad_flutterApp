import 'package:breakingbad/constants/app_strings.dart';
import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: AppStrings.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }
//get characters
 static Future<Response> getCharacters({
   required String url,
})async{
return await dio.get(url);
 }
}