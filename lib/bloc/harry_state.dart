part of 'harry_bloc.dart';


sealed class HarryState {}

final class HarryInitial extends HarryState {}
final class Loading extends HarryState {
  final bool isLoading;

  Loading({this.isLoading = false});
}
final class Success extends HarryState {
  final List<HarryModel> listModels;

  Success(this.listModels);
}
final class Error extends HarryState {
  final String message;

  Error(this.message);
}
