part of 'charchters_cubit.dart';

@immutable
abstract class CharchtersState {}

class CharchtersInitial extends CharchtersState {}
class GetCharchtersLoadingState extends CharchtersState {}
class GetCharchtersSuccessState extends CharchtersState {}
class GetCharchtersErrorState extends CharchtersState {}
