import Foundation 
import SwiftyJSON 
class PeerModel: KHBaseModel { 
  override init() { 
    super.init() 
  } 
  var id : String = "" 
  var username : String = "" 
  var pausedHeadset : Bool = false 
  var permissionVoiceManage : Bool = false 
  var avatar : String = "" 
  var pausedProducer : Bool = false 
  var permissionSay : Bool = false 
  var identify_num : String = "" 
  var roles : JSON = JSON() 
  var permissionFreeMic : Bool = false 
  var displayName : String = "" 
  var device : String = "" 
  var is_vip : Bool = false 
  var accompaniment : Bool = false 
  required init(json: JSON) { 
    super.init(json: json) 
    id = json["id"].stringValue 
    username = json["username"].stringValue 
    pausedHeadset = json["pausedHeadset"].boolValue 
    permissionVoiceManage = json["permissionVoiceManage"].boolValue 
    avatar = json["avatar"].stringValue 
    pausedProducer = json["pausedProducer"].boolValue 
    permissionSay = json["permissionSay"].boolValue 
    identify_num = json["identify_num"].stringValue 
    roles = json["roles"] 
    permissionFreeMic = json["permissionFreeMic"].boolValue 
    displayName = json["displayName"].stringValue 
    device = json["device"].stringValue 
    is_vip = json["is_vip"].boolValue 
    accompaniment = json["accompaniment"].boolValue 
  } 
//复制自己 
  func copySelf() -> PeerModel { 
    var mo = PeerModel() 
    mo.id = self.id 
    mo.username = self.username 
    mo.pausedHeadset = self.pausedHeadset 
    mo.permissionVoiceManage = self.permissionVoiceManage 
    mo.avatar = self.avatar 
    mo.pausedProducer = self.pausedProducer 
    mo.permissionSay = self.permissionSay 
    mo.identify_num = self.identify_num 
    mo.roles = self.roles 
    mo.permissionFreeMic = self.permissionFreeMic 
    mo.displayName = self.displayName 
    mo.device = self.device 
    mo.is_vip = self.is_vip 
    mo.accompaniment = self.accompaniment 
    return mo 
  }
//转为JSON 
  func toJson() -> JSON { 
    var json = JSON() 
    json["id"] = JSON.init(id) 
    json["username"] = JSON.init(username) 
    json["pausedHeadset"] = JSON.init(pausedHeadset) 
    json["permissionVoiceManage"] = JSON.init(permissionVoiceManage) 
    json["avatar"] = JSON.init(avatar) 
    json["pausedProducer"] = JSON.init(pausedProducer) 
    json["permissionSay"] = JSON.init(permissionSay) 
    json["identify_num"] = JSON.init(identify_num) 
    json["roles"] = JSON.init(roles) 
    json["permissionFreeMic"] = JSON.init(permissionFreeMic) 
    json["displayName"] = JSON.init(displayName) 
    json["device"] = JSON.init(device) 
    json["is_vip"] = JSON.init(is_vip) 
    json["accompaniment"] = JSON.init(accompaniment) 
    return json 
  }
}