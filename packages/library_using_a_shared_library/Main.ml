let scream str =
  let uppercased = str |> URL.make |> Option.get |> URL.host |> Option.get |> String.uppercase_ascii in
  uppercased ^ "!!!"
