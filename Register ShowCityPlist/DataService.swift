//
//  DataService.swift
//  Register ShowCityPlist
//
//  Created by admin on 3/29/20.
//  Copyright © 2020 Long. All rights reserved.
//

import Foundation
struct GetCity {
    var name: String
    var codeCity: Int
    init(name: String, codeCity: Int) {
        self.name = name
        self.codeCity = codeCity
    }
}

struct getDistricts {
    var codeCiti: Int
    var codeDistricts: Int
    var name: String
//    init?(codeCiti: Int, codeDistricts: Int, name: String) {
//        self.codeCiti = codeCiti
//        self.codeDistricts = codeDistricts
//        self.name = name
//    }
    
    init?(dictionary: Dictionary<AnyHashable, Any>) {
        guard let codeCiti = dictionary["CitiCode"] as? Int else { return nil }
        guard let codeDistricts = dictionary["DistrictCode"] as? Int else { return nil }
        guard let name = dictionary["Name"] as? String else { return nil }
        self.codeCiti = codeCiti
        self.codeDistricts = codeDistricts
        self.name = name
    }
}

class DataService {
    static let share = DataService()
    var cities: [GetCity] = []
    func getCityOfPlist() -> [GetCity] {
        cities = []
        if let path = Bundle.main.path(forResource: "Cities", ofType: "plist"),
            let dictionaryCity = NSDictionary(contentsOfFile: path) as? Dictionary<AnyHashable, Any> {
            if let arrayCity = dictionaryCity["Cities"] as? [Dictionary<AnyHashable, Any>] {
                for city in arrayCity {
                    let cityOnce = GetCity(name: city["Name"] as! String, codeCity: city["CityCode"] as! Int )
                    cities.append(cityOnce)
                }
            }
        }
        return cities
    }
    
    var districtss: [getDistricts]?
    func getDisTrictsOfPlist() -> [getDistricts] {
        districtss = []
        if let path = Bundle.main.path(forResource: "Districts", ofType: "plist"), let dictionaryDicTricts = FileManager.default.contents(atPath: path) {
            if let plistDict = try? PropertyListSerialization.propertyList(from: dictionaryDicTricts, options: .mutableContainersAndLeaves, format: nil) as? Dictionary<AnyHashable, Any> {
                if let dictionary = plistDict["Districts"] as? [Dictionary<AnyHashable, Any>] {
                    for dictricts in dictionary {
                        if let districtApend = getDistricts(dictionary: dictricts) {
                            districtss?.append(districtApend)
                        }
                    }
                }
            }
        }
        return districtss!
    }
    
//    var districtss: [getDistricts]?
//    func getDisTrictsOfPlist() -> [getDistricts] {
//       districtss = []
//        if let path = Bundle.main.path(forResource: "Districts", ofType: "plist"),
//            let dictionaryDisTricts = NSDictionary(contentsOfFile: path) as? Dictionary<AnyHashable, Any> {
//            if let arrayDistricts = dictionaryDisTricts["Districts"] as? [Dictionary<AnyHashable, Any>] {
//                for districts in arrayDistricts {
//                    if let disTrictsApend = getDistricts(dictionary: districts) {
//                        districtss?.append(disTrictsApend)
//                    }
//                }
//            }
//        }
//        return districtss!
//    }

    func getPlist(citiData: Int) -> [getDistricts] {
        getDisTrictsOfPlist()
        var dataFile: [getDistricts] = []
        // xét phần tử trong mảng getDictricts
        for score in districtss ?? [] {
            if score.codeCiti == citiData {
                dataFile.append(score)
            }
        }
        return dataFile
    }
}

//struct Preferences: Codable {
//    var webserviceURL:String
//    var itemsPerPage:Int
//    var backupEnabled:Bool
//}

//if  let path        = Bundle.main.path(forResource: "Preferences", ofType: "plist"),
//    let xml         = FileManager.default.contents(atPath: path),
//    let preferences = try? PropertyListDecoder().decode(Preferences.self, from: xml)
//{
//    print(preferences.webserviceURL)
//}

