library rh.player;

import 'dart:html';
import 'dart:convert';
import 'dart:collection';
import 'package:polymer/polymer.dart';

part 'player/player.dart';

Map<String,Player> _players = {};

bool _initialized = false;

void initFromScripts() {
  querySelectorAll('script[type="application/json;rh-player"]').forEach((ScriptElement script) {
    initFromScript(script);
    // remove script so it does not get initialized twice if we call init more than once
    script.remove();
  });
}

/**
 * Initialize player from script (json config)
 */

void initFromScript(ScriptElement script) {
  // decode json to object
  var config = JSON.decode(script.text);
  // Create and insert video element
  VideoElement video = new Element.tag('video');
  Node parent = script.parentNode;
  Node nextNode = script.nextNode;
  
  if(nextNode == null) {
    parent.append(video);
  } else {
    parent.insertBefore(video, nextNode);
  }
  // Create Player object
  Player player = new Player(video, config);
}

@CustomTag('rh-player')
class RHPlayer extends PolymerElement {
  RHPlayer.created() : super.created() {
    print(this.toString() + " created");
  }
  
  void attached() {
    super.attached();
    print('$this attached');
  }

  @override
  void ready() {
    super.ready();
  }
}