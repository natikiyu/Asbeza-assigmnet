import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asbeza/screen/History.dart';
import 'package:asbeza/screen/Account.dart';
import '../bloc/update_bloc.dart';
import '../bloc/update_state.dart';

class Item_screen extends StatelessWidget {
  Item_screen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _pageDetails = [
    //{'pageName': Item_screen(),'title': 'Home'},
    {'pageName': History(),'title': 'History'},
    {'pageName': Account(),'title': 'Account'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UpdateBloc, UpdateState>(
        listener: (UpdateBloc,UpdateState){
          print(State);
        },
        builder: (context, state) {
      if (state is UpdateInitial) {
        return Container(

          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: ElevatedButton(
              onPressed: () {

                BlocProvider.of<UpdateBloc>(context)
                    .add(GetDataButtonPressed());
              },
              child: const Text('Get Activity')),
        );
      }else if (state is UpdateLoadingState) {
       return const Center(child: CircularProgressIndicator());
      }else if (state is UpdateFailState) {
        return Text(state.message);
      }else if (state is UpdateSuccessState) {
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
          margin: const EdgeInsets.only(top: 5),
          height: MediaQuery.of(context).size.height * .92,
          child: ListView(
            children: [Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30,right: 350),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xffe3722f),
                  ),
                  child: Icon(Icons.list),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xff323747),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.search)
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.item.length,
                    itemBuilder: (BuildContext context, int index) {
                      final itemList = state.item[index];
                      return Container(

                        child: Stack(
                          children: [
                            Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xff0b0f15),
                                    Colors.white,
                                    Colors.white,
                                  ],
                                )
                            ),
                            height : 100,

                            margin: EdgeInsets.symmetric(horizontal: 50 ,vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: NetworkImage(itemList.image))),
                                      height: MediaQuery.of(context).size.height * .2,
                                      width: MediaQuery.of(context).size.width * .3,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 11, vertical: 5),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .4,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 20,),
                                          Text(itemList.name),
                                          Text(
                                            "${itemList.price}\$",
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
                            Container(
                              decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.only(
                                  //   topRight: Radius.circular(60),
                                  // ),
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xffe3722f),
                              ),
                              height: 40,
                              width: 150,

                              margin: EdgeInsets.only(left: 280, right: 10,top: 100),
                              child: TextButton(
                                onPressed: () {
                                  BlocProvider.of<UpdateBloc>(context)
                                      .add(HistoryEvent(item: itemList));
                                },
                                child: Text(
                                    'Add to cart ->',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ]
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),]
          ),
        );
      }
      return Container(

      );


        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffe3722f),
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => History()));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:0,
        onTap: (index){},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history),label:'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:'Account'),
        ],
      ),
    );
  }
}
