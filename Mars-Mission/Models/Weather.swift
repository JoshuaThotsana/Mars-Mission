//
//  Weather.swift
//  Mars-Mission
//
//  Created by Thotsana Mabotsa on 2020/11/17.
//

import Foundation

struct SolKeys: Codable {
	let solKeys: [String]

	enum CodingKeys: String, CodingKey {
		case solKeys = "sol_keys"
	}
}

struct SolNumber: Codable {
	let solNumber: Sol
	enum CodingKeys: String, CodingKey {
		case solNumber
		var rawValue: String {
			get {
				"698"
			}
		}
	}
}

struct Sol: Codable {
	let at: At
	let firstUTC: String
	let hws: At
	let lastUTC: String
	let pre: At

	enum CodingKeys: String, CodingKey {
		case at = "AT"
		case firstUTC = "First_UTC"
		case hws = "HWS"
		case lastUTC = "Last_UTC"
		case pre = "PRE"
	}
}

struct At: Codable {
	let av: Double
	let ct: Int
	let mn, mx: Double
}
