part of 'harry_bloc.dart';
sealed class HarryState {}

class HarryInitial extends HarryState {}

class Loading extends HarryState {}

class Success extends HarryState {
  final List<HarryModel> listModels;
  Success(this.listModels);
}

class Error extends HarryState {
  final String message;
  Error(this.message);
}
