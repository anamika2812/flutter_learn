import 'package:flutter/material.dart';
import 'package:flutter_learn/modules/moviescreen/view/movie_model.dart';
import 'package:flutter_learn/utils/helpers/app_color.dart';
import 'package:flutter_learn/utils/helpers/app_dimension.dart';
import '../../../utils/helpers/app_const.dart';
import 'movie_list.dart';

class MovieScreenPage extends StatefulWidget {
  const MovieScreenPage({super.key});

  @override
  State<MovieScreenPage> createState() => _MovieScreenPageState();
}

class _MovieScreenPageState extends State<MovieScreenPage> {
  final List<MovieModal> _list = MovieList.list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color.fromRGBO(47, 49, 73, 1),
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appbarstyle1(),
            _appbarstyle2(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: AppColors.red,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
              color: AppColors.red,
            ),
            label: 'Buzz',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: AppColors.red,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.red[800],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView(
          children: [
            _buildmovieList(),
            Divider(
              height: 24,
              thickness: 1,
              color: AppColors.black.withOpacity(0.2),
            ),
            _movieType(),
            Divider(
              height: 24,
              thickness: 1,
              color: AppColors.black.withOpacity(0.2),
            ),
            _buildbuzzList(),
          ],
        ),
      ),
    );
  }

  Widget _appbarstyle1() {
    return const Text(AppConst.moviebuzz,
        style: TextStyle(
            color: Colors.white,
            fontSize: AppDim.size25,
            fontWeight: FontWeight.bold));
  }

  Widget _appbarstyle2() {
    return const Text(AppConst.moviebuzztext,
        style: TextStyle(
          color: Color(0xff59595a),
          fontSize: AppDim.size18,
        ));
  }

  _buildmovieList() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: _buildmovieData(_list[index]),
            );
          },
          itemCount: _list.length,
        ),
      ),
    );
  }

  _buildmovieData(MovieModal list) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.red),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            color: AppColors.white,
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(list.image),
            radius: 50,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: SizedBox(
            width: 80,
            child: Text(
              list.title,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

  _movieType() {
    return Wrap(
      children: List<Widget>.generate(
        _list.length,
        (index) => InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
          highlightColor: AppColors.black,
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              border: Border.all(color: AppColors.red),
            ),
            child: Text(
              _list[index].movietype,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ).toList(),
    );
  }

  _firstColumn() {
    return Padding(
      padding: const EdgeInsets.only(right: 100.0),
      child: Column(
        children: const [
          Text(
            " list.title",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          CircleAvatar(
            backgroundImage:
                NetworkImage('https://picsum.photos/id/1074/400/400'),
            radius: 15,
          ),
        ],
      ),
    );
  }

  _secondColumn() {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          iconSize: 30,
          icon: const Icon(Icons.bookmark_border_outlined),
          selectedIcon: const Icon(Icons.bookmark_added),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              iconSize: 30,
              icon: const Icon(Icons.favorite_outline),
              selectedIcon: const Icon(Icons.favorite),
            ),
            const Text("8"),
            IconButton(
              onPressed: () {},
              iconSize: 30,
              icon: const Icon(Icons.share),
              selectedIcon: const Icon(Icons.share),
            ),
          ],
        ),
      ],
    );
  }

  _buildbuzzList() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://picsum.photos/id/1074/400/400',
              width: 110.0,
              height: 110.0,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0), // give some padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _firstColumn(),
                  _secondColumn(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
