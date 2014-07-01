part of rh.player;

class Player {
  LinkedHashMap config;
  
  VideoElement video;
  
  Player(this.video, [this.config]) {
    if(config.containsKey('controls'))
      video.controls = config['controls'];
    
    print(config);
  }
  
  void addSource() {
    
  }
  
  void play() {
    video.play();
  }
  
  void stop() {
    video.pause();
  }
}