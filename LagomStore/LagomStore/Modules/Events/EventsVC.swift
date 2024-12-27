//
//  EventsVC.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/27/24.
//

import UIKit
import AVKit


class EventsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    private let tableView = UITableView()
    private let videoCellIdentifier = "VideoCell"
    private let videoURL = Bundle.main.url(forResource: "12335026-uhd_2560_1440_48fps", withExtension: "mp4")!
    private var isNavBarHidden = true // Переменная для отслеживания состояния Navigation Bar

    private var videoPlayer: AVPlayer!
    private var playerLayer: AVPlayerLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoPlayer()
        setupTableView()
        setupNavigationBar()
    }

    private func setupVideoPlayer() {
        // Инициализация AVPlayer
        videoPlayer = AVPlayer(url: videoURL)
        playerLayer = AVPlayerLayer(player: videoPlayer)
        playerLayer.videoGravity = .resizeAspectFill // Заполнение экрана без искажений
        playerLayer.frame = view.bounds // Установка размера на весь экран
        view.layer.insertSublayer(playerLayer, at: 0) // Вставляем видео как фоновый слой

        // Запуск видео
        videoPlayer.play()
        videoPlayer.actionAtItemEnd = .none

        // Повторное воспроизведение видео
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: videoPlayer.currentItem)
    }

    @objc private func videoDidFinishPlaying(notification: Notification) {
        videoPlayer.seek(to: .zero) // Перемотка в начало
        videoPlayer.play() // Запуск воспроизведения
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(VideoCell.self, forCellReuseIdentifier: videoCellIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)

        tableView.contentInsetAdjustmentBehavior = .never
  
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupNavigationBar() {
        navigationItem.title = "Event"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false) // Скрываем Navigation Bar изначально
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: videoCellIdentifier, for: indexPath) as! VideoCell
            cell.update(videoURL, addGradient: false)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "Row \(indexPath.row)"
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? view.bounds.height * 0.75 : 60 // Высота ячейки видео 75% от высоты экрана
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? VideoCell {
            cell.pauseVideo() // При уходе из ViewController останавливаем видео
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? VideoCell {
            cell.playVideo() // При появлении ViewController запускаем видео
        }
    }
    
    // Метод для обработки прокрутки таблицы
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let threshold = UIScreen.main.bounds.height * 0.55 // Порог в 30% от высоты экрана

        if offset >= threshold && isNavBarHidden {
            isNavBarHidden = false
            navigationController?.setNavigationBarHidden(false, animated: false) // Показываем Navigation Bar с анимацией
        } else if offset < threshold && !isNavBarHidden {
            isNavBarHidden = true
            navigationController?.setNavigationBarHidden(true, animated: false) // Скрываем Navigation Bar с анимацией
        }
    }
}


//    
//    // Метод для обработки прокрутки таблицы
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offset = scrollView.contentOffset.y
//        let threshold = 290.0 // Порог срабатывания, чтобы показать Navigation Bar
//
//        if offset >= threshold && isNavBarHidden {
//            isNavBarHidden = false
//            navigationController?.setNavigationBarHidden(false, animated: true)
//        } else if offset < threshold && !isNavBarHidden {
//            isNavBarHidden = true
//            navigationController?.setNavigationBarHidden(true, animated: true)
//        }
//    }
//}
