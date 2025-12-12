part of 'harry_bloc.dart';

sealed class HarryEvent {}

class FetchCharacters extends HarryEvent {}

class SetLoadingEvent extends HarryEvent {}
