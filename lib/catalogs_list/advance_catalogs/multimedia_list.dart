

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class ImagePickerClass extends StatefulWidget {
  const ImagePickerClass({Key? key}) : super(key: key);

  @override
  State<ImagePickerClass> createState() => _ImagePickerClassState();
}
class _ImagePickerClassState extends State<ImagePickerClass> {
  File? imageFile;
  final picker = ImagePicker();

  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ButtonBar(
          children: [
            IconButton(onPressed: (
    ) async {
             pickImageFromCamera();
            }, icon: const Icon(Icons.photo_camera)),
            IconButton(onPressed: () async {
              pickImageFromGallery();
    }, icon: const Icon(Icons.photo)),
    ],),
    if (imageFile == null)
          const Center(child: Text("Add an Image"))
        else
          Image.file(imageFile!),
      ],
    );
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null){
      setState(() => imageFile = File(pickedFile.path));
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
const imagePickerClassCode = {
  '''
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerClass extends StatefulWidget {
  const ImagePickerClass({Key? key}) : super(key: key);

  @override
  State<ImagePickerClass> createState() => _ImagePickerClassState();
}

class _ImagePickerClassState extends State<ImagePickerClass> {
  File? imageFile;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ButtonBar(
          children: [
            IconButton(onPressed: (
    ) async {
             pickImageFromCamera();
            }, icon: const Icon(Icons.photo_camera)),
            IconButton(onPressed: () async {
              pickImageFromGallery();
    }, icon: const Icon(Icons.photo)),
    ],),
    if (imageFile == null)
          const Center(child: Text("Add an Image"))
        else
          Image.file(imageFile!),
      ],
    );
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null){
      setState(() => imageFile = File(pickedFile.path));
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}  

  
  '''
};


class VideoPlayerClass extends StatefulWidget {
  const VideoPlayerClass({Key? key}) : super(key: key);

  @override
  State<VideoPlayerClass> createState() => _VideoPlayerClassState();
}
class _VideoPlayerClassState extends State<VideoPlayerClass> {
  late VideoPlayerController videoPlayerController;
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4")
    .. addListener(() => setState(() {
    }))
    .. setLooping(true)
    ..initialize();
  }
  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: videoPlayerController.value.isInitialized ? videoPlayer() : const CircularProgressIndicator(),
    );
  }
  Widget videoPlayer(){
    return Column(
      children: [
        AspectRatio(aspectRatio: videoPlayerController.value.aspectRatio,
        child: VideoPlayer(videoPlayerController),),
        VideoProgressIndicator(videoPlayerController, allowScrubbing: true),
        ElevatedButton.icon(onPressed: ()=> videoPlayerController.value.isPlaying
            ? videoPlayerController.pause() : videoPlayerController.play(), icon: Icon(
            videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow
        ), label: const Text("Video")),
      ],
    );
  }
}
const videoPlayerClassCode = {
  '''
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VideoPlayerClass extends StatefulWidget {
  const VideoPlayerClass({Key? key}) : super(key: key);

  @override
  State<VideoPlayerClass> createState() => _VideoPlayerClassState();
}
class _VideoPlayerClassState extends State<VideoPlayerClass> {
  late VideoPlayerController videoPlayerController;
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4")
    .. addListener(() => setState(() {
    }))
    .. setLooping(true)
    ..initialize();
  }
  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: videoPlayerController.value.isInitialized ? videoPlayer() : const CircularProgressIndicator(),
    );
  }
  Widget videoPlayer(){
    return Column(
      children: [
        AspectRatio(aspectRatio: videoPlayerController.value.aspectRatio,
        child: VideoPlayer(videoPlayerController),),
        VideoProgressIndicator(videoPlayerController, allowScrubbing: true),
        ElevatedButton.icon(onPressed: ()=> videoPlayerController.value.isPlaying
            ? videoPlayerController.pause() : videoPlayerController.play(), icon: Icon(
            videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow
        ), label: const Text("Video")),
      ],
    );
  }
}  

  
  '''
};





