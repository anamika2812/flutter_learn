import 'package:flutter/material.dart';
import 'package:flutter_learn/modules/moviescreen/view/moviebuzz/movie_buzz_list.dart';
import 'package:flutter_learn/utils/helpers/app_color.dart';
import 'package:flutter_learn/utils/helpers/app_dimension.dart';

import 'moviebuzz/movie_buzz_modal.dart';

class MovieBuzzScreen extends StatelessWidget {
  MovieBuzzScreen({super.key});

  final List<MovieBuzzModal> _movieBuzzList = MovieBuzzList.list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildBuzzScreen(context, index);
            },
            itemCount: _movieBuzzList.length,
            separatorBuilder: (BuildContext context, int index) {
              return buildDivider();
            },
          ),
        )
      ],
    );
  }

  _buildBuzzScreen(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          _buildBuzzImage(index),
          Column(
            children: [
              _buildTitleAndBookMark(context, index),
              _buildFavAndProfile(context, index),
            ],
          ),
        ],
      ),
    );
  }

  _buildBuzzImage(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox.fromSize(
        size: const Size.fromRadius(50),
        child: Image.asset(_movieBuzzList[index].image, fit: BoxFit.cover),
      ),
    );
  }

  _buildTitleAndBookMark(BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width - 130,
      padding: const EdgeInsets.only(left: AppDim.size14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              _movieBuzzList[index].title,
              style: const TextStyle(
                fontSize: AppDim.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  _buildFavAndProfile(BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width - 130,
      padding: const EdgeInsets.only(left: AppDim.size14),
      margin: const EdgeInsets.only(top: AppDim.size10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildMovieProfileicon(index),
          _buildFavoritelist(index),
        ],
      ),
    );
  }

  _buildMovieProfileicon(int index) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(_movieBuzzList[index].profilePic),
          radius: AppDim.size12,
        ),
        _buildSizedBox(),
        Text(
          _movieBuzzList[index].time,
        ),
      ],
    );
  }

  _buildFavoritelist(int index) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.favorite_outline),
          onPressed: () {},
        ),
        Text(
          _movieBuzzList[index].favCount,
        ),
        IconButton(
          icon: const Icon(Icons.share_outlined),
          onPressed: () {},
        ),
      ],
    );
  }

  buildDivider() {
    return Divider(
      height: 30,
      thickness: 1,
      color: AppColors.black.withOpacity(0.2),
    );
  }

  _buildSizedBox() {
    return const SizedBox(
      height: 5,
      width: 5,
    );
  }
}
