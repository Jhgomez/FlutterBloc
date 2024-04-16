import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubits/weather_cubits/weather_info/weather_info_cubit.dart';

class WeatherSearch extends StatefulWidget {
  static const weatherSearchRoute = '/weatherSearch';
  const WeatherSearch({super.key});

  @override
  State<WeatherSearch> createState() => _WeatherSearchStateState();
}

class _WeatherSearchStateState extends State<WeatherSearch> {
  final TextEditingController _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherInfoCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Search'),
            ),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(24, 32, 24, 0),
                  child: TextField(
                    controller: _search,
                    autofocus: true,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(),
                      labelText: 'City Name',
                      hintText: 'more than 2 characters',
                      prefixIcon: Icon(Icons.search)
                    ),
                    onSubmitted: (value) {
                      if (value.length >= 2) {}
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text('How\'s weather?'))
              ],
            ),
          );
        }
      ),
    );
  }
}
