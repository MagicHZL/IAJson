import Foundation 
import SwiftyJSON 
class FrameModel: KHBaseModel { 
  override init() { 
    super.init() 
  } 
  var y : Int = 0 
  var _class : String = "" 
  var height : Int = 0 
  var x : Int = 0 
  var width : Int = 0 
  var constrainProportions : Bool = false 
  required init(json: JSON) { 
    super.init(json: json) 
    y = json["y"].intValue 
    _class = json["_class"].stringValue 
    height = json["height"].intValue 
    x = json["x"].intValue 
    width = json["width"].intValue 
    constrainProportions = json["constrainProportions"].boolValue 
  } 
//复制自己 
  func copySelf() -> FrameModel { 
    var mo = FrameModel() 
    mo.y = self.y 
    mo._class = self._class 
    mo.height = self.height 
    mo.x = self.x 
    mo.width = self.width 
    mo.constrainProportions = self.constrainProportions 
    return mo 
  }
//转为JSON 
  func toJson() -> JSON { 
    var json = JSON() 
    json["y"] = JSON.init(y) 
    json["_class"] = JSON.init(_class) 
    json["height"] = JSON.init(height) 
    json["x"] = JSON.init(x) 
    json["width"] = JSON.init(width) 
    json["constrainProportions"] = JSON.init(constrainProportions) 
    return json 
  }
}