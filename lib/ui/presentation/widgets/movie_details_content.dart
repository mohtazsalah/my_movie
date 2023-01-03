import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/utils/enums.dart';
import 'package:my_movie/ui/domain/entities/genres.dart';
import 'package:my_movie/ui/presentation/controller/movie_details_bloc.dart';

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc , MovieDetailsState>(
        builder: (context , state) {
          switch (state.movieDetailsState){
            case RequestState.loading:
              return const Center();
            case RequestState.loaded:
              return CustomScrollView();
            case RequestState.error:
              return Center(child: Text(state.movieDetailsMessage),);
          }
        }
    );
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for(var genre in genres){
      result += '${genre.name},' ;
    }

    if(result.isEmpty){
      return result ;
    }

    return result.substring(0 , result.length - 2);
  }

  String _showDuration(int runtime){
    final int hours = runtime ~/ 60 ;
    final int minutes = runtime % 60 ;

    if(hours > 0){
      return '${hours}h ${minutes}m' ;
    }else {
      return '${minutes}m';
    }
  }


}
