import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transformer_page_view_tv/transformer_page_view.dart';

import '../../../core/bases.dart';
import '../../../core/utils/transformers.dart';
import '../blocs/boarding_bloc.dart';
import '../blocs/boarding_state.dart';
import 'boarding_page.dart';

class BoardingView extends GetBlocView<BoardingCubit> {
  const BoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: bloc.controller,
              itemCount: bloc.totalPages,
              itemBuilder: (_, __) => Container(
                height: double.infinity,
                width: double.infinity,
                color: const Color(0xff495057),
              ),
            ),
            TransformerPageView.children(
              children: bloc.state.data
                  .map(
                    (value) => BoardingPage(
                      title: value.title,
                      subTitle: value.subTitle,
                      description: value.description,
                      image: AssetImage(value.imagePath),
                    ),
                  )
                  .toList(),
              scrollDirection: Axis.horizontal,
              transformer: DeepthPageTransformer(),
              duration: const Duration(milliseconds: 900),
              onPageChanged: bloc.onPageChanged,
              controller: bloc.tController,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SmoothPageIndicator(
                            controller: bloc.controller,
                            count: bloc.totalPages,
                            effect: const WormEffect(
                              activeDotColor: Colors.white,
                              dotWidth: 10,
                              dotHeight: 10,
                              spacing: 6,
                            ),
                          ),
                          InkWell(
                            onTap: bloc.onButtonPressed,
                            child: BlocBuilder<BoardingCubit, BoardingState>(
                              bloc: bloc,
                              builder: (context, state) => Text(
                                state.currentPage > state.data.length - 2
                                    ? 'GET STARTED'
                                    : 'NEXT',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
