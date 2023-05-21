// Target interface
abstract class MediaPlayer {
  void play(String audioType, String fileName);
}

// Existing class with incompatible interface
class LegacyMediaPlayer {
  void playVlc(String fileName) {
    print("Playing VLC file: $fileName");
  }

  void playMp4(String fileName) {
    print("Playing MP4 file: $fileName");
  }
}

// Adapter class
class MediaPlayerAdapter implements MediaPlayer {
  final LegacyMediaPlayer legacyMediaPlayer;

  MediaPlayerAdapter(this.legacyMediaPlayer);

  @override
  void play(String audioType, String fileName) {
    if (audioType == "vlc") {
      legacyMediaPlayer.playVlc(fileName);
    } else if (audioType == "mp4") {
      legacyMediaPlayer.playMp4(fileName);
    } else {
      print("Invalid media type: $audioType");
    }
  }
}
