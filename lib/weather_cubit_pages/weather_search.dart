import 'package:flutter/material.dart';

class _WeatherSearchState extends StatefulWidget {
  const _WeatherSearchState({super.key});

  @override
  State<_WeatherSearchState> createState() => __WeatherSearchStateState();
}

class __WeatherSearchStateState extends State<_WeatherSearchState> {
  final TextEditingController _search  = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Search')
        ),
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
              icon: Icon(Icons.search)
            ),
            onSubmitted: (value) {
              if (value.length >= 2) {
                
              } 
            },
          ),
          const SizedBox(height: 8,),
          ElevatedButton(
            onPressed: () {

            },
            child: const Text('How\'s weather?')
          )
        ],
      ),
    );
  }
}