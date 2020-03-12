//
//  Animations.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 11/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI

struct Animations: View {
    
   @State var name = "Tim McGraw"
    
       var body: some View {
        ScrollView{
            VStack(spacing:50){
                
                AngleAnimation()
                LinearAnimation()
                springAnimation()
                ToggleAnimation()

                AddRemoveViewWithAnimation()
                MultipleAnimations()
            }
        }
          
       }
}


struct AngleAnimation: View {
    @State private var angle: Double = 0
    @State private var borderThickness: CGFloat = 1

    var body: some View {
        Button(action: {
            self.angle += 45
            self.borderThickness += 1
        }) {
            Text("Tap here")
                .padding()
                .border(Color.red, width: borderThickness)
                .rotationEffect(.degrees(angle))
                
                .animation(.easeIn)
            
            
        }
    }
}

struct LinearAnimation: View {
  @State private var scale: CGFloat = 1

    var body: some View {
        Button(action: {
              self.scale += 1
        }) {
            Text("Tap here")
                .scaleEffect(scale)
                //.animation(.linear)
             .animation(.linear(duration: 3))
            
        }
        
    }
}


struct springAnimation: View {
    @State private var angle: Double = 0

    var body: some View {
       Button(action: {
            self.angle += 45
        }) {
            Text("Tap here")
                .padding()
                .rotationEffect(.degrees(angle))
                .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 0.5, initialVelocity: 5))
        }
    }
}

struct ToggleAnimation: View {
    @State private var showingWelcome = false

    var body: some View {
        VStack(alignment: .center){
            Toggle(isOn: $showingWelcome.animation()) {
                Text("Toggle label")
            }

            if showingWelcome {
                Text("Hello World")
            }
          
        }
    }
}

struct AnimationDelay: View {
       @State private var animationAmount: CGFloat = 1
    @State private var color = Color.red
    
    var colors = [Color.red,Color.yellow,Color.blue,Color.black,Color.green,Color.gray,Color.pink]


    var body: some View {
        Button("Tap Me") {
            self.color =  self.colors.randomElement() ?? Color.red
            // self.animationAmount += 1
        }
        .padding(40)
        .background(color)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeOut(duration: 1)
                        .repeatForever(autoreverses: false)
                )
        )
        .onAppear {
            self.animationAmount = 2
        }
    }
        
}

struct MultipleAnimations: View {
@State var isEnabled = false

var body: some View {
    Button("Tap Me") {
        self.isEnabled.toggle()
    }
  
    .foregroundColor(.white)
    .frame(width: 200, height: 200)
    .background(isEnabled ? Color.green : Color.red)
    .animation(nil)
    .clipShape(RoundedRectangle(cornerRadius: isEnabled ? 100 : 0))
    .animation(.default)
      .padding(.bottom,20)
    }
    
}


// Mark :- Add remove view with Animations

struct AddRemoveViewWithAnimation: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.showDetails.toggle()
                }
            }) {
                Text("Tap to show details").padding()
            }

            if showDetails {
                Text("edThe set of edges along which to inset this view.lengthThe amount to inset this view on each edge. If nil, the amount is the system default amount.").padding()
                //.transition(.move(edge: .bottom))
               // .transition(.slide)
                //.transition(.scale)
                //.transition(AnyTransition.move(edge: .bottom).combined(with: .scale))
                .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))

            }
        }
     .navigationBarTitle("SwiftUI Animations",displayMode: .inline)
    }
}
