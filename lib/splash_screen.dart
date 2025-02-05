import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/WhatsApp Video 2025-02-05 at 07.40.22.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setLooping(false); // Não repetir o vídeo
        });
        // Navegar após a duração do vídeo
        Future.delayed(Duration(seconds: 5), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomeWidget(title: 'Meu App')),
          );
        });
      }).catchError((error) {
        print('Erro ao carregar o vídeo: $error');
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: _controller.initialize(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return CircularProgressIndicator(); // Carregando
            }
          },
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  final String title;

  HomeWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Bem-vindo ao Meu App!'),
      ),
    );
  }
}
