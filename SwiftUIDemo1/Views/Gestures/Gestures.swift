//
//  Gusetures.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 11/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI

struct Gestures: View {
    
    var body: some View{
        
        VStack(spacing:50){
            Gestures1()
            Gestures2()
        }
        
    }
    
}

struct Gestures1: View {
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1
    
    var body: some View {
        Text("MagnificationGesture")
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { amount in
                        
                        self.currentAmount = amount - 1
                        print(self.currentAmount)
                }
                .onEnded { amount in
                    self.finalAmount += self.currentAmount
                    self.currentAmount = 0
                }
        )
    }
}


struct Gestures2: View {
    // how far the circle has been dragged
    @State private var offset = CGSize.zero
    
    // where it is currently being dragged or not
    @State private var isDragging = false
    
    var body: some View {
        // a drag gesture that updates offset and isDragging as it moves around
        let dragGesture = DragGesture()
            .onChanged { value in self.offset = value.translation }
            .onEnded { _ in
                withAnimation {
                    self.offset = .zero
                    self.isDragging = false
                }
        }
        
        // a long press gesture that enables isDragging
        let tapGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    self.isDragging = true
                }
        }
        
        // a combined gesture that forces the user to long press then drag
        let combined = tapGesture.sequenced(before: dragGesture)
        
        // a 64x64 circle that scales up when it's dragged, sets its offset to whatever we had back from the drag gesture, and uses our combined gesture
        return Circle()
            .fill(Color.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            //.offset(offset)
            .gesture(combined)
    }
}
