//
//  ContentView.swift
//  Meal-Prep-Planner
//
//  Created by Suryateja Duvvuri on 1/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack
        {
            Text("Offers buttons")
            
            Section
            {
                NavigationLink(destination: DurationView(), label: {
                    Text("Make a meal")
                })
                
                NavigationLink(destination: IngredientsView(), label: {
                    Text("Add/Remove Ingredients")
                })
            }
            .padding()
            .navigationBarTitle("Home Page")
        }
        
        
       
    }
}

struct IngredientsView : View {
    @State private var ingredients = [String]()
    @State private var currentIngredient = ""
    var body: some View {
        List
        {
            ForEach(ingredients, id: \.self)
            {
                Text($0)
            }.onDelete(perform: { indexSet in
                ingredients.remove(atOffsets: indexSet)
            })
        }
        
        TextField("Enter the ingredient", text: $currentIngredient).onSubmit {
            ingredients.append(currentIngredient)
        }.padding()
    }
}

struct DurationView : View {
    var body: some View {
        NavigationView
        {
            VStack
            {
                Text("Asks for duration for the meals")
                NavigationLink(destination: MealPlanView(), label: {
                    Text("5 mins")
                })
            }.navigationBarTitle("Duration Page")
                .navigationBarHidden(true)
                .padding()
        }
       
    }
}


struct MealPlanView : View {
    
    @State private var selectedMeals = ""
    @State private var meals: [String] = ["Mac and Cheese", "Pasta", "Curd rice"]
    var body: some View {
        NavigationStack{
            
            NavigationLink(destination: CheckIngredientsView(), label: {
                ForEach(meals, id: \.self)
                {   meal in
                    
                    Text(meal).frame(width: 100, height: 50).font(.headline).fontDesign(.rounded).background(.gray).foregroundColor(.white)

                }
            })
          
            
            .pickerStyle(.inline)
            .navigationBarTitle("Suggested meals")
        }
    }
}

struct CheckIngredientsView : View {
    var body: some View {
        NavigationView
        {
            NavigationLink(destination: TutorialView())
            {
                Text("Asks to check ingredients before tutorial")
            }
        }
    }
}

struct TutorialView : View {
    @State private var steps : [String] = ["0", "1", "2", "3", "4"]
    var body: some View {
        ScrollView(.horizontal)
        {
            HStack{
                ForEach(steps, id: \.self)
                {
                    Text($0).clipShape(.rect).background(.red).padding(5).font(.title)
                }
            }
        }.scrollTargetLayout()
            .navigationTitle("Tutorial Scroll")
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
