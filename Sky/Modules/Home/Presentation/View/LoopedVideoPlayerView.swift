//
//  LoopedVideoPlayerView.swift
//  Sky
//
//  Created by siam on 05/06/2026.
//

import AVFoundation
import UIKit
import SwiftUI


struct LoopedVideoPlayerView: UIViewRepresentable {
    let videoName: String

    func makeUIView(context: Context) -> PlayerUIView {
        PlayerUIView(videoName: videoName)
    }

    func updateUIView(_ uiView: PlayerUIView, context: Context) {
        uiView.setupIfNeeded(videoName: videoName)
    }
}

class PlayerUIView: UIView {
    private var player: AVPlayer?
    private var currentVideoName: String?
    private var isReversed = false
    private var statusObserver: NSKeyValueObservation?
    private var displayLink: CADisplayLink?
    private var duration: CMTime = .zero

    override class var layerClass: AnyClass { AVPlayerLayer.self }
    private var playerLayer: AVPlayerLayer { layer as! AVPlayerLayer }

    init(videoName: String) {
        super.init(frame: .zero)
        setupIfNeeded(videoName: videoName)
    }

    required init?(coder: NSCoder) { fatalError() }

    func setupIfNeeded(videoName: String) {
        guard currentVideoName != videoName else { return }
        currentVideoName = videoName
        cleanUp()
        buildPlayer(videoName: videoName)
    }


    private func buildPlayer(videoName: String) {
        guard let url = Bundle.main.url(
            forResource: videoName, withExtension: "mp4"
        ) else { return }

        let asset = AVURLAsset(url: url)
        asset.loadTracks(withMediaType: .video) { [weak self] tracks, _ in
            guard let self, let srcTrack = tracks?.first else { return }

      
            let comp = AVMutableComposition()
            guard let dst = comp.addMutableTrack(
                withMediaType: .video,
                preferredTrackID: kCMPersistentTrackID_Invalid
            ) else { return }

            let range = srcTrack.timeRange
            try? dst.insertTimeRange(range, of: srcTrack, at: .zero)

            DispatchQueue.main.async {
                self.duration = range.duration
                self.startPlayer(composition: comp)
            }
        }
    }

    private func startPlayer(composition: AVMutableComposition) {
        let item   = AVPlayerItem(asset: composition)
        let player = AVPlayer(playerItem: item)
        player.isMuted  = true
        player.volume   = 0
        player.automaticallyWaitsToMinimizeStalling = false
        self.player = player

        playerLayer.player       = player
        playerLayer.videoGravity = .resizeAspectFill

        statusObserver = player.observe(\.status, options: [.initial, .new]) {
            [weak self] p, _ in
            guard p.status == .readyToPlay else { return }
            self?.statusObserver?.invalidate()
            self?.statusObserver = nil
            DispatchQueue.main.async { self?.startPingPong() }
        }
    }



    private func startPingPong() {
        guard let player else { return }
        isReversed = false
        player.rate = 1.0      
        startDisplayLink()
    }

    private func startDisplayLink() {
        displayLink?.invalidate()
        let dl = CADisplayLink(target: self, selector: #selector(tick))
        dl.preferredFrameRateRange = .init(minimum: 60, maximum: 120, preferred: 120)
        dl.add(to: .main, forMode: .common)
        displayLink = dl
    }

    @objc private func tick() {
        guard let player else { return }
        let current = player.currentTime()

        if !isReversed {
       
            if CMTimeCompare(current, duration) >= 0 {
                reverse()
            }
        } else {
   
            if current.seconds <= 0.0 {
                forward()
            }
        }
    }

    private func reverse() {
        guard let player else { return }
        isReversed = true


        player.seek(
            to: duration,
            toleranceBefore: .zero,
            toleranceAfter: .zero
        ) { [weak player] _ in
            player?.rate = -1.0
        }
    }

    private func forward() {
        guard let player else { return }
        isReversed = false

        player.seek(
            to: .zero,
            toleranceBefore: .zero,
            toleranceAfter: .zero
        ) { [weak player] _ in
            player?.rate = 1.0
        }
    }



    private func cleanUp() {
        displayLink?.invalidate()
        displayLink = nil
        statusObserver?.invalidate()
        statusObserver = nil
        player?.pause()
        playerLayer.player = nil
        player = nil
        duration = .zero
        isReversed = false
    }

    deinit { cleanUp() }
}
