//
//  SuperVipPromoModel.swift
//  BadgesTutorial
//
//  Created by Alexander Korchak on 15.11.2023.
//

import Foundation

enum VipPromoStatus {
    case standart, vip
    
    func getStatus() -> String {
        switch self {
        case .standart: "Подключить"
        case .vip: "Изменить сейчас"
        }
    }
}

struct SuperVipPromoModel {
    public var vipStatus: VipPromoStatus = .standart
    
    public let mainLabelText: String
    public let descriptionLabelText: String
    public let imageName: String
    public let cashbackLabelText: String
    public var connectButtonText: String
    public let bottomButtonText: String

    public init(
        mainLabelText: String,
        descriptionLabelText: String,
        imageName: String,
        cashbackLabelText: String,
        connectButtonText: String,
        bottomButtonText: String
    ) {
        self.mainLabelText = mainLabelText
        self.descriptionLabelText = descriptionLabelText
        self.imageName = imageName
        self.cashbackLabelText = cashbackLabelText
        self.connectButtonText = connectButtonText
        self.bottomButtonText = bottomButtonText
    }
    
    mutating func switchConnectionStatus() {
        switch vipStatus {
        case .standart:
            vipStatus = .vip
        case .vip:
            vipStatus = .standart
        }
        connectButtonText = vipStatus.getStatus()
    }
}
