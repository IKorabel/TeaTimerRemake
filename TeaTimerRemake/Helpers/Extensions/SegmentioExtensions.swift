//
//  SegmentioExtensions.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 14.07.2022.
//

import Foundation
import Segmentio

extension SegmentioOptions {
    
    static var TTStyleSegmentioOptions: SegmentioOptions {
        
        let segmentioStates = SegmentioStates(
            defaultState: SegmentioState(
                backgroundColor: .clear,
                titleFont: UIFont.boldSystemFont(ofSize: 13),
                titleTextColor: .grayChateau
            ),
            selectedState: SegmentioState(
                backgroundColor: .clear,
                titleFont: UIFont.boldSystemFont(ofSize: 13),
                titleTextColor: .black
            ),
            highlightedState: SegmentioState(
                backgroundColor: UIColor.whiteSmoke,
                titleFont: UIFont.boldSystemFont(ofSize: 13),
                titleTextColor: .grayChateau
            )
            
)
        let horizontalSeparator = SegmentioHorizontalSeparatorOptions(
            type: .topAndBottom, height: 1, color: .whiteSmoke)
        
        let verticalSeparator = SegmentioVerticalSeparatorOptions(ratio: 1, color: .whiteSmoke)
        
        let indicatorOptions = SegmentioIndicatorOptions.init(type: .bottom, ratio: 1, height: 10, color: .teaTimerGreen)
        let options = SegmentioOptions(backgroundColor: .white,
                                       segmentPosition: .dynamic,
                                       scrollEnabled: true,
                                       indicatorOptions: indicatorOptions,
                                       horizontalSeparatorOptions: horizontalSeparator,
                                       verticalSeparatorOptions: verticalSeparator,
                                       imageContentMode: .scaleAspectFit,
                                       labelTextAlignment: .center,
                                       labelTextNumberOfLines: 0, segmentStates: segmentioStates)
        return options
    }
}
