import 'package:f1_app/bloc/season/season_bloc.dart';
import 'package:f1_app/style/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DriverPage extends StatefulWidget {
  const DriverPage({super.key});

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F4F0),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Drivers", style: titleStyleText),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/backMenu.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.20,
                fit: BoxFit.cover,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(221, 59, 54, 54),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 2, color: Colors.grey),
                      right: BorderSide(width: 2, color: Colors.grey),
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "All Driver F1 In History",
                      style: titleContent,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<SeasonBloc, SeasonState>(
              builder: (context, state) {
                if (state is SeasonLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is SeasonSucces) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: state.season.championships?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    state.season.championships?[index].year
                                            .toString() ??
                                        "Null",
                                    style: headerText,
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          width: 2,
                                          color: Colors.grey,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        state
                                                .season
                                                .championships?[index]
                                                .championshipName ??
                                            " ",
                                        style: normalText,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(child: Text("Data Kosong"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
