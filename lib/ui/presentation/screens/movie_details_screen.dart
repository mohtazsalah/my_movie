import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/services/services_locator.dart';
import 'package:my_movie/ui/presentation/controller/movie_details_bloc.dart';
import 'package:my_movie/ui/presentation/widgets/movie_details_content.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;
  const MovieDetailScreen({Key? key , required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<MovieDetailsBloc>()
          ..add(GetMovieDetailsEvent(id))
          ..add(GetMovieRecommendationEvent(id)),
    lazy: false,
    child: Scaffold(
      body: MovieDetailContent(),
    ),
    );
  }
}


