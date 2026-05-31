import 'package:care_paws/modules/community/uploads/story_upload/modules/music_module/music_data.dart';
import 'package:care_paws/modules/community/uploads/story_upload/modules/music_module/music_model.dart';
import 'package:flutter/material.dart';

class MusicPickerScreen extends StatelessWidget {

  const MusicPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Music"),
      ),

      body: ListView.builder(
        itemCount: MusicData.musicList.length,
        itemBuilder: (context, index) {

          MusicModel music = MusicData.musicList[index];

          return ListTile(
            title: Text(music.title),
            subtitle: Text(music.artist),

            onTap: () {
              Navigator.pop(context, music); // 🔥 return selected music
            },
          );
        },
      ),
    );
  }
}