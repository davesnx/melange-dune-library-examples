let () =
  let url = "https://sancho.dev" in
  Printf.printf "input is self closing? %b\n" (Pure_library.Html.is_self_closing_tag "input");
  Printf.printf "%s\n" (URL.toString (URL.makeExn url));
  Printf.printf "%s\n" (Library_using_a_shared_library.Main.scream url);
  let promise = Promise.resolved 23 in
  let result = Promise.map promise (fun x -> x + 1) in
  Promise.get result (fun _ -> Printf.printf "done\n")
