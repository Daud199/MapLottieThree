//
//  LottieFIleView.swift
//  MapLottieThree
//
//  Created by labadmin on 23/03/23.
//

import SwiftUI
import Lottie

struct LottieFIleView: View {
    let interactLottie = LottieInteractView(animationView: LottieAnimationView(name: "Heart"))
    var body: some View {
        VStack{
            LottieCustomView(animName: "Coworkers")
            interactLottie
                .onTapGesture {
                    interactLottie.playAnimation()
                }
        }
    }
}

struct LottieCustomView: UIViewRepresentable {
    var animName: String
    let animWrapper: UIView = UIView()

    func makeUIView(context: Context) -> UIView {
        var animationView = LottieAnimationView(name: animName)
        animationView.loopMode = LottieLoopMode.loop
        animationView.contentMode = .scaleAspectFit
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animWrapper.addSubview(animationView)
        
        animationView.centerXAnchor.constraint(equalTo: animWrapper.centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: animWrapper.centerYAnchor).isActive = true
        
        animationView.heightAnchor.constraint(equalToConstant: 450).isActive = true
        animationView.widthAnchor.constraint(equalToConstant: 450).isActive = true
        
        animationView.play()

        return animWrapper
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

struct LottieInteractView: UIViewRepresentable {
    var animationView: LottieAnimationView
    let animWrapper: UIView = UIView()

    func makeUIView(context: Context) -> UIView {
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        animWrapper.addSubview(animationView)
        
        animationView.centerXAnchor.constraint(equalTo: animWrapper.centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: animWrapper.centerYAnchor).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: 450).isActive = true
        animationView.widthAnchor.constraint(equalToConstant: 450).isActive = true
        
        return animWrapper
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    func playAnimation() {
        animationView.play()
    }
}

struct LottieFIleView_Previews: PreviewProvider {
    static var previews: some View {
        LottieFIleView()
    }
}
