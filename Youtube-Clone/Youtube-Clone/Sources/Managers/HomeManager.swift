//
//  HomeManager.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/28.
//

import UIKit

struct HomeManager {
    static let shared = HomeManager()
    
    private init() { }
    
    var thumbnails: [Thumbnail] = [
        Thumbnail(image: YoutubeIcon.wesoptiOSPart, title: "1차 iOS 세미나 : 아요 킹 장혜령과 함께하는 애플 개발자 뛰어넘는 법", author: "WE iOS", views: "100억회", createdDate: "1년 전"),
        Thumbnail(image: YoutubeIcon.wesoptAndroidpart, title: "3차 Android 세미나 : 코틀린 문법 지키고 문다빈과 광야 가는 법", author: "WE Android", views: "200만회", createdDate: "5개월 전"),
        Thumbnail(image: YoutubeIcon.wesoptPlanPart, title: "2차 기획파트 세미나 : 현아앤 이던과 함께 하는 카핀 핑퐁", author: "WE Plan", views: "300만회", createdDate: "2주 전"),
        Thumbnail(image: YoutubeIcon.wesoptWebPart, title: "1차 Web 세미나 : 의진님의 미라클 웹", author: "WE Web", views: "100만회", createdDate: "1개월 전"),
        Thumbnail(image: YoutubeIcon.wesoptDesignPart, title: "3차 디자인파트 세미나 : 성현님과 함께 하는 피그마 뽀개서 입에 쑤셔넣기", author: "We Design", views: "320만회", createdDate: "3개월 전"),
        Thumbnail(image: YoutubeIcon.wesoptServerPart, title: "2차 Server 세미나 : 우영님과 함께 하는 클라이언트에게 잘보이는 법", author: "We Server", views: "50억회", createdDate: "3시간 전")
    ]
    
    var channels: [Channel] = [
        Channel(image: YoutubeIcon.ggamju1, title: "We iOS"),
        Channel(image: YoutubeIcon.ggamju2, title: "We Android"),
        Channel(image: YoutubeIcon.ggamju3, title: "We Plan"),
        Channel(image: YoutubeIcon.ggamju4, title: "We Web"),
        Channel(image: YoutubeIcon.ggamju5, title: "We Design"),
        Channel(image: YoutubeIcon.ggamju6, title: "We Server"),
        Channel(image: YoutubeIcon.ggamju7, title: "We Catch"),
        Channel(image: YoutubeIcon.ggamju8, title: "Catch Me")
    ]
}

// MARK: - Thumbnail Manager
extension HomeManager {
    func getThumbnailCount() -> Int {
        return thumbnails.count
    }
    
    func getThumbnailImage(index: Int) -> UIImage {
        return thumbnails[index].image
    }
    
    func getTitle(index: Int) -> String {
        return thumbnails[index].title
    }
    
    func getAuthor(index: Int) -> String {
        return thumbnails[index].author
    }
    
    func getViews(index: Int) -> String {
        return thumbnails[index].views
    }
    
    func getCreatedDate(index: Int) -> String {
        return thumbnails[index].createdDate
    }
}

// MARK: - Channel Manager
extension HomeManager {
    func getChannelCount() -> Int {
        return channels.count
    }
    
    func getChannelImage(index: Int) -> UIImage {
        return channels[index].image
    }
    
    func getChannelTitle(index: Int) -> String {
        return channels[index].title
    }
}
