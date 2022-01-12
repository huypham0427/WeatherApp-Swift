//
//  ContentView.swift
//  WeatherApp
//
//  Created by Stitch on 2/28/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        
        // Make the background
        ZStack() {
            BackgroundView(
                topColor: isNight ? .black : .blue,
                bottomColor: isNight ? .gray : Color("lightBlue"))
        
            // Get the main weather
            VStack {
//                Text("Cupertino, CA")
//                    .font(.system(size: 32, weight:.medium, design: .default))
//                    .foregroundColor(.white)
//                    //.background(.blue)
//                    //.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                    .padding(10)
                    CitytextView(cityName: "Cupertino, CA")
                
                
                // Make the main symbol weather and temp
//                VStack(spacing: 2) {
//                    Image(systemName: "cloud.sun.fill")
//                    .renderingMode(.original)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 180, height: 180)
//
//                    Text("76°")
//                    .font(.system(size: 70, weight:.medium))
//                    .foregroundColor(.white)
//
//                }
//                Spacer()
                
                MainweatherView(imageName: isNight ? "moon.fill" :  "cloud.sun.fill", temperature: isNight ? 44 : 76)
                
                Button {
                    isNight.toggle()
                } label: {
//                    Text("Change Day Time")
//                        .frame(width: 280, height: 50)
//                        .background(Color.white)
//                        .font(.system(size: 22, weight: .bold, design: .default))
//                        .cornerRadius(20)
                    
                    weatherButton(title: "Change Day Time", textColor: .blue, BackgroundColor: .white)
                }
                Spacer()
            }
            
            HStack(spacing: 20) {
                WeatherDayView(DayofWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
               
                WeatherDayView(DayofWeek: "WED", imageName: "sunrise.fill", temperature: 64)
                WeatherDayView(DayofWeek: "THU", imageName: "cloud.drizzle", temperature: 44)
                WeatherDayView(DayofWeek: "FRI", imageName: "cloud.heavyrain", temperature: 33)
                WeatherDayView(DayofWeek: "SAT", imageName: "cloud.sun.fill", temperature: 77)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}


struct WeatherDayView: View {
    
    var DayofWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(DayofWeek)
                .font(.system(size: 25, weight: .medium))
                .foregroundColor(.white)
                .padding(.top, 70)
            Image(systemName: imageName)
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .scaleEffect(2)
                .padding(.top, 3)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
                .padding(.top, 3)
            
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            //Color(.blue)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CitytextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight:.medium, design: .default))
            .foregroundColor(.white)
            //.background(.blue)
            //.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(10)
    }
}

struct MainweatherView: View {
    var imageName: String
    var temperature: Int
    
        var body: some View {
            VStack(spacing: 2) {
                Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
        
                Text("\(temperature)°")
                .font(.system(size: 70, weight:.medium))
                .foregroundColor(.white)
                    
            }
            Spacer()
        }
}
