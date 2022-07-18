import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:uas/model/dosen.dart';
import 'package:uas/screen/edit/edit_screen.dart';
import 'package:uas/screen/home/components/item_data.dart';

import '../../data/remote/viewstate.dart';
import '../../utils/app_route.dart';
import '../dosen_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showFab = true;

  @override
  void initState() {
    super.initState();
    context.read<DosenViewModel>().getAllDosen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Data Dosen',
            style: TextStyle(color: Colors.black),
          )),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          setState(() {
            if (direction == ScrollDirection.reverse) {
              _showFab = false;
            } else if (direction == ScrollDirection.forward) {
              _showFab = true;
            }
          });
          return true;
        },
        child: Consumer<DosenViewModel>(
          builder: (context, vm, child) {
            vm.getAllDosen();
            return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: vm.listDosen.length,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemBuilder: (context, index) {
                      final Dosen dosen = vm.listDosen[index];
                      return ItemData(
                        dosen: dosen,
                      );
                    });
          },
        ),
      ),
      floatingActionButton: AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        offset: _showFab ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: _showFab ? 1 : 0,
          child: FloatingActionButton(
            onPressed: () => AppRoute.to(const EditScreen()),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
