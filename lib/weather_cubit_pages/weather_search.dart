import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubits/weather_cubits/weather_info/weather_info_cubit.dart';

class WeatherSearchState extends StatefulWidget {
  static const weatherSearchRoute = '/weatherSearch';
  const WeatherSearchState({super.key});

  @override
  State<WeatherSearchState> createState() => _WeatherSearchStateState();
}

class _WeatherSearchStateState extends State<WeatherSearchState> {
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
              title: 
              
              const Center(child: Text('Search')),
            ),
            body: Column(
              children: [
                TextField(
                  controller: _search,
                  autofocus: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'City Name',
                      hintText: 'more than 2 characters',
                      icon: Icon(Icons.search)),
                  onSubmitted: (value) {
                    if (value.length >= 2) {}
                  },
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
