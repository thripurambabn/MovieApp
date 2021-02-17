part of 'nowplaying_bloc.dart';

@immutable
abstract class NowPlayingState {}

class NowplayingInitial extends NowPlayingState {}

class NowPlayingLoaded extends NowPlayingState {
  final NowPlayingModel nowPlayingMovieList;

  NowPlayingLoaded(this.nowPlayingMovieList);
}

class NowPlayingError extends NowPlayingState {}
