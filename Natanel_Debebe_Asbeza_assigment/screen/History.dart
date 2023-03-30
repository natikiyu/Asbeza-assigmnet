import 'dart:developer';

import 'package:asbeza/bloc/update_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/update_bloc.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<History> {
  final _service = Service();
  List<Map<String, dynamic>>? itemData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<UpdateBloc, UpdateState>(
        builder: (context, state) {
          if (state is UpdateInitial) {
            return const Center(
                child: Text(
              "Nothing On Cart\n TOTAL: 0\$",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ));
          }
          if (state is UpdateLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UpdateSuccessState) {
            if (state.history.isEmpty) {
              return const Center(
                  child: Text(
                "Nothing On Cart\n TOTAL: 0\$",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ));
            } else {
              // ignore: non_constant_identifier_names
              num TotalPrice = 0;
              // ignore: no_leading_underscores_for_local_identifiers
              void _incrementCounter() {
                for (var element in state.history) {
                  TotalPrice += element.price;
                }
              }

              _incrementCounter();
              return Container(
                decoration: const BoxDecoration(
                      gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff4b2d1f),
                        Color(0xff0b0f15),
                        Color(0xff0b0f15),
                      ],
                    )
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "TOTAL: ${TotalPrice.toStringAsFixed(2)}\$",
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: MediaQuery.of(context).size.height * .84,
                      child: ListView.builder(
                        itemCount: state.history.length,
                        itemBuilder: (BuildContext context, int index) {
                          final asbezaVal = state.history[index];
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color(0xff0b0f15),
                                        Colors.white,
                                        Colors.white,
                                      ],
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: NetworkImage(
                                                      asbezaVal.image))),
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  .1,
                                          width: MediaQuery.of(context).size.width *
                                              .3,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 11, vertical: 5),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width *
                                              .4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(asbezaVal.name),
                                              Text(
                                                "${asbezaVal.price}\$",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}
