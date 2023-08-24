import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentation/bloc/movie/remote/remote_movie_bloc.dart';
import 'package:movie_app/features/home/presentation/bloc/movie/remote/remote_movie_state.dart';
import 'package:movie_app/features/home/presentation/widgets/movie_tile.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  String selectedFilter = 'all';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  Widget buildFilterTab(String filter) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selectedFilter == filter ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(filter),
      ),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text('Movies'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ],
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(100),
      //   child: Padding(
      //     padding: const EdgeInsets.all(16),
      //     child: _buildGenreList(),
      //   ),
      // ),
    );
  }

  Widget _buildGenreList() {
    return BlocBuilder<RemoteMoviesBloc, RemoteMoviesState>(
      builder: (context, state) {
        print('gen : ${state.genres?.length}');
        if (state is RemoteMoviesDone) {
          return SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  buildFilterTab(state.genres?[index].name ?? ''),
              itemCount: state.genres?.length ?? 0,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteMoviesBloc, RemoteMoviesState>(
      builder: (_, state) {
        if (state is RemoteMoviesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteMoviesError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteMoviesDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return MovieWidget(movie: state.movies![index]);
            },
            itemCount: state.movies!.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
