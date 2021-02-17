import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/Constants/constants.dart';
import 'package:movieapp/Service/OfflineResources.dart';
import 'package:movieapp/Service/Service.dart';
import 'package:movieapp/Utils/interntUtil.dart';
import 'package:movieapp/models/NowPlayingModel.dart';
part 'nowplaying_event.dart';
part 'nowplaying_state.dart';

bool isFetching = false;

class NowPlayingBloc extends Bloc<GetNowPlayingEvent, NowPlayingState> {
  NowPlayingBloc() : super(NowplayingInitial());
  @override
  Stream<NowPlayingState> mapEventToState(event) async* {
    if (event is GetNowPlayingEvent) {
      yield* mapGetNowPlayingEventToState(event);
    }
  }

  Stream<NowPlayingState> mapGetNowPlayingEventToState(
      GetNowPlayingEvent event) async* {
    var internet = await checkInternetConnection();

    if (internet) {
      /* Fetching Api data when internet is available */
      var nowPlayingMovieList = await Service.getNowPlaying();
      await OfflineMoviesListDataTrack.addorupdateofflineMoviesListTrack(
          totalResults: nowPlayingMovieList.totalResults,
          results: nowPlayingMovieList.results,
          id: nowPlayingId);
      yield NowPlayingLoaded(nowPlayingMovieList);
    } else {
      /* Fetching Hive data When internet is not availble */
      var nowPlayingMovieList =
          await OfflineMoviesListDataTrack.getMoviesListDetails(
              id: nowPlayingId);
      yield NowPlayingLoaded(nowPlayingMovieList);
    }
  }
}
