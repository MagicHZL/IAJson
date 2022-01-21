//
//  main.swift
//  CreatFile
//
//  Created by 忠良 on 2021/11/9.
//

/**
 如果你项目是用SwiftyJSON
 此工程可帮助你快速生成类文件
 ***/

import Foundation

//类必须继承 KHBaseModel
//类名后缀必须为 Model

/**配置参数**/

var isNeedCopy  = true
var isNeedToJson = true

/****/



#if DEBUG
var orPath = "/Users/haozhongliang/Downloads/CreatModelFile/OR/" //根据自己目录修改
#else
var bp = Bundle.main.bundlePath
var orPath : String = bp + "/OR/"
print("\(bp) ___ \(orPath)")
#endif





var allnameJson = (try? Data.init(contentsOf: URL.init(fileURLWithPath: orPath + "name.json"))) ?? Data()
var allnameDic = (try? JSONSerialization.jsonObject(with: allnameJson , options: .allowFragments)) as? [String : String] ?? [:] //将名字配置在  name.json

var classModel = allnameDic["_class"] ?? "Model" // 最外层的model
var keyModels = allnameDic //key 转 Model 名字必须在此配置

var orJson = orPath + "orjson.json" //必须为 字典

var dataJson = try Data.init(contentsOf: URL.init(fileURLWithPath: orJson))

var jsonDic = try JSONSerialization.jsonObject(with: dataJson , options: .allowFragments) as? [String : Any]

func classDic(or:[String:Any],orClass:String) -> [ String : [String : String] ]{
    
    var dic : [ String : [String : String] ]  = [:]
    
    func paramDic (pr:[String:Any]) -> [String : String] {
        
        var param  : [String : String] = [:]
        
        for (key, val) in (pr) {
            if val is Int {
                if let v = val as? NSNumber {
                    let str = type(of: v).description()
                    if str.contains("Boolean") {
                        param[key] = "Bool"
                    }else{
                        param[key] = "Int"
                    }
                }
               
            }else if  val is String {
                param[key] = "String"
            }else if  val is Bool {
                param[key] = "Bool"
            }else if  val is Double {
                param[key] = "Double"
            } else if let v = val as?  [String] {
                if v.count == 0 {
                    if let name = keyModels[key] {
                        param[key] = "[" + name + "]"
                    }else{
                        param[key] = "JSON"
                    }
                }else{
                    param[key] = "[String]"
                }
                
            } else if  val is [Bool] {
   
                param[key] = "[Bool]"
            } else if  val is [Int] {
                
                param[key] = "[Int]"
            } else if let v = val as? [[String:Any]] {
                
                if let name = keyModels[key] ,let first = v.first{
                    param[key] = "[" + name + "]"
                    dic[name] = paramDic(pr: first)
                }else{
                    param[key] = "JSON"
                }
                
            }else if let v = val as? [String : Any] {
                
                if let name = keyModels[key] {
                    param[key] = name
                    dic[name] = paramDic(pr: v)
                }else{
                    param[key] = "JSON"
                }
            }
        }
        return param
    }
        
    dic[orClass] = paramDic(pr: or)
    return dic
}

var classNDic : [String : [String : String]] = classDic(or: jsonDic ?? [:], orClass: classModel)

var typeNor : [String : String] = ["String" : "\"\"","Int" : "0","Bool" : "false" , "[]" : "[]","JSON":"JSON()","Double":"0"] //可拓展配置类型的默认值

var funcDic : [String : String] = ["String" : ".stringValue" , "Int" : ".intValue" , "Bool" : ".boolValue","Double":".doubleValue" , "[ ]" : ".arrayObject as? [ ] ?? []","JSON":""] //可拓展配置类型对应的JSON取值方法


func  creatSwiftModel(className:String,classDic:[String : String]){

    let baseName = "KHBaseModel" // 这个不可变

    for (_,val) in classDic {
        
        if val.contains("[") , val.contains("]"){
            
            if let str = funcDic["[ ]"]{
                funcDic[val] = str.replacingOccurrences(of: "[ ]", with: val)
            }
            
            typeNor[val] = "[]"
        }
        
    }


    func checkType(str:String) -> Bool {
        
        if (typeNor[str] != nil && funcDic[str] != nil ) || str.contains("Model") {
            
            return true
        }
        
        return false
    }


    let file : FileManager = FileManager.default
    var str : String = ""
    str.append("import Foundation \n")
    str.append("import SwiftyJSON \n")
    str.append("class \(className): \(baseName) { \n")
    str.append("  override init() { \n")
    str.append("    super.init() \n")
    str.append("  } \n")

    //添加参数
    for (key,val) in classDic {
        
        if !checkType(str: val){
            print("\(val)  不在配置中")
        }else{

            if val.contains("Model") {
                
                if val.contains("[") {
                    str.append("  var \(key) : \(val) = [] \n")
                }else{
                    str.append("  var \(key) : \(val) = \(val)() \n")
                }
                
            }else{
                str.append("  var \(key) : \(val) = \(typeNor[val]!) \n")
            }
            
        }
        
    }

    str.append("  required init(json: JSON) { \n")
    str.append("    super.init(json: json) \n")
    //赋值方法
    for (key,val) in classDic {
        
        if !checkType(str: val){
            print("\(val)  不在配置中")
        }else{
            
            if val.contains("Model") {
                
                if val.contains("[") {
                    let v = val.replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
                    str.append("    \(key) = \(baseName).getModes(type: \(v).self, jsons: json[\"\(key)\"].arrayValue) \n")
                    
                }else{
                    str.append("    \(key) = \(val)(json: json[\"\(key)\"]) \n")
                }
                
            }else{
                str.append("    \(key) = json[\"\(key)\"]\(funcDic[val]!) \n")
            }
            
        }
    }

    str.append("  } \n")
    
    //复制自己
    
    if isNeedCopy {
        str.append("//复制自己 \n")
        str.append("  func copySelf() -> \(className) { \n")
        str.append("    var mo = \(className)() \n")
        
        for (key,val) in classDic {
            
            if !checkType(str: val){
                print("\(val)  不在配置中")
            }else{
                str.append("    mo.\(key) = self.\(key) \n")
            }
        }
        
        str.append("    return mo \n")
        str.append("  }\n")
    }
    
    if isNeedToJson {
        
        str.append("//转为JSON \n")
        str.append("  func toJson() -> JSON { \n")
        str.append("    var json = JSON() \n")
        
        for (key,val) in classDic {
            
            if !checkType(str: val){
                print("\(val)  不在配置中")
            }else{
                
                if val.contains("Model") {
                    
                    if val.contains("[") {
                        
                        str.append("    var \(key)_mos : [JSON] =  [] \n")
                        str.append("    for val in \(key) { \n")
                        str.append("       \(key)_mos.append(val.toJson())\n")
                        str.append("    } \n")
                        str.append("    json[\"\(key)\"] = JSON(\(key)_mos) \n")
                        
                    }else{
                        str.append("    json[\"\(key)\"] = \(key).toJson() \n")
                    }
                    
                }else{
                    
                    str.append("    json[\"\(key)\"] = JSON.init(\(key)) \n")
                }
                
            }
        }
        
        str.append("    return json \n")
        str.append("  }\n")

    }
    
    
    
    str.append("}")

    file.createFile(atPath: "\(orPath)Models/\(className).swift", contents:str.data(using: .utf8) ?? Data() , attributes: nil)
    
}

print(classNDic)

for (key,val) in classNDic {
    creatSwiftModel(className: key, classDic: val)
}

print("======Model构建完成======")










