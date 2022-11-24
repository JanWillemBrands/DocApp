//
//  ContentView.swift
//  DocApp
//
//  Created by Johannes Brands on 23/11/2022.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    @Binding var document: DocAppDocument
    
    @State var renderer: SCNSceneRenderer?
    
    @State var showWireframe = false

    var body: some View {
        VStack {
            TextEditor(text: $document.text)
            SceneViewContainer(scene: $document.scene, renderer: $renderer, showWireframe: $showWireframe)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(DocAppDocument()))
    }
}
