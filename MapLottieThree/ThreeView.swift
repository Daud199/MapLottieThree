//
//  ThreeView.swift
//  MapLottieThree
//
//  Created by labadmin on 23/03/23.
//

import SwiftUI
import SceneKit

struct ThreeView: View {
    var mainScene: SCNScene? = SCNScene.init(named: "SAMSUNG_Laptop.scn")
    var body: some View {
        ZStack {
            MyModelView(scene: mainScene!)
            Text("SUPER OFFERTAAA")
        }
    }
}

struct MyModelView: UIViewRepresentable {
    var scene: SCNScene
    
    func makeUIView(context: Context) -> SCNView {
        let viewScene = SCNView()
        viewScene.allowsCameraControl = true
        viewScene.autoenablesDefaultLighting = true
        viewScene.scene = scene
        return viewScene
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
    }
}

struct ThreeView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeView()
    }
}
