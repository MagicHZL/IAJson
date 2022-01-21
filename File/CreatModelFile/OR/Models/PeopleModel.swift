import Foundation 
import SwiftyJSON 
class PeopleModel: KHBaseModel { 
  override init() { 
    super.init() 
  } 
  var peer : PeerModel = PeerModel() 
  var peers : JSON = JSON() 
  var room : JSON = JSON() 
  required init(json: JSON) { 
    super.init(json: json) 
    peer = PeerModel(json: json["peer"]) 
    peers = json["peers"] 
    room = json["room"] 
  } 
//复制自己 
  func copySelf() -> PeopleModel { 
    var mo = PeopleModel() 
    mo.peer = self.peer 
    mo.peers = self.peers 
    mo.room = self.room 
    return mo 
  }
//转为JSON 
  func toJson() -> JSON { 
    var json = JSON() 
    json["peer"] = peer.toJson() 
    json["peers"] = JSON.init(peers) 
    json["room"] = JSON.init(room) 
    return json 
  }
}