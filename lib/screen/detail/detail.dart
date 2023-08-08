import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/screen/detail/bloc/detail_bloc.dart';
import 'package:movie_app_flutter/untils/Icons/icons.dart';
import 'package:movie_app_flutter/widget/cards.dart';
import 'package:movie_app_flutter/widget/driver.dart';

import '../../untils/Colors/colors.dart';
import '../../untils/Icons/icon_play.dart';
import '../../untils/TextStyles/TextStyles.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroudcolor,
      body: Column(children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/banner_detail.png',
            ),
            Positioned(
                left: 20,
                top: 30,
                child: CardWidget(
                    color: Colors.white30,
                    widget: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                    radius: 55,
                    width: 55,
                    height: 55)),
            Positioned(
                left: 175,
                top: 150,
                child: CardWidget(
                  widget: Center(
                    child: IconPlay(
                      onTap: () {},
                    ),
                  ),
                  radius: 77,
                  width: 77,
                  height: 77,
                  color: Colors.white30,
                ))
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              'Star Wars: The Last Jadi',
              style: TextStyles.lato500Size28,
            ),
            const SizedBox(
              width: 10,
            ),
            CardWidget(
                widget:
                    Center(child: Text('4K', style: TextStyles.lato400Size14)),
                radius: 6,
                width: 34.95,
                height: 26.55,
                color: CustomColors.rectangle)
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            CustomIcons.time,
            const SizedBox(
              width: 5,
            ),
            Text(
              '152 minutes',
              style: TextStyles.decription,
            ),
            const SizedBox(
              width: 20,
            ),
            CustomIcons.starGrey,
            const SizedBox(
              width: 5,
            ),
            Text(
              '7.0 (IMDb)',
              style: TextStyles.decription,
            )
          ],
        ),
        DriverWidget(
            height: 1, width: double.infinity, color: CustomColors.lineWhite),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              'Release date',
              style: TextStyles.lato500Size19,
            ),
            const Spacer(),
            Text(
              'Genre',
              style: TextStyles.lato500Size19,
            ),
            const SizedBox(
              width: 100,
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              'December 9, 2017',
              style: TextStyles.decription,
            ),
            const SizedBox(
              width: 85,
            ),
            CardWidget(
                widget: Center(
                  child: Text(
                    'Action',
                    style: TextStyles.decription,
                  ),
                ),
                radius: 18,
                width: 72,
                height: 30,
                color: CustomColors.rectangle),
            const SizedBox(
              width: 5,
            ),
            CardWidget(
                widget: Center(
                  child: Text(
                    'Sci-Fi',
                    style: TextStyles.decription,
                  ),
                ),
                radius: 18,
                width: 72,
                height: 30,
                color: CustomColors.rectangle),
          ],
        ),
        DriverWidget(
            height: 1, width: double.infinity, color: CustomColors.lineWhite),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              'Overview',
              style: TextStyles.lato500Size19,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                'Rey (Daisy Ridley) finally manages to find the legendary Jedi knight, Luke Skywalker (Mark Hamill) on an island with a magical aura. The heroes of The Force Awakens including Leia, Finn',
                style: TextStyles.decription,
                softWrap: true,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              'Cast & Drew',
              style: TextStyles.lato500Size19,
            ),
            const Spacer(),
            BlocProvider(
              create: (context) => DetailBloc(),
              child: BlocBuilder<DetailBloc, DetailState>(
                builder: (context, state) {
                  if (state is DetailInitial || state is Switched) {
                    return TextButton(
                      onPressed: () {
                        BlocProvider.of<DetailBloc>(context)
                            .add(SwitchScreen(context: context));
                      },
                      child: Text(
                        'More... ',
                        style: TextStyles.decription,
                      ),
                    );
                  } else if (state is LoadSwitch) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Container();
                },
              ),
            )

            // Handle other states or edge cases
          ],
        ),
      ]),
    );
  }
}
