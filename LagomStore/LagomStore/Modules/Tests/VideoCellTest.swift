//
//  VideoCellTest.swift
//  LagomStore
//
//  Created by Александр Милейчик on 12/24/24.
//

//import UIKit
////import AVFoundation
//import AVKit
//
//class VideoCell: UITableViewCell {
//
//    private var player: AVPlayer?
//    private var playerLayer: AVPlayerLayer?
//    private var gradientView: GradientView?
//    private var playerItem: AVPlayerItem?
//
//    // Инициализация и установка видео
//    func update(_ url: URL, addGradient: Bool) {
//        // Если плеера нет, создаем его
//        if player == nil {
//            playerItem = AVPlayerItem(url: url)
//            player = AVPlayer(playerItem: playerItem)
//            playerLayer = AVPlayerLayer(player: player)
//            guard let playerLayer = playerLayer else { return }
//            
//            // Устанавливаем слой плеера во view ячейки
//            playerLayer.frame = contentView.bounds
//            playerLayer.videoGravity = .resizeAspectFill
//            contentView.layer.addSublayer(playerLayer)
//            
//            // Добавляем наблюдателя за статусом
////            playerItem?.addObserver(self, forKeyPath: "status", options: [.new, .initial], context: nil)
//        }
//
//        // Добавляем градиент, если нужно
//        if addGradient, gradientView == nil {
//            let gradient = GradientView()
//            gradient.translatesAutoresizingMaskIntoConstraints = false
//            contentView.addSubview(gradient)
//            
//            NSLayoutConstraint.activate([
//                gradient.topAnchor.constraint(equalTo: contentView.topAnchor),
//                gradient.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//                gradient.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//                gradient.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
//            ])
//            
//            self.gradientView = gradient
//        }
//    }
//
//    // Управление проигрыванием видео
//    func playVideo() {
//        player?.play()
//    }
//    
//    func pauseVideo() {
//        player?.pause()
//    }
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        
//        // Останавливаем плеер и очищаем ресурсы
//        player?.pause()
//        playerLayer?.removeFromSuperlayer()
//        player = nil
//        playerLayer = nil
//        
//        // Убираем градиент
//        gradientView?.removeFromSuperview()
//        gradientView = nil
//        
//        // Убираем наблюдателя за статусом
////        playerItem?.removeObserver(self, forKeyPath: "status")
//    }
//    
////    // Метод для обработки изменения статуса
////    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
////        if keyPath == "status", let playerItem = object as? AVPlayerItem {
////            if playerItem.status == .readyToPlay {
////                // Обновление UI после готовности видео
////                DispatchQueue.main.async {
////                    self.playVideo()
////                }
////            } else if playerItem.status == .failed {
////                print("Ошибка загрузки видео.")
////            }
////        }
////    }
////
////    deinit {
////        // Убираем наблюдателя при деинициализации
////        playerItem?.removeObserver(self, forKeyPath: "status")
////    }
//}
//
//
