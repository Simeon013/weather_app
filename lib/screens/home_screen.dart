import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.position});

  final Position position;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Widget getWeatherIcon(int code) {
  //   switch (code) {
  //     case >= 200 && < 300:
  //       return Image.asset('assets/1.png');
  //     case >= 300 && < 400:
  //       return Image.asset('assets/2.png');
  //     case >= 500 && < 600:
  //       return Image.asset('assets/3.png');
  //     case >= 600 && < 700:
  //       return Image.asset('assets/4.png');
  //     case >= 700 && < 800:
  //       return Image.asset('assets/5.png');
  //     case == 800:
  //       return Image.asset('assets/6.png');
  //     case > 800 && <= 804:
  //       return Image.asset('assets/7.png');
  //     default:
  //       return Image.asset('assets/7.png');
  //   }
  // }

  Widget getWeatherIcon(int code) {
    bool isDay = DateTime.now().hour > 6 && DateTime.now().hour < 19;


    switch (code) {
      // 200-202
      case >=200 && <= 202:
        return Image.asset('assets/weather_icons/200-202.png');
      // 210-212
      case >=210 && <= 212:
        return Image.asset('assets/weather_icons/210-212.png');
      // 221
      case == 221:
        return Image.asset('assets/weather_icons/221.png');
      // 230-232
      case >=230 && <= 232:
        return Image.asset('assets/weather_icons/230-232.png');
      // 300d 300n
      case == 300:
        return isDay
          ? Image.asset('assets/weather_icons/300d.png')
          : Image.asset('assets/weather_icons/300n.png');
      // 301-302
      case >=301 && <= 302:
        return Image.asset('assets/weather_icons/301-302.png');
      // 310-312d 310-312n
      case >=310 && <= 312:
        return isDay 
          ? Image.asset('assets/weather_icons/310-312d.png')
          : Image.asset('assets/weather_icons/310-312n.png');
      // 313-321d 313-321n
      case >=313 && <= 321:
        return isDay
          ? Image.asset('assets/weather_icons/313-321d.png')
          : Image.asset('assets/weather_icons/313-321n.png');
      // 500-501
      case >=500 && <= 501:
        return Image.asset('assets/weather_icons/500-501.png');
      // 502-504
      case >=502 && <= 504:
        return Image.asset('assets/weather_icons/502-504.png');
      // 511
      case == 511:
        return Image.asset('assets/weather_icons/511.png');
      // 520-521
      case >=520 && <= 521:
        return Image.asset('assets/weather_icons/520-521.png');
      // 522-231
      case >=522 && <= 531:
        return Image.asset('assets/weather_icons/522-531.png');
      // 600
      case == 600:
        return Image.asset('assets/weather_icons/600.png');
      // 601-602
      case >=601 && <= 602:
        return Image.asset('assets/weather_icons/601-602.png');
      // 611-613
      case >=611 && <= 613:
        return Image.asset('assets/weather_icons/611-613.png');
      // 615-616
      case >=615 && <= 616:
        return Image.asset('assets/weather_icons/615-616.png');
      // 620-622
      case >=620 && <= 622:
        return Image.asset('assets/weather_icons/620-622.png');
      // 700d 700n
      case >=700 && < 800:
        return isDay
          ? Image.asset('assets/weather_icons/700d.png')
          : Image.asset('assets/weather_icons/700n.png');
      // 800d 800n
      case == 800:
        return isDay
          ? Image.asset('assets/weather_icons/800d.png')
          : Image.asset('assets/weather_icons/800n.png');
      // 801-802d 801-802n
      case >=801 && <= 802:
        return isDay
          ? Image.asset('assets/weather_icons/801-802d.png')
          : Image.asset('assets/weather_icons/801-802n.png');
      // 803-804
      case >=803 && <= 804:
        return Image.asset('assets/weather_icons/803-804.png');
      
      default :
        return Image.asset('assets/weather_icons/default.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    String salutation;

    DateTime now = DateTime.now();
    if (now.hour < 12) {
      salutation = 'Good Morning';
    } else if (now.hour < 17) {
      salutation = 'Good Afternoon';
    } else {
      salutation = 'Good Evening';
    }

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFF673AB7)),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 400,
                  decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if (state is WeatherBlocSuccess) {
                    final weather = state.weather;
                    // print('Weather : ${weather.weatherIcon}');
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '📍${weather.areaName} ${weather.country}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              const Spacer(),
                              Image.network(
                                  'https://openweathermap.org/img/wn/${weather.weatherIcon}.png')
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                salutation,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              // refresh icon button
                              IconButton(
                                onPressed: () {
                                  context.read<WeatherBlocBloc>().add(FetchWeather(position: widget.position));
                                },
                                icon: const Icon(Icons.refresh, color: Colors.white),
                              )
                            ],
                          ),
                          Center(
                            child: SizedBox(
                              height: 300,
                              child: getWeatherIcon(weather.weatherConditionCode!),
                            ),
                          ),
                          Center(
                            child: Text(
                              '${weather.temperature!.celsius!.round()}°C',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Center(
                            child: Text(
                              weather.weatherDescription!.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text(
                              // DateFormat('EEEE dd • HH:mm').format(weather.date!),
                              DateFormat('EEEE dd • HH:mm')
                                  .format(DateTime.now()),
                              // 'Vendredi 13 • 00:00',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/11.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Jour',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        DateFormat('HH:mm')
                                            .format(weather.sunrise!),
                                        // '06:36',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              // SizedBox(
                              //   width: MediaQuery.of(context).size.width * 0.1,
                              // ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/12.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Nuit',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        DateFormat('HH:mm')
                                            .format(weather.sunset!),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Divider(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/13.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Max',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        '${weather.tempMax!.celsius!.round()}°C',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              // SizedBox(
                              //   width: MediaQuery.of(context).size.width * 0.1,
                              // ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/14.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Min',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        '${weather.tempMin!.celsius!.round()}°C',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                        child: Column(
                      children: [
                        // Icon(Icons.error_outline, size: 60, color: Colors.white,),
                        CircularProgressIndicator(),
                        Text(
                          'Loading...',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
