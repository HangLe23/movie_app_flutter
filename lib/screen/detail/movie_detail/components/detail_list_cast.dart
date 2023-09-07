import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/api/apis/api_client/index.dart';
import 'package:movie_app_flutter/api/rest_api/rest_api_client.dart';
import 'package:movie_app_flutter/models/model.dart';
import 'package:movie_app_flutter/responsitories/repository.dart';
import 'package:movie_app_flutter/screen/cast_and_drew/cast_crew_index.dart';
import 'package:movie_app_flutter/untils/untils.dart';
import 'package:movie_app_flutter/widget/items/item.dart';

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
            return Column(
              children: [
                Row(children: [
                  const SizedBox(width: 20),
                  Text('Cast & Crew', style: TextStyles.lato500Size19),
                  const Spacer(),
                  TextButton(
                    onPressed: () async {
                      final casts =
                          await CreditRepository(restApiClient: RestApiClient())
                              .getCastCrew(
                                  movieId: state.casts?.object.id ?? 0,
                                  language: 'en-US');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CastAndDrew(castCrew: casts),
                        ),
                      );
                    },
                    child: Text('More... ', style: TextStyles.decription),
                  )
                ]),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      for (final cast in state.casts?.object.cast ?? [])
                        Container(
                          width: 150,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CastDrewItem(
                            imageUrl: cast?.profilePath ?? '',
                            name: cast?.name ?? '',
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          default:
            return Container();
        }
      }),
    );
  }
}
