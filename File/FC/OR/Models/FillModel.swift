import Foundation 
import SwiftyJSON 
class FillModel: KHBaseModel { 
  override init() { 
    super.init() 
  } 
  var noiseIntensity : Int = 0 
  var gradient : JSON = JSON() 
  var _class : String = "" 
  var contextSettings : JSON = JSON() 
  var isEnabled : Bool = false 
  var fillType : Int = 0 
  var noiseIndex : Int = 0 
  var color : ColorModel = ColorModel() 
  var patternFillType : Int = 0 
  var patternTileScale : Int = 0 
  required init(json: JSON) { 
    super.init(json: json) 
    noiseIntensity = json["noiseIntensity"].intValue 
    gradient = json["gradient"] 
    _class = json["_class"].stringValue 
    contextSettings = json["contextSettings"] 
    isEnabled = json["isEnabled"].boolValue 
    fillType = json["fillType"].intValue 
    noiseIndex = json["noiseIndex"].intValue 
    color = ColorModel(json: json["color"]) 
    patternFillType = json["patternFillType"].intValue 
    patternTileScale = json["patternTileScale"].intValue 
  } 
//复制自己 
  func copySelf() -> FillModel { 
    var mo = FillModel() 
    mo.noiseIntensity = self.noiseIntensity 
    mo.gradient = self.gradient 
    mo._class = self._class 
    mo.contextSettings = self.contextSettings 
    mo.isEnabled = self.isEnabled 
    mo.fillType = self.fillType 
    mo.noiseIndex = self.noiseIndex 
    mo.color = self.color 
    mo.patternFillType = self.patternFillType 
    mo.patternTileScale = self.patternTileScale 
    return mo 
  }
//转为JSON 
  func toJson() -> JSON { 
    var json = JSON() 
    json["noiseIntensity"] = JSON.init(noiseIntensity) 
    json["gradient"] = JSON.init(gradient) 
    json["_class"] = JSON.init(_class) 
    json["contextSettings"] = JSON.init(contextSettings) 
    json["isEnabled"] = JSON.init(isEnabled) 
    json["fillType"] = JSON.init(fillType) 
    json["noiseIndex"] = JSON.init(noiseIndex) 
    json["color"] = color.toJson() 
    json["patternFillType"] = JSON.init(patternFillType) 
    json["patternTileScale"] = JSON.init(patternTileScale) 
    return json 
  }
}