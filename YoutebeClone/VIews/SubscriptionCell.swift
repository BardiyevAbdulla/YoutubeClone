//
//  Subscription.swift
//  YoutebeClone
//
//  Created by admin on 11/18/22.
//

import Foundation
class SubscriptionCell:FeedCell{
    override func fetchVideos() {
        APICaller.shared.fetchSubspriction { videos in
            self.list = videos
        }
       
    }
}
