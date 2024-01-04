import 'package:api/index.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:shared_ui/index.dart';

class ListCast extends StatefulWidget {
  final ObjectResponse<Detail> detail;
  const ListCast({Key? key, required this.detail}) : super(key: key);

  @override
  State<ListCast> createState() => _ListCastState();
}

class _ListCastState extends State<ListCast> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CastCrewBloc()
        ..add(GetDataCastCrew(
            language: 'en-US', movieId: widget.detail.object.id ?? 0)),
      child:
          BlocBuilder<CastCrewBloc, CastCrewState>(builder: (context, state) {
        switch (state.runtimeType) {
          case ListDataCastCrew:
            return Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.casts?.object.cast?.length ?? 0,
                padding: const EdgeInsets.only(left: 20),
                itemBuilder: (BuildContext context, int index) {
                  final cast = state.casts?.object.cast?[index];
                  return CastDrewItem(
                    imageUrl: cast?.profilePath ?? '',
                    name: cast?.name ?? '',
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 10);
                },
              ),
            );

          default:
            return Container();
        }
      }),
    );
  }
}
