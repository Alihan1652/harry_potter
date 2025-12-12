import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter/harry_item_widget.dart';
import 'bloc/harry_bloc.dart';

class HarryScreen extends StatefulWidget {
  const HarryScreen({super.key});

  @override
  State<HarryScreen> createState() => _HarryScreenState();
}

class _HarryScreenState extends State<HarryScreen> {
  final bloc = HarryBloc()..add(FetchCharacters());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => bloc,
        child: Scaffold(
          body: BlocBuilder<HarryBloc, HarryState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is Success) {
                final list = state.listModels;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return HarryItemWidget(item: item);
                  },
                );
              } else if (state is Error) {
                return Center(
                  child: Text(
                    state.message,
                    style: TextStyle(fontSize: 50),
                  ),
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
