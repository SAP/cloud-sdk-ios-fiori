//
//  TimelineCard.swift
//
//
//  Created by Ma, Xiao on 1/23/20.
//
import Combine

open class TimelineCard: OneManyCard<TimelineItem> {}

extension TimelineCard: Hashable {
    public static func == (lhs: TimelineCard, rhs: TimelineCard) -> Bool {
        lhs.header == rhs.header &&
            lhs.content == rhs.content
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(header)
        hasher.combine(content)
    }
}
