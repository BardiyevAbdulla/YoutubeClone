//
//  File.swift
//  YoutebeClone
//
//  Created by admin on 11/18/22.
//

import UIKit

class TrendingCell:FeedCell{
    override func fetchVideos() {
        APICaller.shared.fetchTrending { videos in
            self.list = videos
        }
       
    }
}
