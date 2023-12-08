import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Lorem sddfs dsfsdfgr fdfsrege dfgdsfgdf dfgsd',
      'assets/images/1.png'),
  SlideInfo('Entrega rapida', 'Lorem sddfs dsfsdfgr fdfsrege dfgdsfgdf dfgsd',
      'assets/images/2.png'),
  SlideInfo('Disfruta la comida',
      'Lorem sddfs dsfsdfgr fdfsrege dfgdsfgdf dfgsd', 'assets/images/3.png')
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();

  bool endReached = false;

  // PARTE DEL CICLO DE VIDA DE LOS STATEFUL WIDGETS
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        // CUIADO AL LLAMAR UN SET STATE DENTRO DE UN
        // INITSTATE Y UN LISTENER
        setState(() {
          endReached = true;
        });
      }
      print('${pageViewController.page}');
    });
  }

  // AL TERMINAR EL CICLO DE VIDA DE LOS CONTROLADORES
  // LAMAR EL DISPOSE
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      slideData.title, slideData.caption, slideData.imageUrl))
                  .toList(),
            ),
            Positioned(
                right: 20,
                top: 50,
                child: TextButton(
                    child: const Text(
                      'Salir',
                    ),
                    onPressed: () {
                      context.pop();
                    })),
            endReached
                ? Positioned(
                    bottom: 30,
                    right: 30,
                    child: FadeInRight(
                      from: 15,
                      delay: const Duration(seconds: 1),
                      child: FilledButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text('Comenzar')),
                    ))
                : const SizedBox()
          ],
        ));
  }
}

class _Slide extends StatelessWidget {
  const _Slide(this.title, this.caption, this.imageUrl);

  final String title;
  final String caption;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle)
          ],
        ),
      ),
    );
  }
}
