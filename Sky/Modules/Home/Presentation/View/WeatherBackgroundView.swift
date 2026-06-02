//
//  WeatherBackgroundView.swift
//  Sky
//
//  Created by siam on 30/05/2026.
//

import SwiftUI
import AVFoundation

struct WeatherBackgroundView: View {
    let animation: WeatherAnimationType
    
    var body: some View {
        ZStack {
           
            LinearGradient(
                colors: animation.backgroundColors,
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            

            if let assetName = animation.videoAssetName {
                LoopedVideoPlayerView(videoName: assetName)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .allowsHitTesting(false)
                    .ignoresSafeArea()
            }
        }
    }
}


extension WeatherAnimationType {
    var videoAssetName: String? {
        switch self {
        case .sunny: return "Sunny"
        case .clearNight: return "Clear Night"
        case .partlyCloudy: return "Partly Cloudy"
        case .cloudy: return "Cloudy"
        case .lightRain, .rain, .heavyRain: return "Rain"
        case .thunderstorm: return "Thunderstorm"
        case .snow, .blizzard, .hail: return "Snow"
        case .fog: return "Cloudy"
        }
    }
}

struct LoopedVideoPlayerView: UIViewRepresentable {
    let videoName: String

    func makeUIView(context: Context) -> PlayerUIView {
        let view = PlayerUIView(frame: .zero)
        view.setupPlayer(with: videoName)
        return view
    }

    func updateUIView(_ uiView: PlayerUIView, context: Context) {
        uiView.setupPlayer(with: videoName)
    }
}


class PlayerUIView: UIView {
    private var player: AVPlayer?
    private var currentVideoName: String?
    private var observer: NSObjectProtocol?
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }

    private var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }

    func setupPlayer(with videoName: String) {
        guard currentVideoName != videoName else { return }
        currentVideoName = videoName

        cleanUp()

        guard let fileURL = Bundle.main.url(forResource: videoName, withExtension: "mp4") else {
            print("Failed to find video in bundle resources: \(videoName).mp4")
            return
        }

        let asset = AVAsset(url: fileURL)
        let composition = AVMutableComposition()
        
        if let compositionVideoTrack = composition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid),
           let sourceVideoTrack = asset.tracks(withMediaType: .video).first {
            do {
                try compositionVideoTrack.insertTimeRange(CMTimeRangeMake(start: .zero, duration: asset.duration), of: sourceVideoTrack, at: .zero)
            } catch {
                print("Failed to insert video track: \(error)")
            }
        }

        let playerItem = AVPlayerItem(asset: composition)
        let avPlayer = AVPlayer(playerItem: playerItem)
        
        avPlayer.isMuted = true
        avPlayer.volume = 0
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        avPlayer.actionAtItemEnd = .none 

        playerLayer.player = avPlayer
        playerLayer.videoGravity = .resizeAspectFill
        
        self.player = avPlayer

        observer = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: avPlayer.currentItem,
            queue: .main
        ) { [weak avPlayer] _ in
            avPlayer?.seek(to: .zero)
            avPlayer?.play()
        }

        avPlayer.play()
    }

    private func cleanUp() {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
            self.observer = nil
        }
        player?.pause()
        playerLayer.player = nil
        player = nil
    }

    deinit {
        cleanUp()
    }
}
