part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent {}


class GetMovieDetailsEvent extends DetailsEvent {
  final id;

  GetMovieDetailsEvent(this.id);
  
}