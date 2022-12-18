import 'package:flutter/material.dart';
import 'package:sciencenotes/domain/videos.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoCardWidget extends StatefulWidget {
  final Videos video;

  const VideoCardWidget({Key? key, required this.video})
      : super(key: key);

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCardWidget> {
  //Videos get video => widget.video; //esse video é igual a video da classe VideoCardWidget | isso é pra não estar fazendo widget.video em todo lugar

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImage(),
            const SizedBox(height: 8),
            Text(
                widget.video.tituloVideo,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, fontFamily: 'Abel-Regular')),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.timer_outlined),
                const SizedBox(width: 8),
                Text(widget.video.tempoDuracao,
                    style: const TextStyle(fontSize: 24, fontFamily: 'Abel-Regular')),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    onPressed: openURL , //openURL
                    child: const Text(
                      'ASSISTIR AGORA',
                      style: TextStyle(color: Color(0xffffffff), fontSize: 24, fontFamily: 'AmaticSC-Regular'),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xff411049),
                        padding: const EdgeInsets.all(16))),
              ],
            ),
          ],
        ),
      ),
      color: const Color(0xfff6e7f9),
    );
  }

  buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
          top: Radius.circular(4), bottom: Radius.circular(4)),
      child: Image.network(widget.video.urlImage),
    );
  }

  Future<void> openURL() async {
    final url = Uri.parse('https://www.youtube.com/watch?v=_6ILoTeChCE');
    if (await launchUrl(url)) {
      url;
      mode: LaunchMode.externalApplication;
    } else {
      throw 'Could not launch $url';
    }
  }

}
