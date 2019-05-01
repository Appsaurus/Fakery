import Foundation

public final class Internet: Generator {
  private let lorem: Lorem

  public required init(parser: Parser) {
    self.lorem = Lorem(parser: parser)
    super.init(parser: parser)
  }

  public func username(separator: String? = nil) -> String {
    var components: [String] = [
      generate("name.first_name"),
      generate("name.last_name"),
      "\(Random.int(max: 10000))"
    ]

    let randomCount = components.count - 1
    let count = Int(Random.int(max: randomCount) + randomCount)

    var gap = ""
    if let sep = separator {
      gap = sep
    }

    return components[0..<count].joined(separator: gap)
      .replacingOccurrences(of: "'", with: "")
      .lowercased()
  }

  public func domainName(_ alphaNumericOnly: Bool = true) -> String {
    return domainWord(alphaNumericOnly: alphaNumericOnly) + "." + domainSuffix()
  }

  public func domainWord(alphaNumericOnly: Bool = true) -> String {
    let nameParts = generate("company.name").components(separatedBy: " ")
    var name = ""

    if let first = nameParts.first {
      name = first
    } else {
      name = letterify("?????")
    }

    let result = alphaNumericOnly ? alphaNumerify(name) : name

    return result.lowercased()
  }

  public func domainSuffix() -> String {
    return generate("internet.domain_suffix")
  }

  public func email() -> String {
    return [username(), domainName()].joined(separator: "@")
  }

  public func freeEmail() -> String {
    return [username(), generate("internet.free_email")].joined(separator: "@")
  }

  public func safeEmail() -> String {
    let topLevelDomains = ["org", "com", "net"]
    let count = topLevelDomains.count
    let topLevelDomain = topLevelDomains[Int(Random.int(max: count))]

    return [username(), "example." + topLevelDomain].joined(separator: "@")
  }

  public func password(minimumLength: Int = 8, maximumLength: Int = 16) -> String {
    var temp = lorem.characters(amount: minimumLength)
    let diffLength = maximumLength - minimumLength

    if diffLength > 0 {
      let diffRandom = Int(Random.int(max: diffLength + 1))
      temp += lorem.characters(amount: diffRandom)
    }

    return temp
  }

  public func ipV4Address() -> String {
    let ipRand = {
      2 + Random.int() % 253
    }

    return String(format: "%d.%d.%d.%d", ipRand(), ipRand(), ipRand(), ipRand())
  }

  public func ipV6Address() -> String {
    var components: [String] = []

<<<<<<< HEAD
    for _ in 0..<8 {
      components.append(String(format: "%X", arc4random() % 65536))
=======
    for _ in 1..<8 {
      components.append(String(format: "%X", Random.int() % 65535))
>>>>>>> 06102224553a2652fbb22cf4a04adebb8fb694ab
    }

    return components.joined(separator: ":")
  }

  public func url() -> String {
    return "https://\(domainName())/\(username())"
  }

  public func image(width: Int = 320, height: Int = 200) -> String {
    return "https://lorempixel.com/\(width)/\(height)"
  }

  public func templateImage(width: Int = 320, height: Int = 200,
                            backColorHex: String = "000000", frontColorHex: String = "ffffff") -> String {
      return "https://dummyimage.com/\(width)x\(height)/\(backColorHex)/\(frontColorHex)"
  }

  public func hashtag() -> String {
    return generate("internet.hashtag")
  }

}
