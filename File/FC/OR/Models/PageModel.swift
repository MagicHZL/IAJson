import Foundation 
import SwiftyJSON 
class PageModel: KHBaseModel { 
  override init() { 
    super.init() 
  } 
  var maintainScrollPosition : Bool = false 
  var includeInCloudUpload : Bool = false 
  var isFixedToViewport : Bool = false 
  var groupLayout : JSON = JSON() 
  var do_objectID : String = "" 
  var frame : FrameModel = FrameModel() 
  var exportOptions : ExportOptionsModel = ExportOptionsModel() 
  var nameIsFixed : Bool = false 
  var clippingMaskMode : Int = 0 
  var hasClippingMask : Bool = false 
  var resizingConstraint : Int = 0 
  var name : String = "" 
  var hasClickThrough : Bool = false 
  var verticalRulerData : JSON = JSON() 
  var shouldBreakMaskChain : Bool = false 
  var isVisible : Bool = false 
  var _class : String = "" 
  var style : StyleModel = StyleModel() 
  var isLocked : Bool = false 
  var rotation : Int = 0 
  var isFlippedHorizontal : Bool = false 
  var booleanOperation : Int = 0 
  var horizontalRulerData : JSON = JSON() 
  var layers : [LayerModel] = [] 
  var resizingType : Int = 0 
  var layerListExpandedType : Int = 0 
  var isFlippedVertical : Bool = false 
  required init(json: JSON) { 
    super.init(json: json) 
    maintainScrollPosition = json["maintainScrollPosition"].boolValue 
    includeInCloudUpload = json["includeInCloudUpload"].boolValue 
    isFixedToViewport = json["isFixedToViewport"].boolValue 
    groupLayout = json["groupLayout"] 
    do_objectID = json["do_objectID"].stringValue 
    frame = FrameModel(json: json["frame"]) 
    exportOptions = ExportOptionsModel(json: json["exportOptions"]) 
    nameIsFixed = json["nameIsFixed"].boolValue 
    clippingMaskMode = json["clippingMaskMode"].intValue 
    hasClippingMask = json["hasClippingMask"].boolValue 
    resizingConstraint = json["resizingConstraint"].intValue 
    name = json["name"].stringValue 
    hasClickThrough = json["hasClickThrough"].boolValue 
    verticalRulerData = json["verticalRulerData"] 
    shouldBreakMaskChain = json["shouldBreakMaskChain"].boolValue 
    isVisible = json["isVisible"].boolValue 
    _class = json["_class"].stringValue 
    style = StyleModel(json: json["style"]) 
    isLocked = json["isLocked"].boolValue 
    rotation = json["rotation"].intValue 
    isFlippedHorizontal = json["isFlippedHorizontal"].boolValue 
    booleanOperation = json["booleanOperation"].intValue 
    horizontalRulerData = json["horizontalRulerData"] 
    layers = KHBaseModel.getModes(type: LayerModel.self, jsons: json["layers"].arrayValue) 
    resizingType = json["resizingType"].intValue 
    layerListExpandedType = json["layerListExpandedType"].intValue 
    isFlippedVertical = json["isFlippedVertical"].boolValue 
  } 
//复制自己 
  func copySelf() -> PageModel { 
    var mo = PageModel() 
    mo.maintainScrollPosition = self.maintainScrollPosition 
    mo.includeInCloudUpload = self.includeInCloudUpload 
    mo.isFixedToViewport = self.isFixedToViewport 
    mo.groupLayout = self.groupLayout 
    mo.do_objectID = self.do_objectID 
    mo.frame = self.frame 
    mo.exportOptions = self.exportOptions 
    mo.nameIsFixed = self.nameIsFixed 
    mo.clippingMaskMode = self.clippingMaskMode 
    mo.hasClippingMask = self.hasClippingMask 
    mo.resizingConstraint = self.resizingConstraint 
    mo.name = self.name 
    mo.hasClickThrough = self.hasClickThrough 
    mo.verticalRulerData = self.verticalRulerData 
    mo.shouldBreakMaskChain = self.shouldBreakMaskChain 
    mo.isVisible = self.isVisible 
    mo._class = self._class 
    mo.style = self.style 
    mo.isLocked = self.isLocked 
    mo.rotation = self.rotation 
    mo.isFlippedHorizontal = self.isFlippedHorizontal 
    mo.booleanOperation = self.booleanOperation 
    mo.horizontalRulerData = self.horizontalRulerData 
    mo.layers = self.layers 
    mo.resizingType = self.resizingType 
    mo.layerListExpandedType = self.layerListExpandedType 
    mo.isFlippedVertical = self.isFlippedVertical 
    return mo 
  }
//转为JSON 
  func toJson() -> JSON { 
    var json = JSON() 
    json["maintainScrollPosition"] = JSON.init(maintainScrollPosition) 
    json["includeInCloudUpload"] = JSON.init(includeInCloudUpload) 
    json["isFixedToViewport"] = JSON.init(isFixedToViewport) 
    json["groupLayout"] = JSON.init(groupLayout) 
    json["do_objectID"] = JSON.init(do_objectID) 
    json["frame"] = frame.toJson() 
    json["exportOptions"] = exportOptions.toJson() 
    json["nameIsFixed"] = JSON.init(nameIsFixed) 
    json["clippingMaskMode"] = JSON.init(clippingMaskMode) 
    json["hasClippingMask"] = JSON.init(hasClippingMask) 
    json["resizingConstraint"] = JSON.init(resizingConstraint) 
    json["name"] = JSON.init(name) 
    json["hasClickThrough"] = JSON.init(hasClickThrough) 
    json["verticalRulerData"] = JSON.init(verticalRulerData) 
    json["shouldBreakMaskChain"] = JSON.init(shouldBreakMaskChain) 
    json["isVisible"] = JSON.init(isVisible) 
    json["_class"] = JSON.init(_class) 
    json["style"] = style.toJson() 
    json["isLocked"] = JSON.init(isLocked) 
    json["rotation"] = JSON.init(rotation) 
    json["isFlippedHorizontal"] = JSON.init(isFlippedHorizontal) 
    json["booleanOperation"] = JSON.init(booleanOperation) 
    json["horizontalRulerData"] = JSON.init(horizontalRulerData) 
    var layers_mos : [JSON] =  [] 
    for val in layers { 
       layers_mos.append(val.toJson())
    } 
    json["layers"] = layers_mos 
    json["resizingType"] = JSON.init(resizingType) 
    json["layerListExpandedType"] = JSON.init(layerListExpandedType) 
    json["isFlippedVertical"] = JSON.init(isFlippedVertical) 
    return json 
  }
}