import 'package:bloc_architect/bloc/catlog_bloc.dart';
import 'package:bloc_architect/bloc/catlog_event.dart';
import 'package:bloc_architect/bloc/catlog_state.dart';
import 'package:bloc_architect/persistence/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/main_model.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
          create: (BuildContext c) =>
              CatLogBloc(Repository())..add(EventLoaded()),
          child: MyHomePage())));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MainModel?> list = [];
  CatLogBloc? _catLogBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          child: BlocBuilder<CatLogBloc, CatelogState>(
            builder: ((context, state) {
              if (state is CatelogLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Catelogloaded) {
                list.clear();
                list.add(state.mainModel);
                return Center(child: listData(list));
              } else {
                return Center(
                  child: Text('Something went wrong'),
                );
              }
            }),
          ),
        ),
      ),
    );
  }

  Widget listData(List<MainModel?> list) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (ctx, i) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('longitude' + list[i]!.coord!.lon.toString()),
              Text('latitude' + list[i]!.coord!.lat.toString()),
              Text('humidity' + list[i]!.main!.humidity.toString()),
              Text('temperature' + list[i]!.main!.temp.toString()),
              Text('description' + list[i]!.weather![i].description.toString()),
            ],
          );
        });
  }
}
