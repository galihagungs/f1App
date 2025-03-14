import 'package:f1_app/bloc/standing/standing_bloc.dart';
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
  void initState() {
    super.initState();
    context.read<StandingBloc>().add(LastYearChamp());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F4F0),
      appBar: AppBar(
        backgroundColor: Color(0xffee0000),
        title: Text("Drivers", style: titleStyleText),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/backMenu.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.30,
                fit: BoxFit.cover,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(221, 59, 54, 54),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
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
                    SizedBox(height: 10),
                    BlocBuilder<StandingBloc, StandingState>(
                      builder: (context, state) {
                        if (state is StandingLoading) {
                          return CircularProgressIndicator(color: Colors.white);
                        } else if (state is StandingSucces) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Last World Champion Driver",
                                style: titleSecondContent,
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff1d1d1b),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 20,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state
                                                .standings
                                                .driversChampionship![0]
                                                .driver!
                                                .name
                                                .toString(),
                                            style: TextStyle(
                                              fontFamily: "Black Ops One",
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            state
                                                .standings
                                                .driversChampionship![0]
                                                .driver!
                                                .surname
                                                .toString()
                                                .toUpperCase(),
                                            style: TextStyle(
                                              fontFamily: "Black Ops One",
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            state.standings.season.toString(),
                                            style: header2Text,
                                          ),
                                          Text(
                                            state
                                                    .standings
                                                    .driversChampionship![0]
                                                    .team!
                                                    .teamName ??
                                                'Unknown Team',
                                            style: header2TextWhite,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        return Text("");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(children: [
              
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, right: 25),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 5, color: Color(0xfff10000)),
                        right: BorderSide(width: 5, color: Color(0xfff10000)),
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
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
                              child: Padding(
                                padding: const EdgeInsets.only(right: 50),
                                child: InkWell(
                                  onTap: () {
                                    context.read<StandingBloc>().add(
                                      GetYearSeasonDriver(
                                        year:
                                            state
                                                .season
                                                .championships![index]
                                                .year!,
                                      ),
                                    );
                                    Navigator.pushNamed(context, '/standings');
                                  },
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
                                              state
                                                      .season
                                                      .championships?[index]
                                                      .year
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
                                                padding: const EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      state
                                                              .season
                                                              .championships?[index]
                                                              .championshipName ??
                                                          " ",
                                                      style: normalText,
                                                    ),
                                                    Icon(Icons.arrow_right),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
          ),
        ],
      ),
    );
  }
}
