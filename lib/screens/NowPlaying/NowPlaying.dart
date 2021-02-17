import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/Constants/constants.dart';
import 'package:movieapp/screens/Details/Details.dart';
import 'package:movieapp/screens/NowPlaying/bloc/nowplaying_bloc.dart';

class NowPlaying extends StatefulWidget {
  NowPlaying({Key key}) : super(key: key);

  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  NowPlayingBloc bloc = NowPlayingBloc();
  @override
  void initState() {
    super.initState();
    bloc.add(GetNowPlayingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Movie Mania")),
        body: BlocBuilder<NowPlayingBloc, NowPlayingState>(
            cubit: bloc,
            builder: (context, state) {
              if (state is NowplayingInitial) {
                return Center(child:CircularProgressIndicator());
              }
              if (state is NowPlayingLoaded) {
                return Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        
                        scrollDirection: Axis.vertical,
                        itemCount: state.nowPlayingMovieList.results.length,
                        itemBuilder: (context, i) {
                          
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MovieDetails(
                                            state.nowPlayingMovieList.results[i]
                                                .id,
                                            state.nowPlayingMovieList.results[i]
                                                .title,
                                            '$img_path${state.nowPlayingMovieList.results[i].backdropPath}')),
                                  );
                                },
                                child: Container(
                                height: 200,    
                                margin: EdgeInsets.fromLTRB(12,0,12,0),
                                  child: Card(
                                        elevation: 5,                              child: Stack(
                                      children: [
                                        CachedNetworkImage(
                                          height: 200,
                                          fit: BoxFit.cover,
                                          imageUrl:
                                              '$img_path${state.nowPlayingMovieList.results[i].backdropPath}',
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            ListTile(
                                                title: Text(
                                                    '${state.nowPlayingMovieList.results[i].title}'),
                                                subtitle: Text(
                                                    "${state.nowPlayingMovieList.results[i].voteCount} votes")),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height/2),
                            crossAxisCount: 2),
                      ),
                    ),
                  ],
                );
              }
              if (state is NowPlayingError) {
                return Text('error');
              }
            }));
  }
}
