//
//  Localization.swift
//  Siren
//
//  Created by Arthur Sabintsev on 9/25/18.
//  Copyright © 2018 Sabintsev iOS Projects. All rights reserved.
//

import Foundation

/// Localization information and strings for Siren.
public struct Localization {
    /// Determines the available languages in which the update message and alert button titles should appear.
    ///
    /// By default, the operating system's default lanuage setting is used. However, you can force a specific language
    /// by setting the forceLanguageLocalization property before calling checkVersion()
    public enum Language: String {
        case arabic = "ar"
        case armenian = "hy"
        case basque = "eu"
        case chineseSimplified = "zh-Hans"
        case chineseTraditional = "zh-Hant"
        case croatian = "hr"
        case czech = "cs"
        case danish = "da"
        case dutch = "nl"
        case english = "en"
        case estonian = "et"
        case finnish = "fi"
        case french = "fr"
        case german = "de"
        case greek = "el"
        case hebrew = "he"
        case hungarian = "hu"
        case indonesian = "id"
        case italian = "it"
        case japanese = "ja"
        case korean = "ko"
        case latvian = "lv"
        case lithuanian = "lt"
        case malay = "ms"
        case norwegian = "nb-NO"
        case persian = "fa"
        case persianAfghanistan = "fa-AF"
        case persianIran = "fa-IR"
        case polish = "pl"
        case portugueseBrazil = "pt"
        case portuguesePortugal = "pt-PT"
        case russian = "ru"
        case serbianCyrillic = "sr-Cyrl"
        case serbianLatin = "sr-Latn"
        case slovenian = "sl"
        case spanish = "es"
        case swedish = "sv"
        case thai = "th"
        case turkish = "tr"
        case urdu = "ur"
        case ukrainian = "uk"
        case vietnamese = "vi"
    }

    /// The name of the app as defined by the `Info.plist`.
    private var appName: String = Bundle.bestMatchingAppName()

    /// Overrides the default localization of a user's device when presenting the update message and button titles in the alert.
    ///
    /// See the Siren.Localization.Language enum for more details.
    private let forceLanguage: Language?

    /// Initializes
    ///
    /// - Parameters:
    ///   - appName: Overrides the default name of the app. This is optional and defaults to the app that is defined in the `Info.plist`.
    ///   - forceLanguage: The language the alert to which the alert should be set. If `nil`, it falls back to the device's preferred locale.
    init(appName: String?, andForceLanguageLocalization forceLanguage: Language?) {
        if let appName = appName {
            self.appName = appName
        }

        self.forceLanguage = forceLanguage
    }

    /// The localized string for the `UIAlertController`'s message field.  .
    ///
    /// - Returns: A localized string for the update message.
    public func alertMessage(forCurrentAppStoreVersion currentAppStoreVersion: String) -> String {
        let message = Bundle.localizedString(forKey: AlertConstants.alertMessage.string,
                                             andForceLocalization: forceLanguage)

        return String(format: message, appName, currentAppStoreVersion)
    }

    /// The localized string for the `UIAlertController`'s title field.  .
    ///
    /// - Returns: A localized string for the phrase "Update Available".
    public func alertTitle() -> String {
        return Bundle.localizedString(forKey: AlertConstants.alertTitle.string,
                                      andForceLocalization: forceLanguage)
    }

    /// The localized string for the "Next time" `UIAlertAction`.
    ///
    /// - Returns: A localized string for the phrase "Next time".
    public func nextTimeButtonTitle() -> String {
        return Bundle.localizedString(forKey: AlertConstants.nextTimeButtonTitle.string,
                                      andForceLocalization: forceLanguage)
    }

    /// The localized string for the "Skip this version" `UIAlertAction`.
    ///
    /// - Returns: A localized string for the phrase "Skip this version".
    public func skipButtonTitle() -> String {
        return Bundle.localizedString(forKey: AlertConstants.skipButtonTitle.string,
                                      andForceLocalization: forceLanguage)
    }

    /// The localized string for the "Update now" `UIAlertAction`.
    ///
    /// - Returns: A localized string for the phrase "Update now".
    public func updateButtonTitle() -> String {
        return Bundle.localizedString(forKey: AlertConstants.updateButtonTitle.string,
                                      andForceLocalization: forceLanguage)
    }
}
