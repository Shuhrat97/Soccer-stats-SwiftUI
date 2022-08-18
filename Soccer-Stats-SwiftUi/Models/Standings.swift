//
//  Standings.swift
//  Soccer-Test
//
//  Created by Shuhrat Nurov on 06/08/22.
//

import Foundation

struct DetailSeason:Codable{
    let name:String
    let abbreviation:String
    let seasonDisplay:String
    let season:Int
    let standings:[Standing]
}

struct Standing:Codable, Identifiable{
    let id = UUID()
    let team:Team
    let stats:[Stat]
}

struct Team:Codable{
    let id:String
    let uid:String
    let location:String
    let name:String
    let abbreviation:String
    let displayName:String
    let shortDisplayName:String
    let isActive:Bool
    let logos:[Logo]
}

struct Stat:Codable{
    let id:String?
    let summary:String?
    let name:String
    let displayName:String
    let shortDisplayName:String
    let description:String
    let abbreviation:String
    let type:String
    let value:Int?
    let displayValue:String
}

struct Logo:Codable{
    let href:String
    let width:Int
    let height:Int
    let alt:String
    let rel:[String]
    let lastUpdated:String
}
