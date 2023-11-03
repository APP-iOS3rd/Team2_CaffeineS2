//
//  SeasonedGrilledEelView.swift
//  FoodNutrition
//
//  Created by Minjae Kim on 11/2/23.
//

import SwiftUI

struct SeasonedGrilledEelView: View {
    
    @State var ing2: [String:String] = ["eel": "1마리", "oil": "1T", "salt": "조금", "red_pepper_paste": "2T", "soy_sauce": "1T", "red_pepper_powder": "1T", "minced_garlic": "1T", "wine": "1T", "sugar": "1T", "oligosaccharide": "1T"
    ]
    
	@Binding var nutrition: Nutrition
	
	var body: some View {
        VStack {
            List {
                Section {
                    IngredientView(ing: ing2["eel"] ?? "", title:"장어")
                    IngredientView(ing: ing2["oil"] ?? "", title:"식용유")
                    IngredientView(ing: ing2["salt"] ?? "", title:"소금")
                } header: {
                    Text("메인 재료")
                }
                Section {
                    IngredientView(ing: ing2["red_pepper_paste"] ?? "", title:"고추장")
                    IngredientView(ing: ing2["soy_sauce"] ?? "", title:"간장")
                    IngredientView(ing: ing2["red_pepper_powder"] ?? "", title:"고춧가루")
                    IngredientView(ing: ing2["minced_garlic"] ?? "", title:"다진마늘")
                    IngredientView(ing: ing2["wine"] ?? "", title:"와인")
                    IngredientView(ing: ing2["sugar"] ?? "", title:"설탕")
                    IngredientView(ing: ing2["oligosaccharide"] ?? "", title:"올리고당")
                } header: {
                    Text("소스 재료")
                }
            }
            .navigationTitle("Ingredients")
        }
	}
}

struct IngredientView: View {
    var ing: String
    var title: String
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(ing)
        }
    }
}

#Preview {
    @StateObject var foodStore: FoodStore = FoodStore(food: foodData)
    return SeasonedGrilledEelView(nutrition: $foodStore.food.nutrition[2])
}
