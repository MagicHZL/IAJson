import Foundation 
import SwiftyJSON 
class LayerModel: KHBaseModel { 
  override init() { 
    super.init() 
  } 
  var hasClippingMask : Bool = false 
  var exportOptions : ExportOptionsModel = ExportOptionsModel() 
  var layerListExpandedType : Int = 0 
  var booleanOperation : Int = 0 
  var _class : String = "" 
  var includeBackgroundColorInExport : Bool = false 
  var isFlippedVertical : Bool = false 
  var clippingMaskMode : Int = 0 
  var backgroundColor : JSON = JSON() 
  var groupLayout : JSON = JSON() 
  var isFixedToViewport : Bool = false 
  var resizingType : Int = 0 
  var isFlippedHorizontal : Bool = false 
  var horizontalRulerData : JSON = JSON() 
  var isLocked : Bool = false 
  var style : StyleModel = StyleModel() 
  var verticalRulerData : JSON = JSON() 
  var isFlowHome : Bool = false 
  var shouldBreakMaskChain : Bool = false 
  var isVisible : Bool = false 
  var layers : [LayerModel] = [] 
  var presetDictionary : JSON = JSON() 
  var maintainScrollPosition : Bool = false 
  var nameIsFixed : Bool = false 
  var name : String = "" 
  var do_objectID : String = "" 
  var rotation : Int = 0 
  var frame : FrameModel = FrameModel() 
  var resizingConstraint : Int = 0 
  var resizesContent : Bool = false 
  var includeInCloudUpload : Bool = false 
  var hasClickThrough : Bool = false 
  var hasBackgroundColor : Bool = false 
  required init(json: JSON) { 
    super.init(json: json) 
    hasClippingMask = json["hasClippingMask"].boolValue 
    exportOptions = ExportOptionsModel(json: json["exportOptions"]) 
    layerListExpandedType = json["layerListExpandedType"].intValue 
    booleanOperation = json["booleanOperation"].intValue 
    _class = json["_class"].stringValue 
    includeBackgroundColorInExport = json["includeBackgroundColorInExport"].boolValue 
    isFlippedVertical = json["isFlippedVertical"].boolValue 
    clippingMaskMode = json["clippingMaskMode"].intValue 
    backgroundColor = json["backgroundColor"] 
    groupLayout = json["groupLayout"] 
    isFixedToViewport = json["isFixedToViewport"].boolValue 
    resizingType = json["resizingType"].intValue 
    isFlippedHorizontal = json["isFlippedHorizontal"].boolValue 
    horizontalRulerData = json["horizontalRulerData"] 
    isLocked = json["isLocked"].boolValue 
    style = StyleModel(json: json["style"]) 
    verticalRulerData = json["verticalRulerData"] 
    isFlowHome = json["isFlowHome"].boolValue 
    shouldBreakMaskChain = json["shouldBreakMaskChain"].boolValue 
    isVisible = json["isVisible"].boolValue 
    layers = KHBaseModel.getModes(type: LayerModel.self, jsons: json["layers"].arrayValue) 
    presetDictionary = json["presetDictionary"] 
    maintainScrollPosition = json["maintainScrollPosition"].boolValue 
    nameIsFixed = json["nameIsFixed"].boolValue 
    name = json["name"].stringValue 
    do_objectID = json["do_objectID"].stringValue 
    rotation = json["rotation"].intValue 
    frame = FrameModel(json: json["frame"]) 
    resizingConstraint = json["resizingConstraint"].intValue 
    resizesContent = json["resizesContent"].boolValue 
    includeInCloudUpload = json["includeInCloudUpload"].boolValue 
    hasClickThrough = json["hasClickThrough"].boolValue 
    hasBackgroundColor = json["hasBackgroundColor"].boolValue 
  } 
//复制自己 
  func copySelf() -> LayerModel { 
    var mo = LayerModel() 
    mo.hasClippingMask = self.hasClippingMask 
    mo.exportOptions = self.exportOptions 
    mo.layerListExpandedType = self.layerListExpandedType 
    mo.booleanOperation = self.booleanOperation 
    mo._class = self._class 
    mo.includeBackgroundColorInExport = self.includeBackgroundColorInExport 
    mo.isFlippedVertical = self.isFlippedVertical 
    mo.clippingMaskMode = self.clippingMaskMode 
    mo.backgroundColor = self.backgroundColor 
    mo.groupLayout = self.groupLayout 
    mo.isFixedToViewport = self.isFixedToViewport 
    mo.resizingType = self.resizingType 
    mo.isFlippedHorizontal = self.isFlippedHorizontal 
    mo.horizontalRulerData = self.horizontalRulerData 
    mo.isLocked = self.isLocked 
    mo.style = self.style 
    mo.verticalRulerData = self.verticalRulerData 
    mo.isFlowHome = self.isFlowHome 
    mo.shouldBreakMaskChain = self.shouldBreakMaskChain 
    mo.isVisible = self.isVisible 
    mo.layers = self.layers 
    mo.presetDictionary = self.presetDictionary 
    mo.maintainScrollPosition = self.maintainScrollPosition 
    mo.nameIsFixed = self.nameIsFixed 
    mo.name = self.name 
    mo.do_objectID = self.do_objectID 
    mo.rotation = self.rotation 
    mo.frame = self.frame 
    mo.resizingConstraint = self.resizingConstraint 
    mo.resizesContent = self.resizesContent 
    mo.includeInCloudUpload = self.includeInCloudUpload 
    mo.hasClickThrough = self.hasClickThrough 
    mo.hasBackgroundColor = self.hasBackgroundColor 
    return mo 
  }
//转为JSON 
  func toJson() -> JSON { 
    var json = JSON() 
    json["hasClippingMask"] = JSON.init(hasClippingMask) 
    json["exportOptions"] = exportOptions.toJson() 
    json["layerListExpandedType"] = JSON.init(layerListExpandedType) 
    json["booleanOperation"] = JSON.init(booleanOperation) 
    json["_class"] = JSON.init(_class) 
    json["includeBackgroundColorInExport"] = JSON.init(includeBackgroundColorInExport) 
    json["isFlippedVertical"] = JSON.init(isFlippedVertical) 
    json["clippingMaskMode"] = JSON.init(clippingMaskMode) 
    json["backgroundColor"] = JSON.init(backgroundColor) 
    json["groupLayout"] = JSON.init(groupLayout) 
    json["isFixedToViewport"] = JSON.init(isFixedToViewport) 
    json["resizingType"] = JSON.init(resizingType) 
    json["isFlippedHorizontal"] = JSON.init(isFlippedHorizontal) 
    json["horizontalRulerData"] = JSON.init(horizontalRulerData) 
    json["isLocked"] = JSON.init(isLocked) 
    json["style"] = style.toJson() 
    json["verticalRulerData"] = JSON.init(verticalRulerData) 
    json["isFlowHome"] = JSON.init(isFlowHome) 
    json["shouldBreakMaskChain"] = JSON.init(shouldBreakMaskChain) 
    json["isVisible"] = JSON.init(isVisible) 
    var layers_mos : [JSON] =  [] 
    for val in layers { 
       layers_mos.append(val.toJson())
    } 
    json["layers"] = layers_mos 
    json["presetDictionary"] = JSON.init(presetDictionary) 
    json["maintainScrollPosition"] = JSON.init(maintainScrollPosition) 
    json["nameIsFixed"] = JSON.init(nameIsFixed) 
    json["name"] = JSON.init(name) 
    json["do_objectID"] = JSON.init(do_objectID) 
    json["rotation"] = JSON.init(rotation) 
    json["frame"] = frame.toJson() 
    json["resizingConstraint"] = JSON.init(resizingConstraint) 
    json["resizesContent"] = JSON.init(resizesContent) 
    json["includeInCloudUpload"] = JSON.init(includeInCloudUpload) 
    json["hasClickThrough"] = JSON.init(hasClickThrough) 
    json["hasBackgroundColor"] = JSON.init(hasBackgroundColor) 
    return json 
  }
}