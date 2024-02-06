import 'package:flutter/material.dart';
import 'package:adivinanza/injection_container.dart';
import 'package:adivinanza/core/util/app_color.dart';
import 'package:adivinanza/core/base/base_page.dart';
import 'package:adivinanza/core/widget/custom_button.dart';
import 'package:adivinanza/core/widget/alert_animation.dart';
import 'package:adivinanza/core/widget/custom_painter_widget.dart';
import 'package:adivinanza/core/extension/containerExtension.dart';
import 'package:adivinanza/core/widget/custom_animate_container.dart';
import 'package:adivinanza/features/home/presentation/cubit/home_cubit.dart';

class Home extends BasePage<HomeState, HomeCubit> {
  const Home({super.key});

  @override
  HomeCubit createBloc(BuildContext context) => sl<HomeCubit>()..init(context);

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CustomPaint(
                painter: CustomPainterWidget(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image(
                          height: context.sizeHeight * 0.05,
                          image: AssetImage("assets/image/rompecabezas.png"),
                        ),
                        Text(
                          "ADIVINA LA PALABRA",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily: "LilitaOne",
                              color: AppColors().textColor,
                              shadows: <Shadow>[
                                Shadow(
                                  blurRadius: 8.0,
                                  color: AppColors().black,
                                  offset: const Offset(1.0, 1.0),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: List.generate(
                            state.initialWord.length,
                            (index) => Container(
                              width: context.sizeHeight * 0.07,
                              height: context.sizeHeight * 0.07,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(horizontal: 1),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(color: AppColors().disable)
                                ],
                                border: Border.all(
                                  width: 2,
                                  color: AppColors().primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                bloc.generateWord(index),
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: "LilitaOne",
                                    fontWeight: FontWeight.w800,
                                    color: AppColors().textColor,
                                    shadows: <Shadow>[
                                      Shadow(
                                        blurRadius: 8.0,
                                        color: AppColors().black,
                                        offset: const Offset(1.0, 1.0),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 3,
                          runSpacing: 3,
                          children: List.generate(
                            state.alfabeto.length,
                            (index) => Material(
                              elevation: 2,
                              color: AppColors().primaryColor,
                              borderRadius: BorderRadius.circular(5),
                              child: InkWell(
                                onTap: () =>
                                    bloc.tapInLetter(state.alfabeto[index]),
                                child: Container(
                                  width: context.sizeHeight * 0.07,
                                  height: context.sizeHeight * 0.07,
                                  alignment: Alignment.center,
                                  child: Text(
                                    state.alfabeto[index].toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: "LilitaOne",
                                        fontWeight: FontWeight.w800,
                                        color: AppColors().textColor,
                                        shadows: <Shadow>[
                                          Shadow(
                                            blurRadius: 8.0,
                                            color: AppColors().black,
                                            offset: const Offset(1.0, 1.0),
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: context.sizeHeight * 0.005),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Material(
                                elevation: 2,
                                color: AppColors().primaryColor,
                                borderRadius: BorderRadius.circular(5),
                                child: InkWell(
                                  onTap: bloc.refreshController,
                                  child: Container(
                                    width: context.sizeHeight * 0.07,
                                    height: context.sizeHeight * 0.07,
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.refresh,
                                      color: AppColors().textColor,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 8.0,
                                          color: AppColors().black,
                                          offset: const Offset(1.0, 1.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: context.sizeHeight * 0.005),
                              Material(
                                elevation: 2,
                                color: AppColors().primaryColor,
                                borderRadius: BorderRadius.circular(5),
                                child: InkWell(
                                  onTap: bloc.deleteLastLetter,
                                  child: Container(
                                    width: context.sizeHeight * 0.07,
                                    height: context.sizeHeight * 0.07,
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.keyboard_double_arrow_left_rounded,
                                      color: AppColors().textColor,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 8.0,
                                          color: AppColors().black,
                                          offset: const Offset(1.0, 1.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 10,
            child: Material(
              color: AppColors().backgroundColor,
              borderRadius: BorderRadius.circular(100),
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: bloc.goToLogin,
                child: Container(
                  width: context.sizeHeight * 0.07,
                  height: context.sizeHeight * 0.07,
                  alignment: Alignment.center,
                  child: Icon(Icons.login, color: AppColors().textColor),
                ),
              ),
            ),
          ),
          AlertAnimation(
            afterFinished: () => bloc.startAlertAnimation(false),
            startNow: state.activeAlert,
            child: Container(
              decoration: BoxDecoration(
                color: bloc.validateLetterIsSuccessful()
                    ? AppColors().successful
                    : AppColors().error,
                shape: BoxShape.circle,
              ),
              height: context.sizeHeight * 0.5,
              child: Icon(
                  bloc.validateLetterIsSuccessful() ? Icons.check : Icons.clear,
                  color: AppColors().backgroundColor,
                  size: 200),
            ),
          ),
          Positioned(
            left: -40,
            top: 40,
            child: CustomAnimateContainer(
              startNow: bloc.validateLetterIsSuccessful(),
              child: const Image(
                image: AssetImage("assets/image/globo.png"),
                height: 150,
              ),
            ),
          ),
          Positioned(
            right: -40,
            top: 40,
            child: CustomAnimateContainer(
              startNow: bloc.validateLetterIsSuccessful(),
              child: const Image(
                image: AssetImage("assets/image/globo.png"),
                height: 100,
              ),
            ),
          ),
          Positioned(
            left: 40,
            top: 300,
            child: CustomAnimateContainer(
              startNow: bloc.validateLetterIsSuccessful(),
              child: const Image(
                image: AssetImage("assets/image/globo.png"),
                height: 200,
              ),
            ),
          ),
          Positioned(
            right: -40,
            bottom: 40,
            child: CustomAnimateContainer(
              startNow: bloc.validateLetterIsSuccessful(),
              child: const Image(
                image: AssetImage("assets/image/globo.png"),
                height: 150,
              ),
            ),
          ),
          Positioned(
            left: -10,
            bottom: -10,
            child: CustomAnimateContainer(
              startNow: bloc.validateLetterIsSuccessful(),
              child: const Image(
                image: AssetImage("assets/image/papel-picado.png"),
                height: 150,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: CustomAnimateContainer(
                startNow: bloc.validateLetterIsSuccessful(),
                child: CustomButton(
                  label: "Refrescar",
                  onTap: bloc.refreshController,
                )),
          )
        ],
      ),
    );
  }
}
