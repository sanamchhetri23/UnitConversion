//
//  ContentView.swift
//  UnitCoversion
//
//  Created by Peek A Boo on 2025-09-28.
//
import SwiftUI

struct ContentView: View {
    @State private var inputValue: String = ""
    @State private var result: Double? = nil
    @State private var selectedUnit = "Celsius to Farhenheit"
    @State private var message = "This is the result text"
    let conversionUnits: Array<String> = ["Celsius to Farhenheit", "Farhenheit to Celsius", "Kilometers to Miles"]
    
    var body: some View {
        VStack {
            Text("Unit to Unit Converter").fontWeight(.bold).font(.largeTitle)
            HStack{
                TextField("Enter the value", text: $inputValue).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.numberPad)
                Picker("Conversion Type", selection: $selectedUnit){
                    ForEach(conversionUnits, id: \.self){
                        unit in
                        Text(unit).font(.title).padding()
                    }
                }.pickerStyle(.menu)
            }
            Button("Convert") {
                let converted = convertUnit(Double(inputValue) ?? 0)
                
                // Determine the unit for display
                var unit = ""
                switch selectedUnit {
                case "Celsius to Farhenheit":
                    unit = "°F"
                case "Farhenheit to Celsius":
                    unit = "°C"
                case "Kilometers to Miles":
                    unit = "mi"
                default:
                    unit = ""
                }
                
                message = "Converted Value: \(converted) \(unit)"
                print("The converted value is: \(converted) \(unit)")
            }

            .padding()
            .background(Color.blue)
            .foregroundStyle(.white)
            .cornerRadius(10)
            
            .padding()
            Text(message).bold()
        }
    }
    func convertUnit(_ number: Double)-> Double{
        if selectedUnit == "Celsius to Farhenheit"{
            return (number * 9/5) + 32
        } else if (selectedUnit == "Farhenheit to Celsius"){
            return (number - 32) * 5 / 9
        }
        else if (selectedUnit == "Kilometers to Miles"){
            return number*0.621371
        }
        return number
    }
    
   
}

#Preview {
    ContentView()
}
