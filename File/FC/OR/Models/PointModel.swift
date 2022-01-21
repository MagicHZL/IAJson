import Foundation 
import SwiftyJSON 
class PointModel: KHBaseModel { 
  override init() { 
    super.init() 
  } 
  var cornerRadius : Int = 0 
  var hasCurveFrom : Bool = false 
  var hasCurveTo : Bool = false 
  var curveTo : String = "" 
  var curveMode : Int = 0 
  var curveFrom : String = "" 
  var _class : String = "" 
  var point : String = "" 
  required init(json: JSON) { 
    super.init(json: json) 
    cornerRadius = json["cornerRadius"].intValue 
    hasCurveFrom = json["hasCurveFrom"].boolValue 
    hasCurveTo = json["hasCurveTo"].boolValue 
    curveTo = json["curveTo"].stringValue 
    curveMode = json["curveMode"].intValue 
    curveFrom = json["curveFrom"].stringValue 
    _class = json["_class"].stringValue 
    point = json["point"].stringValue 
  } 
//复制自己 
  func copySelf() -> PointModel { 
    var mo = PointModel() 
    mo.cornerRadius = self.cornerRadius 
    mo.hasCurveFrom = self.hasCurveFrom 
    mo.hasCurveTo = self.hasCurveTo 
    mo.curveTo = self.curveTo 
    mo.curveMode = self.curveMode 
    mo.curveFrom = self.curveFrom 
    mo._class = self._class 
    mo.point = self.point 
    return mo 
  }
//转为JSON 
  func toJson() -> JSON { 
    var json = JSON() 
    json["cornerRadius"] = JSON.init(cornerRadius) 
    json["hasCurveFrom"] = JSON.init(hasCurveFrom) 
    json["hasCurveTo"] = JSON.init(hasCurveTo) 
    json["curveTo"] = JSON.init(curveTo) 
    json["curveMode"] = JSON.init(curveMode) 
    json["curveFrom"] = JSON.init(curveFrom) 
    json["_class"] = JSON.init(_class) 
    json["point"] = JSON.init(point) 
    return json 
  }
}