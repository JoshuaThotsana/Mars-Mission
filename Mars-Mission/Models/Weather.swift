//
//  Weather.swift
//  Mars-Mission
//
//  Created by Thotsana Mabotsa on 2020/11/17.
//

import Foundation

struct Sol: Decodable {
	
	var AT: AtmosphericTemperature?
	var First_UTC: String?
	var Last_UCT: String?
	var PRE: AtmosphericPressure?
	var Season: String?
	
}

struct AtmosphericTemperature: Decodable {
	
	var av: Double?
	var ct: Int?
	var mn: Double?
	var mx: Double?
	
}

struct AtmosphericPressure: Decodable {
	
	var av: Double?
	var ct: Int?
	var mn: Double?
	var mx: Double?
	
}


