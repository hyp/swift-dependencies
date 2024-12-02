@usableFromInline
func typeName(_ type: Any.Type) -> String {
  var name = _typeName(type, qualified: true)
  if let index = name.firstIndex(of: ".") {
    name.removeSubrange(...index)
  }
  // NSRegularExpression isn't available on Android.
#if !os(Android)
  let sanitizedName =
    name
    .replacingOccurrences(
      of: #"\(unknown context at \$[[:xdigit:]]+\)\."#,
      with: "",
      options: .regularExpression
    )
  return sanitizedName
#else
  return name
#endif
}
