//
//  Spellwords.swift
//  SwiftUIDemo1
//
//  Created by Neosoft on 12/02/20.
//  Copyright © 2020 Neosoft. All rights reserved.
//

import SwiftUI

struct Spellwords: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var title = ""
    @State private var message = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord,onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
            }
            .navigationBarTitle(rootWord)
        }
        .onAppear(perform: startGame)
        .alert(isPresented: $showingError) { Alert(title: Text(title), message: Text(message), dismissButton: .default(Text("Ok")))
        }
    }
    
    func addNewWord() {
        
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            return
        }
        
        guard isOriginal(word: answer) else{
            self.erorShow(title: "Word used already", msg: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            self.erorShow(title: "Word not recognized", msg: "You can't just make them up, you know!")
            return
        }
        
        usedWords.insert(answer, at: 0)
        newWord = ""
        
        
    }
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    
    func startGame() {
        
        let startWordsURL =
        "cat Animals dummy test"
        
        let allWords = startWordsURL.components(separatedBy: " ")
        
        rootWord = allWords.randomElement() ?? "silkworm"
    
        
        return
    }
    
    func isOriginal(word: String) -> Bool {
     
        !usedWords.contains(word)
    }
    
    func erorShow(title:String,msg:String){
        self.title = title
        self.message = msg
        showingError = true
        
    }
    
    
}


