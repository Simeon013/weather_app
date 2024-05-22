import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark
        ),
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
                    shape: BoxShape.circle,
                    color: Colors.deepPurple
                  ),
                ),
              ),
              
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF673AB7)
                  ),
                ),
              ),
              
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 400,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFAB40)
                  ),
                ),
              ),

              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '📍Cotonou, Benin',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Bonjour',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Image.asset(
                      'assets/1.png'
                    ),
                    const Center(
                      child: Text(
                        '21°C',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'ORAGEUX',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Center(
                      child: Text(
                        'Vendredi 13 • 00:00',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/11.png',
                              scale: 8,
                            ),
                            const SizedBox(width: 5,),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jour',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300
                                  ),
                                ),
                                SizedBox(height: 3,),
                                Text(
                                  '06:36',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/12.png',
                              scale: 8,
                            ),
                            const SizedBox(width: 5,),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nuit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300
                                  ),
                                ),
                                SizedBox(height: 3,),
                                Text(
                                  '18:43',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                  ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/13.png',
                              scale: 8,
                            ),
                            const SizedBox(width: 5,),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Max',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300
                                  ),
                                ),
                                SizedBox(height: 3,),
                                Text(
                                  '22°C',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/14.png',
                              scale: 8,
                            ),
                            const SizedBox(width: 5,),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Min',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300
                                  ),
                                ),
                                SizedBox(height: 3,),
                                Text(
                                  '8°C',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}