import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter/harry_item_widget.dart';
import 'bloc/harry_bloc.dart';
import 'data/hive_helper.dart';
import 'data/repository.dart';

class HarryScreen extends StatefulWidget {
  const HarryScreen({super.key});

  @override
  State<HarryScreen> createState() => _HarryScreenState();
}

class _HarryScreenState extends State<HarryScreen> {
  final bloc = HarryBloc(Repository())..add(FetchCharacters());

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
                    return HarryItemWidget(item: list[index]);
                  },
                );
              }

              if (state is Error) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(fontSize: 24),
                  ),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
