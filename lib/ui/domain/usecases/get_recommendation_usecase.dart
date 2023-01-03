import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_movie/core/error/failure.dart';
import 'package:my_movie/core/usecase/base_usecase.dart';
import 'package:my_movie/ui/domain/entities/recommendation.dart';
import 'package:my_movie/ui/domain/repository/base_movies_repository.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await baseMoviesRepository.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];
}
