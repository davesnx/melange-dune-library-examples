let scream str =
  let uppercased = str |> URL.makeExn |> URL.toString |> String.uppercase_ascii in
  uppercased ^ "!!!"
