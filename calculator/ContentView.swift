//
//  ContentView.swift
//  calculator
//
//  Created by Bradley on 6/11/20.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var calculationHistory = ""
    @State var inputNumber = ""
    @State var outputNumber = ""
    @State var selectedOperator = ""
    
    func calculate() {
        if (inputNumber.count > 0){
            if (outputNumber.count > 0){
                var answer : Double = 0
                if (selectedOperator == "*"){
                    answer = Double(inputNumber)! * Double(outputNumber)!
                    outputNumber = String(answer)
                } else if (selectedOperator == "/"){
                    answer = Double(outputNumber)! / Double(inputNumber)!
                    outputNumber = String(answer)
                } else if (selectedOperator == "+"){
                    answer = Double(inputNumber)! + Double(outputNumber)!
                    outputNumber = String(answer)
                } else if (selectedOperator == "-"){
                    answer =  Double(outputNumber)! - Double(inputNumber)!
                    outputNumber = String(answer)
                }
                
                calculationHistory = calculationHistory + " \(selectedOperator) \(inputNumber) = \(String(answer)) | "
            } else {
                outputNumber = inputNumber
            }
        }
    }
    
    var body: some View {
        ZStack{
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            
            VStack{
                Text("Basic Calculator")
                    .bold()
                    .padding()
                
                Text(calculationHistory)
                
                HStack{
                    Spacer()
                    
                    CustomTextField(placeholder: Text("Enter Value").foregroundColor(.black), text: $inputNumber)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .onReceive(Just(inputNumber)) { newValue in
                            let filtered = newValue.filter { "0123456789.".contains($0) }
                            if filtered != newValue {
                                self.inputNumber = filtered
                            }
                        }

                    Spacer()
                }
                
                /*let numberFormatter = NumberFormatter()
                let formattedNumber = numberFormatter.string(from: NSNumber(value: Double(outputNumber)!))*/
                Text("= \(outputNumber)")
                
                HStack{
                    Spacer()
                    
                    Button(action: {
                        selectedOperator = "+"
                        calculate()
                    }) {
                        Text("+")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 30)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        selectedOperator = "-"
                        calculate()
                    }) {
                        Text("-")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 30)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                    Spacer()
                    Button(action: {
                        selectedOperator = "*"
                        calculate()
                    }) {
                        Text("x")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 30)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                    Spacer()
                    Button(action: {
                        selectedOperator = "/"
                        calculate()
                    }) {
                        Text("/")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 30)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                    Spacer()
                }
                
                HStack{
                    Button(action: {
                        inputNumber = ""
                        outputNumber = ""
                        selectedOperator = ""
                        calculationHistory = ""
                    }) {
                        Text("C")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 30)
                            .background(Color.red)
                            .cornerRadius(20)
                    }.padding()
                    
                    Button(action: {
                        if (inputNumber.count > 0){
                            if (outputNumber.count > 0){
                                calculate()
                            } else {
                                outputNumber = inputNumber
                            }
                        }
                    }) {
                        Text("=")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 30)
                            .background(Color.green)
                            .cornerRadius(20)
                    }.padding()
                }
            }.padding([.leading, .trailing], 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
