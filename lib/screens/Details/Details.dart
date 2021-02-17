import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/Constants/constants.dart';
import 'package:movieapp/screens/Details/bloc/details_bloc.dart';

class MovieDetails extends StatefulWidget {
  final id;
  final title;
  final tag;
  MovieDetails(this.id, this.title, this.tag, {Key key}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  DetailsBloc detailsBloc = DetailsBloc();
  @override
  void initState() {
    super.initState();
    detailsBloc.add(GetMovieDetailsEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("${widget.title}")),
        body: BlocBuilder<DetailsBloc, DetailsState>(
            cubit: detailsBloc,
            builder: (context, state) {
              if (state is DetailsInitial) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is DetailsLoaded) {
                var genres = [];
                for (var genr in state.movieDetails.genres) {
                  genres.add(genr.name);
                }
                return Scaffold(
                    body: Container(
                  // margin: EdgeInsets.all(12),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          height: 360,
                          fit: BoxFit.cover,
                          imageUrl:
                              '$img_path${state.movieDetails.backdropPath}',
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(16),
                          title: Text('${state.movieDetails.title}',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                              )),
                          subtitle: state.movieDetails.tagline != null
                              ? Text('${state.movieDetails.tagline}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic
                                  ))
                              : Container(),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(16,0,16,8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${state.movieDetails.releaseDate}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  )),
                              Text('${state.movieDetails.voteCount} votes',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(16,0,16,16),
                          alignment: Alignment.centerLeft,
                          child: Text('${genres.join(',')}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white54
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(16,0,16,16),
                          alignment: Alignment.centerLeft,
                          child: Text('${state.movieDetails.overview}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic
                              )),
                        )
                      ],
                    ),
                  ),
                ));
              }
              if (state is DetailsError) {
                return Text('error');
              }
            }));
  }
}
