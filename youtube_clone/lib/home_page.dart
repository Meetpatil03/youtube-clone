import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/widget/image_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/youtube-logo.png',
                    height: 26,
                  ),
                  const Spacer(),
                  

                  ImageButton(
                      image: 'cast.png',
                      haveColor: false,
                      height: 32,
                      onPressed: () {}),
                

                  const SizedBox(
                    width: 15,
                  ),

                  ImageButton(
                      image: 'notification.png',
                      haveColor: false,
                      height: 30,
                      onPressed: () {}),

                  const SizedBox(
                    width: 15,
                  ),

                  ImageButton(
                      image: 'search.png',
                      haveColor: false,
                      height: 32,
                      onPressed: () {}),

                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
