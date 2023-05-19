import 'package:bloc_api/bloc/c_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_api/data/model/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagee extends StatefulWidget {
  const Pagee({Key? key}) : super(key: key);

  @override
  State<Pagee> createState() => _PageeState();
}

class _PageeState extends State<Pagee> {

  final CBloc _bloc = CBloc();

  @override
  void initState() {
    _bloc.add(GetCList());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CList"),),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _bloc,
        child: BlocListener<CBloc, CState>(
          listener: (context, state) {
            if (state is CError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<CBloc, CState>(
            builder: (context, state) {
              if (state is CInitial) {
                return _buildLoading();
              } else if (state is CLoading) {
                return _buildLoading();
              } else if (state is CLoaded) {
                return _buildCard(state.covidModel);
              } else if (state is CError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(CovidModel model) {
    return ListView.builder(
      itemCount: model.countries!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Country: ${model.countries![index].country}"),
                  Text(
                      "Total Confirmed: ${model.countries![index].totalConfirmed}"),
                  Text("Total Deaths: ${model.countries![index].totalDeaths}"),
                  Text(
                      "Total Recovered: ${model.countries![index].totalRecovered}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
