part of 'details_bloc.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final MovieDetailsModel movieDetails;

  DetailsLoaded(this.movieDetails);
}

class DetailsError extends DetailsState {}
