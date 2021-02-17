import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/Service/Service.dart';
import 'package:movieapp/models/DetailsModel.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial());

  @override
  Stream<DetailsState> mapEventToState(
     event,
  ) async* {
       if (event is GetMovieDetailsEvent) {
      yield* mapGetMovieDetailsEventToState(event);
    }
  }

   Stream<DetailsState> mapGetMovieDetailsEventToState(
      GetMovieDetailsEvent event) async* {
    var movieDetails = await Service.movieDetails(event.id);
    yield DetailsLoaded(movieDetails);
  }
}
