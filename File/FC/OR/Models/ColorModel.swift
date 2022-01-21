import Foundation 
import SwiftyJSON 
class ColorModel: KHBaseModel { 
  override init() { 
    super.init() 
  } 
  var _class : String = "" 
  var alpha : Int = 0 
  var green : Double = 0 
  var blue : Double = 0 
  var red : Double = 0 
  required init(json: JSON) { 
    super.init(json: json) 
    _class = json["_class"].stringValue 
    alpha = json["alpha"].intValue 
    green = json["green"].doubleValue 
    blue = json["blue"].doubleValue 
    red = json["red"].doubleValue 
  } 
//复制自己 
  func copySelf() -> ColorModel { 
    var mo = ColorModel() 
    mo._class = self._class 
    mo.alpha = self.alpha 
    mo.green = self.green 
    mo.blue = self.blue 
    mo.red = self.red 
    return mo 
  }
//转为JSON 
  func toJson() -> JSON { 
    var json = JSON() 
    json["_class"] = JSON.init(_class) 
    json["alpha"] = JSON.init(alpha) 
    json["green"] = JSON.init(green) 
    json["blue"] = JSON.init(blue) 
    json["red"] = JSON.init(red) 
    return json 
  }
}
