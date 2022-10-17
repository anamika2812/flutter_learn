import 'package:flutter_learn/utils/helpers/app_const.dart';
import 'package:flutter_learn/utils/helpers/app_images.dart';
import 'movie_model.dart';

class MovieList {
  static final List<MovieModal> list = [
    MovieModal(
      AppConst.movieList1,
      AppImages.movieList2,
      AppConst.type1,
      AppConst.description,
    ),
    MovieModal(
      AppConst.movieList2,
      AppImages.movieList2,
      AppConst.type2,
      AppConst.moviedescription1,
    ),
    MovieModal(
      AppConst.movieList3,
      AppImages.movieList2,
      AppConst.type3,
      AppConst.moviedescription2,
    ),
    MovieModal(
      AppConst.movieList4,
      AppImages.movieList2,
      AppConst.type4,
      AppConst.description,
    ),
    MovieModal(
      AppConst.movieList5,
      AppImages.movieList2,
      AppConst.type5,
      AppConst.description,
    ),
    MovieModal(
      AppConst.movieList6,
      AppImages.movieList2,
      AppConst.type6,
      AppConst.description,
    ),
    MovieModal(
      AppConst.movieList1,
      AppImages.movieList2,
      AppConst.type1,
      AppConst.description,
    ),
  ];
}
