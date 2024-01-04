import 'package:api/index.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_ui/index.dart';

import 'bloc/cast_drew_bloc.dart';

class CastAndDrew extends StatefulWidget {
  final ObjectResponse<CastCrew> castCrew;
  const CastAndDrew({super.key, required this.castCrew});

  @override
  State<CastAndDrew> createState() => _CastAndDrewState();
}

class _CastAndDrewState extends State<CastAndDrew> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF15141f),
        appBar: AppBar(
          title: Text(
            'Cast & Crew ',
            style: TextStyles.tittle,
          ),
          backgroundColor: Colors.transparent, // Xóa màu nền của AppBar
          elevation: 0, // Xóa đổ bóng của AppBar
        ),
        body: BlocProvider(
          create: (context) => CastCrewBloc()
            ..add(GetDataCastCrew(
                language: 'en-US', movieId: widget.castCrew.object.id ?? 0)),
          child: BlocBuilder<CastCrewBloc, CastCrewState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case ListDataCastCrew:
                  return Column(
                    children: [
                      SearchWidget(
                          textedit: search,
                          hint: 'Search',
                          color: CustomColors.rectangle,
                          function: (query) {}),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.all(20),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 0.55,
                          ),
                          itemCount: (state.casts?.object.cast?.length ?? 0) +
                              (state.casts?.object.crew?.length ?? 0),
                          itemBuilder: (BuildContext context, int index) {
                            if (index <
                                (state.casts?.object.cast?.length ?? 0)) {
                              final castMember =
                                  state.casts?.object.cast?[index];
                              return CastDrewItem(
                                imageUrl: castMember?.profilePath ?? '',
                                name:
                                    '${castMember?.name} (${castMember?.knownForDepartment})',
                              );
                            } else {
                              final crewIndex = index -
                                  (state.casts?.object.cast?.length ?? 0);
                              final crewMember =
                                  state.casts?.object.crew?[crewIndex];
                              return CastDrewItem(
                                imageUrl: crewMember?.profilePath ?? '',
                                name:
                                    '${crewMember?.name} (${crewMember?.knownForDepartment})',
                              );
                            }
                          },
                        ),
                      )
                    ],
                  );
                default:
              }
              return Container();
            },
          ),
        ));
  }
}
