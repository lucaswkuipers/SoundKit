extension String {
    func replacing(_ target: String, with substitution: String) -> Self {
        return replacingOccurrences(of: target, with: substitution)
    }

    func removing(_ target: String) -> Self {
        return replacing(target, with: "")
    }

    func removing(_ words: [String]) -> Self {
        var result = self
        words.forEach { result = result.removing($0) }
        return result
    }
}
