//
//  HomePage.swift
//  LocalBrands
//
//  Created by Fatima Alismail on 04/11/1444 AH.
//

import SwiftUI
import AVKit

struct SaudiBrands: View {
    
    @State var index = 0
    @State var top = 0
    @State var date = [
        
        Video(id: 0, player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "Video1", ofType: ".mp4")!)), replay: false),
        Video(id: 1, player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "Video2", ofType: ".mp4")!)), replay: false),
        Video(id: 2, player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "Video3", ofType: ".mp4")!)), replay: false),
        Video(id: 3, player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "Video4", ofType: ".mp4")!)), replay: false),
        Video(id: 4, player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "Video5", ofType: ".mp4")!)), replay: false),
        Video(id: 5, player: AVPlayer (url: URL(fileURLWithPath: Bundle.main.path(forResource: "Video6", ofType: ".mp4")!)), replay: false),

    ]
    
    var body: some View {
        ZStack {
            
            PlayerScrollView(date: self.$date)
            
            VStack{
                
                HStack(spacing:17){
                    
                    Button(action: {
                       
                        self.top = 0
                        
                    }){
                        
                        Text("Favorite")
                            .foregroundColor(self.top == 0 ? .white : Color.white.opacity(0.45 ))
                            .fontWeight(self.top == 0 ? .bold : .none)
                            .padding(.vertical)
                        
                    }
                    
                    Button(action: {
                       
                        self.top = 1
                        
                    }){
                        
                        Text("For You")
                            .foregroundColor(self.top == 1 ? .white : Color.white.opacity(0.45 ))
                            .fontWeight(self.top == 1 ? .bold : .none)
                            .padding(.vertical)
                    }
                }
                
                Spacer()
                
                HStack{
                    
                    Spacer()
                    
                    VStack(spacing: 20){
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("pic")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 55,height: 55)
                                .clipShape(Circle())
                        }
                        Button(action: {
                            
                        }){
                            VStack(spacing :-10){
                                
                                Image(systemName: "suit.heart.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                                
                                Text("")
                                    .foregroundColor(.white)
                                
                            }
                        }
                        
//                        Button(action: {
//
//                        }){
//                            VStack(spacing :8){
//
//                                Image(systemName: "message.fill")
//                                    .font(.title)
//                                    .foregroundColor(.white)
//
//
//                                Text("1021")
//                                    .foregroundColor(.white)
//                            }
//                        }
                        
                        Button(action: {
                            
                        }) {
                            VStack(spacing :8){
                                
                                Image(systemName: "square.and.arrow.up")
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                                
                                Text("share")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(.bottom,55)
                    .padding(.trailing)
                    
                }
                
                HStack(spacing : 0){
                    
                    Button (action:{
                        
                        self.index = 0
                        
                    })  {
                        
                        Image("heart")
                            .resizable()
                            .frame(width: 25 , height: 25)
                            .foregroundColor(self.index == 0 ? .white : Color.white.opacity(0.35))
                            .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button (action:{
                        
                        self.index = 1
                        
                    })  {
                        
//                        Image("Share")
//                            .resizable()
//                            .frame(width: 25 , height: 25)
//                            .foregroundColor(self.index == 1 ? .white : Color.white.opacity(0.35))
//                            .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button (action:{
                        
                        self.index = 2
                        
                    })  {
                        
                        Image("Pic")
                            .resizable()
                            .frame(width: 25 , height: 25)
                            .foregroundColor(self.index == 2 ? .white : Color.white.opacity(0.35))
                        
                    }
                }
                .padding(.horizontal)
                
            }
           .padding(.top,50)
           .padding(.bottom,50)
            
        }
        
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .edgesIgnoringSafeArea(.all)
        }
    }

struct PlayerView : View {
    
    @Binding var date : [Video]
    
    var body: some View {
        
        VStack(spacing : 0){
            
            ForEach(0..<self.date.count){i in
               
                ZStack{
                    
                    Player(player: self.date[i].player)
                    
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .offset(y: -7)

                    if self.date[i].replay{
                        
                        Button(action: {
                            
                            self.date[i].replay = false
                            self.date[i].player.seek(to: .zero)
                            self.date[i].player.play()
                            
                        })  {
                            
                            Image(systemName: "goforward")
                                .resizable()
                                .frame(width: 55,height: 60)
                                .foregroundColor(.white)
                            
                        }
                    }

                }

            }
            
        }
        .onAppear{
            
            
            self.date[0].player.play()
            
            self.date[0].player.actionAtItemEnd = .none
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.date[0].player.currentItem,  queue: .main ) { (_) in
                
                
                self.date[0].replay = true
            }
        }
        
    }
}

struct Player : UIViewControllerRepresentable {
    
    var player : AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
    
        let view = AVPlayerViewController()
        view.player = player
        view.showsPlaybackControls = false
        view.videoGravity = .resizeAspectFill
        return view
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController,  context: Context) {
        
    }
}

class Host : UIHostingController<SaudiBrands>{
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
}

struct Video : Identifiable {
    
    var id : Int
    var player : AVPlayer
    var replay : Bool
}




struct PlayerScrollView : UIViewRepresentable {
    
    
    func makeCoordinator() -> Coordinator {
        
        return PlayerScrollView.Coordinator(parent1: self)
        
    }
    
    
    @Binding var date : [Video]
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let view = UIScrollView()
        
        let childView = UIHostingController(rootView: PlayerView(date : self.$date))
        
        childView.view .frame = CGRect (x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat ((date.count)))
        

        view.contentSize = CGSize (width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat ((date.count)))

        
        view.addSubview(childView.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        view.delegate = context.coordinator
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        uiView.contentSize = CGSize (width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat ((date.count)))
        for i in 0..<uiView.subviews.count{
            
            uiView.subviews[i].frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat ((date.count)))
        }
        
    }
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        var parent : PlayerScrollView
        var index = 0
        
        init(parent1: PlayerScrollView) {
           parent = parent1
            
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            let currenindex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
            
            if index != currenindex{
                
                index = currenindex
                
                for i in 0..<parent.date.count{
                    
                    parent.date[i].player.seek(to: .zero)
                    parent.date[i].player.pause()
                }

                parent.date[index].player.play()
                
                parent.date[index].player.actionAtItemEnd = .none
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: parent.date[index].player.currentItem,  queue: .main ) { (_) in
                    
                    
                    self.parent.date[self.index].replay = true
                }
            }
        }
    }
    
}


        struct SaudiBrands_Previews: PreviewProvider {
            static var previews: some View {
                SaudiBrands()
            }
        }
