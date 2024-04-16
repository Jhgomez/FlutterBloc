import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubits/weather_cubits/weather_info/weather_info_cubit.dart';
import 'package:flutter_bloc_app/weather_cubit_pages/weather_search.dart';
import 'package:transparent_image/transparent_image.dart';

class WeatherDisplay extends StatelessWidget {
  static const String weatherAppRoute = '/weather';

  const WeatherDisplay({super.key});
  
  @override
  Widget build(BuildContext context) {
    final city = context.watch<WeatherInfoCubit>().state.city;

          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Weather'),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(WeatherSearch.weatherSearchRoute);
                    },
                    icon: const Icon(Icons.search)
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings)
                  )
                ],
              ),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${city?.city}',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)
                    ),
                    // const SizedBox(height: 16),
                    Text(
                      '${city?.time} (${city?.country})',
                      style: Theme.of(context).textTheme.bodyLarge
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${city?.temperature}',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 12,),
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${city?.maxTemperature}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '${city?.minTemperature}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: '${city?.icon}',
                              width: 32,
                              height: 32,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 24),
                            Text(
                              '${city?.condition}',
                              style: Theme.of(context).textTheme.titleLarge
                            )
                          ],
                        )
                  ]
                )
              ),
             ),
          );
  }
}