import 'package:f1_app/bloc/season/season_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.amber),
            child: Image.asset(
              'assets/images/logos.jpg',
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<SeasonBloc>().add(SeasonGet());
              Navigator.popAndPushNamed(context, '/driver');
            },
            child: Text("Drivers"),
          ),
        ],
      ),
    );
  }
}
