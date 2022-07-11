import Foundation
import Security

final class KeychainHelper {
  static let standard = KeychainHelper()

  private init() {}

  func save(_ data: Data, service: String, account: String) {
    let query: [String: Any] =
      [
        kSecValueData as String: data,
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrService as String: service,
        kSecAttrAccount as String: account,
      ]

    let status = SecItemAdd(query as CFDictionary, nil)

    if status == errSecDuplicateItem {
      let query: [String: Any] = [
        kSecAttrService as String: service,
        kSecAttrAccount as String: account,
        kSecClass as String: kSecClassGenericPassword,
      ]

      let attributesToUpdate: [String: Any] = [kSecValueData as String: data]

      SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
    } else if status != errSecSuccess {
      print("Error: \(status)")
    }
  }

  func save<T>(_ item: T, service: String, account: String) where T: Codable {
    do {
      let data = try JSONEncoder().encode(item)
      save(data, service: service, account: account)
    } catch {
      assertionFailure("Failed to encode item for keychain.")
    }
  }

  func read(service: String, account: String) -> Data? {
    let query: [String: Any] = [
      kSecAttrService as String: service,
      kSecAttrAccount as String: account,
      kSecClass as String: kSecClassGenericPassword,
      kSecReturnData as String: true,
    ]

    var result: AnyObject?
    SecItemCopyMatching(query as CFDictionary, &result)

    return (result as? Data)
  }

  func read<T>(service: String, account: String) -> T? where T: Codable {
    guard let data = read(service: service, account: account) else {
      return nil
    }

    do {
      let item: T = try JSONDecoder().decode(T.self, from: data)
      return item
    } catch {
      assertionFailure("Failed to decode item for keychain: \(error)")
      return nil
    }
  }

  func delete(service: String, account: String) {
    let query: [String: Any] = [
      kSecAttrService as String: service,
      kSecAttrAccount as String: account,
      kSecClass as String: kSecClassGenericPassword,
    ]

    SecItemDelete(query as CFDictionary)
  }
}

let service = "gougou.cash"
let account = "test@example.com"

let accessToken =
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
let refreshToken =
  "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWUsImlhdCI6MTUxNjIzOTAyMn0.NHVaYe26MbtOYhSKkoKYdFVomg4i8ZJd8_-RU8VNbftc4TSMb4bXP3l3YlNWACwyXPGffz5aXHc6lty1Y2t4SWRqGteragsVdZufDn5BlnJl9pdR_kdVFUsra2rWKEofkZeIC4yWytE58sMIihvo9H1ScmmVwBcQP6XETqYd0aSHp1gOa9RdUPDvoXQ5oqygTqVtxaDr6wUFKrKItgBMzWIdNZ6y7O9E0DhEPTbE9rfBo6KTFsHAZnMg4k68CDp2woYIaXbmYTWcvbzIuHO7_37GT79XdIwkm95QJ7hYC9RiwrV7mesbY4PAahERJawntho0my942XheVLmGwLMBkQ"

/* let data = Data(token.utf8) */
/* KeychainHelper.standard.save(data, service: "gougou.cash", account: "test@example.com") */

struct Auth: Codable {
  let accessToken: String
  let refreshToken: String
}

extension Encodable {
  var prettyPrinted: String {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    if let data = try? encoder.encode(self) {
      return String(decoding: data, as: UTF8.self)
    }
    return ""
  }
}

let input = Auth(accessToken: accessToken, refreshToken: refreshToken)

KeychainHelper.standard.save(input, service: service, account: account)

if let output: Auth = KeychainHelper.standard.read(service: service, account: account) {
  print(output.prettyPrinted)
}
