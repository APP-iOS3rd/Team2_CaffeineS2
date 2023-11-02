//
//  FoodData.swift
//  FoodNutrition
//
//  Created by Minjae Kim on 11/2/23.
//

import Foundation

var foodData: Food = Food(id: UUID().uuidString, nutrition: loadJson("foodInfo.json"), isStar: false)

func loadJson<T: Decodable>(_ filename: String) -> T {
	let data: Data
	
	guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
	else { fatalError("\(filename) not found") }
	
	do {
		data = try Data(contentsOf: file)
	} catch {
		fatalError("Could not load \(filename): \(error)")
	}
	
	do {
		return try JSONDecoder().decode(T.self, from: data)
	} catch {
		fatalError("Unable to parse \(filename): \(error)")
	}
}