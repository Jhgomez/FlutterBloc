import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/blocs/counter/counter_bloc.dart';
import 'package:flutter_bloc_app/blocs/theme/theme_bloc.dart';
import 'package:flutter_bloc_app/cubits/counter/counter_cubit.dart';
import 'package:flutter_bloc_app/observer/app_bloc_observer.dart';
import 'package:flutter_bloc_app/other_page.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc())
      ],
      child: Builder(
        builder: (contextB) {
          return MaterialApp(
            title: 'Counter Cubit',
            theme: contextB.watch<ThemeBloc>().state.colorTheme == ColorTheme.DARK ? ThemeData.dark() : ThemeData.light(),
            // ThemeData(
            //     // This is the theme of your application.
            //     //
            //     // TRY THIS: Try running your application with "flutter run". You'll see
            //     // the application has a purple toolbar. Then, without quitting the app,
            //     // try changing the seedColor in the colorScheme below to Colors.green
            //     // and then invoke "hot reload" (save your changes or press the "hot
            //     // reload" button in a Flutter-supported IDE, or press "r" if you used
            //     // the command line to start the app).
            //     //
            //     // Notice that the counter didn't reset back to zero; the application
            //     // state is not lost during the reload. To reset the state, use hot
            //     // restart instead.
            //     //
            //     // This works for code too, not just values: Most code changes can be
            //     // tested with just a hot reload.
            //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            //     useMaterial3: true,
            //     primarySwatch: Colors.blue),
            debugShowCheckedModeBanner: false,
            home: const MyHomePage(title: 'Flutter Bloc Home Page'),
          );
        }
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    context.read<CounterCubit>().increment();
  }

  void _decrementCounter() {
    BlocProvider.of<CounterCubit>(context).decrement();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: BlocConsumer<CounterCubit, CounterCubitState>(
          listener: (context, state) {        
              if (state.counter == 3) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('counter is ${state.counter}'),
                      );
                    });
              } else if (state.counter == -1) {
                Navigator.push(context, MaterialPageRoute(builder: (contextRoute) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider<CounterBloc>(create: (contextRoute) => CounterBloc()),
                      // BlocProvider<ThemeBloc>(create: (contextRoute) => context.read<ThemeBloc>())
                    ],
                    child: const OtherPage()
                    );
                  }
                )
              );
            }
          },
          builder: (context, state) {
              return Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: Column(
                  // Column is also a layout widget. It takes a list of children and
                  // arranges them vertically. By default, it sizes itself to fit its
                  // children horizontally, and tries to be as tall as its parent.
                  //
                  // Column has various properties to control how it sizes itself and
                  // how it positions its children. Here we use mainAxisAlignment to
                  // center the children vertically; the main axis here is the vertical
                  // axis because Columns are vertical (the cross axis would be
                  // horizontal).
                  //
                  // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
                  // action in the IDE, or press "p" in the console), to see the
                  // wireframe for each widget.
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Counter',
                    ),
                    Text(
                      '${state.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              );
            },
          ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'decrement',
                heroTag: 'decrement',
                child: const Icon(Icons.remove)),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'increment',
              heroTag: 'increment',
              child: const Icon(Icons.add),
            )
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

/*
there is now some BuilderContext extension functions that you can use to listen to changes
and we will compare them with the functionallity that BlocProvider.of static function
provides

  1. Block provider lets us access the functions of our cubit and/or get the value of the
  current state properties

    BlocProvide.of<T>(context) // where T is a cubit

  You can use the following extension function to just read the current value

    context.read<T>() // where T is a cubit and then you can just for example read a counter value and pass it to a text

  2.- BlocProvider lets us listen to updates just by specifiycing a parameter, this means
  all changes in the parameter we are listening will cause the UI to update

    BlocProvider.of<T>(context, listen: true)  //where T is a cubit
  
  You can use the following extension function to get same functionallity

    context.watch<T>() // where T is a cubit
  
  If you want to get better performance you wrap this function around a Builder widget and that way only the content
  of the widget builder parameter will get rebuilt when state changes

  3.- This extension function can be use in the same way as the second option, however you would
  specifically say the only property you want to listen

    context.select<T, R>( (T t) => R r)

    this means you can do the following

    Final name = context.select((Cubit cubit) => cubit.someNameProperty); // and then pass this to a Text and it will rebuild when this changes

*/

/*
  In order to access state you have different options and they will depend on what you want to achieve
  in the following code T is a cubit

  1.- BlocProvider.of<T>(context)
  as explained above this fuction lets us consume the funtions in a cubit to modify state
  and also listen to state changes

   1.1- BlockProvider<T>(T create, Widget child)
   This signature will let us do some "dependency injection" meaning that we create the instance of bloc or cubit
   by wrapping the childs with this signature, this will let us use the static function mentioned above

  2.- BlocBuilder<Cubit, State>(Builder builder)
  This function could be interchanged with context.watch function
  This function most important parameter is builder which lets us return a widget in which we can consume 
  a context and a state, we can listen state properties and the UI will update when they change, we should
  not add any UI logic that will cause events to trigger like displaying a dialog just purely a UI listening to properties

  3.- BlocListener<Cubit, State>(Listener listener, Widget child)
  This is useful when we need to add logic to launch or display UI when events that depend on state happens
  like displaying a dialog, we could nest a bloc builder inside the child parameter so we could update/rebuild a screen when 
  state changes but also at the same time enable state changes trigger events at the same time but for this we will see
  another function in the next section, but this would be useful if our screen is not updating due to state changes

  4.- BlocConsumer<Cubit, State>(Listener listener, Builder builder)
  Here as you can see you can have a listener and a builder

  5.- MultiBlocProvider(
        providers: [ 
          BlocProvider<CubitOrBlocA>(create: (context) => CubitOrBlocA()),
          BlocProvider<CubitOrBlocB>(create: (context) => CubitOrBlocB())
          ],
        child: some widget(s)
        )
  We can use this function when two cubit or blocs need to interact for example if CubitOrBlocB depends on some
  state value of CubitOrBlocA, the other option is to wrap the latter inside the former with a blocListener and 
  monitor state change/values inside the listener parameter callback and call functions if it is a cubit or 
  add events to stream if it is a bloc

  6.- blocProvider.value(
    value: context.read<CubitOrBloc>(),
    child: some widget/new page that consumes the same cubit/bloc as one in the current screen
  )

  We could use this signature to inject a cubit/bloc in the current screen to another screen when navigating and the
  next/other screen will consume the same instance of the cubit/bloc. The context used to find the cubit has to be same
  as the context it was used to create the cubit or a context that has access to it like "pure" child

  However there are different ways to navigate just using "Navigator.push" which is an anonymous route access, in this
  scenario you can just use the function above. 
  
  The next option is using material app route parameter(Named route access), in this option since we need the same instance of cubit we would 
  need to have a parent widget that would create an instance of the cubit/bloc directly and then in the route just use the
  fuction above to provide the value however you would need to wrap the material app containing the routes inside a statefull 
  widget to be able to dispose of the cubit/bloc by overriding function "void dispose()" and calling "cubit.close"

  when navigating using "Generated route access" basically you need to add a parameter using the same widget "MaterialApp" and 
  instead of specifying "routes" parameter you specify a parameter called "onGenerateRoute" which provides a call back
  with "RouteSettings" object you can evaluate the "name" parameter of routesettings and return a "MaterialPageRoute" which
  will wrap the desired screen inside a ".value" signature (Note this has to follow the same patter as above in which 
  we dispose of the cubit "manually")

  however you can always just wrap the widgets inside a block provider and that way we could have access to the cubit, for example
  we can wrap material app inside a blocProvider constructor and then have access to the same cubit instance and then 
  avoid having to worry about disposing cubit
*/

/*
  You can define an bloc Event transformer in 3 different ways

  1.- In event handler inside the bloc class definition, following code is written in the bloc's constructor tipically

    void on<E extendes Event>(
      EventHandler<E, State> handler,
      {EvebtTranforme<E>? transformer}
    )
  
  2.- YOu can override/assign all event transfromer of all events in the app, by overriding this the "Bloc.transformer"
  in the main app function

    void main() {
      Bloc.transformer = someTransformer<dynamic>();
    }

  3.- You can specify the transformer you want to apply to each different bloc with a "Zone" approach

    BlocOverrides.runZoned(
      () {
        final overrides = BlocOverrides.current;

        BlockOverrides(
          () {
            final overrides = BlocOverrides.current;
          },
          blocObserver: blocBObserver(),
          eventTransformer: blocBEventTransformer()
        );
      },
      blocObserver: blocAObserver(),
      eventTransformer: blocBTransformer()
    )
*/