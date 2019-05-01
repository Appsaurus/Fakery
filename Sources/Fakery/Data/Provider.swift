import Foundation

public final class Provider {
  var translations: [String: Data] = [:]

  // MARK: - Locale data

  public func dataForLocale(_ locale: String) -> Data? {
    var translation: Data?

    if let translationData = translations[locale] {
      translation = translationData
    } else {
<<<<<<< HEAD
			if let data = Locale.en.data(using: .utf8) {
=======
		
			if let data = Locale.en.data(using: .utf8){
>>>>>>> 06102224553a2652fbb22cf4a04adebb8fb694ab
				translation = data
				translations[locale] = data
			}
    }

    return translation
  }
}
