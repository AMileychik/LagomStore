//
//  VideoCell.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/8/24.
//

import UIKit
import AVKit

class VideoCell: UITableViewCell {
    
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    private var playerItem: AVPlayerItem?
    
    private var gradientView: GradientView?
    
    // Инициализация и установка видео
    func update(_ url: URL, addGradient: Bool, isMuted: Bool) {
        // Если плеера нет, создаем его
        if player == nil {
            playerItem = AVPlayerItem(url: url)
            player = AVPlayer(playerItem: playerItem)
            playerLayer = AVPlayerLayer(player: player)
            guard let playerLayer = playerLayer else { return }
            
            // Устанавливаем слой плеера во view ячейки
            playerLayer.frame = contentView.bounds
            playerLayer.videoGravity = .resizeAspectFill
            contentView.layer.addSublayer(playerLayer)
        }
        player?.isMuted = isMuted
        
        // Добавляем градиент, если нужно
        if addGradient, gradientView == nil {
            let gradient = GradientView()
            gradient.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(gradient)
            
            NSLayoutConstraint.activate([
                gradient.topAnchor.constraint(equalTo: contentView.topAnchor),
                gradient.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                gradient.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                gradient.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
            
            self.gradientView = gradient
        }
    }
    
    // Управление проигрыванием видео
    func playVideo() {
        player?.play()
    }
    
    func pauseVideo() {
        player?.pause()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // Останавливаем плеер и очищаем ресурсы
        player?.pause()
        playerLayer?.removeFromSuperlayer()
        player = nil
        playerLayer = nil
        
        // Убираем градиент
        gradientView?.removeFromSuperview()
        gradientView = nil
    }
}











