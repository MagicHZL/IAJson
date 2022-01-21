import Foundation 
import SwiftyJSON 
class ExportOptionsModel: KHBaseModel { 
  override init() { 
    super.init() 
  } 
  var shouldTrim : Bool = false 
  var exportFormats : JSON = JSON() 
  var layerOptions : Int = 0 
  var includedLayerIds : JSON = JSON() 
  var _class : String = "" 
  required init(json: JSON) { 
    super.init(json: json) 
    shouldTrim = json["shouldTrim"].boolValue 
    exportFormats = json["exportFormats"] 
    layerOptions = json["layerOptions"].intValue 
    includedLayerIds = json["includedLayerIds"] 
    _class = json["_class"].stringValue 
  } 
//复制自己 
  func copySelf() -> ExportOptionsModel { 
    var mo = ExportOptionsModel() 
    mo.shouldTrim = self.shouldTrim 
    mo.exportFormats = self.exportFormats 
    mo.layerOptions = self.layerOptions 
    mo.includedLayerIds = self.includedLayerIds 
    mo._class = self._class 
    return mo 
  }
//转为JSON 
  func toJson() -> JSON { 
    var json = JSON() 
    json["shouldTrim"] = JSON.init(shouldTrim) 
    json["exportFormats"] = JSON.init(exportFormats) 
    json["layerOptions"] = JSON.init(layerOptions) 
    json["includedLayerIds"] = JSON.init(includedLayerIds) 
    json["_class"] = JSON.init(_class) 
    return json 
  }
}