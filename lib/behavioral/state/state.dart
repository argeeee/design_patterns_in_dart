// Context
class MusicPlayer {
  late PlayerState state;

  MusicPlayer() {
    // Set the initial state to Stopped
    state = StoppedState(this);
  }

  void setState(PlayerState newState) {
    state = newState;
  }

  void play() {
    state.play();
  }

  void pause() {
    state.pause();
  }

  void stop() {
    state.stop();
  }
}

// State
abstract class PlayerState {
  final MusicPlayer musicPlayer;

  PlayerState(this.musicPlayer);

  void play();
  void pause();
  void stop();
}

// Concrete State: Playing
class PlayingState extends PlayerState {
  PlayingState(MusicPlayer musicPlayer) : super(musicPlayer);

  @override
  void play() {
    print("Already playing the music.");
  }

  @override
  void pause() {
    print("Music paused.");
    musicPlayer.setState(PausedState(musicPlayer));
  }

  @override
  void stop() {
    print("Music stopped.");
    musicPlayer.setState(StoppedState(musicPlayer));
  }
}

// Concrete State: Paused
class PausedState extends PlayerState {
  PausedState(MusicPlayer musicPlayer) : super(musicPlayer);

  @override
  void play() {
    print("Music resumed.");
    musicPlayer.setState(PlayingState(musicPlayer));
  }

  @override
  void pause() {
    print("Already paused.");
  }

  @override
  void stop() {
    print("Music stopped.");
    musicPlayer.setState(StoppedState(musicPlayer));
  }
}

// Concrete State: Stopped
class StoppedState extends PlayerState {
  StoppedState(MusicPlayer musicPlayer) : super(musicPlayer);

  @override
  void play() {
    print("Music started playing.");
    musicPlayer.setState(PlayingState(musicPlayer));
  }

  @override
  void pause() {
    print("No music playing to pause.");
  }

  @override
  void stop() {
    print("Music already stopped.");
  }
}
