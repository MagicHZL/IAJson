import Foundation 
import SwiftyJSON 
class StyleModel: KHBaseModel { 
  override init() { 
    super.init() 
  } 
  var miterLimit : Int = 0 
  var startMarkerType : Int = 0 
  var shadows : JSON = JSON() 
  var do_objectID : String = "" 
  var colorControls : JSON = JSON() 
  var windingRule : Int = 0 
  var innerShadows : JSON = JSON() 
  var borderOptions : JSON = JSON() 
  var endMarkerType : Int = 0 
  var contextSettings : JSON = JSON() 
  var borders : JSON = JSON() 
  var fills : [FillModel] = [] 
  var _class : String = "" 
  var blur : JSON = JSON() 
  required init(json: JSON) { 
    super.init(json: json) 
    miterLimit = json["miterLimit"].intValue 
    startMarkerType = json["startMarkerType"].intValue 
    shadows = json["shadows"] 
    do_objectID = json["do_objectID"].stringValue 
    colorControls = json["colorControls"] 
    windingRule = json["windingRule"].intValue 
    innerShadows = json["innerShadows"] 
    borderOptions = json["borderOptions"] 
    endMarkerType = json["endMarkerType"].intValue 
    contextSettings = json["contextSettings"] 
    borders = json["borders"] 
    fills = KHBaseModel.getModes(type: FillModel.self, jsons: json["fills"].arrayValue) 
    _class = json["_class"].stringValue 
    blur = json["blur"] 
  } 
//复制自己 
  func copySelf() -> StyleModel { 
    var mo = StyleModel() 
    mo.miterLimit = self.miterLimit 
    mo.startMarkerType = self.startMarkerType 
    mo.shadows = self.shadows 
    mo.do_objectID = self.do_objectID 
    mo.colorControls = self.colorControls 
    mo.windingRule = self.windingRule 
    mo.innerShadows = self.innerShadows 
    mo.borderOptions = self.borderOptions 
    mo.endMarkerType = self.endMarkerType 
    mo.contextSettings = self.contextSettings 
    mo.borders = self.borders 
    mo.fills = self.fills 
    mo._class = self._class 
    mo.blur = self.blur 
    return mo 
  }
//转为JSON 
  func toJson() -> JSON { 
    var json = JSON() 
    json["miterLimit"] = JSON.init(miterLimit) 
    json["startMarkerType"] = JSON.init(startMarkerType) 
    json["shadows"] = JSON.init(shadows) 
    json["do_objectID"] = JSON.init(do_objectID) 
    json["colorControls"] = JSON.init(colorControls) 
    json["windingRule"] = JSON.init(windingRule) 
    json["innerShadows"] = JSON.init(innerShadows) 
    json["borderOptions"] = JSON.init(borderOptions) 
    json["endMarkerType"] = JSON.init(endMarkerType) 
    json["contextSettings"] = JSON.init(contextSettings) 
    json["borders"] = JSON.init(borders) 
    var fills_mos : [JSON] =  [] 
    for val in fills { 
       fills_mos.append(val.toJson())
    } 
    json["fills"] = fills_mos 
    json["_class"] = JSON.init(_class) 
    json["blur"] = JSON.init(blur) 
    return json 
  }
}