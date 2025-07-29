//
//  TimerView.swift
//  KiddyTask
//
//  Created by Camila Parolin on 29/07/25.
//

import Foundation

func timeString(from seconds: Int) -> String {
    let minutes = seconds / 60
    let seconds = seconds % 60
    return String(format: "%02d:%02d", minutes, seconds)
}
