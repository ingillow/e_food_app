import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:untitled/bloc/bottom_nav_bloc/bottom_nav_event.dart';
import 'package:untitled/bloc/bottom_nav_bloc/bottom_nav_state.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state){
        if (state is TabSelectedState) {
          return  BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.red,
            currentIndex:state.selectedIndex,
            onTap: (index) {
              BlocProvider.of<NavigationBloc>(context).add(
                  TabSelectedEvent(index));
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home,color: Colors.black38,),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.black38,),
                label: 'Поиск',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.delete, color: Colors.black38,),
                label: 'Корзина',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.black38,),
                label: 'Аккаунт',
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

