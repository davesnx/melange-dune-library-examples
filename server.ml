let () =
  let url = "https://sancho.dev" in
  Printf.printf "input is self closing? %b\n" (Pure_library.Html.is_self_closing_tag "input");
  Printf.printf "%s\n" (URL.toString (URL.makeExn url));
  Printf.printf "%s\n" (Library_using_a_shared_library.Main.scream url);
  let promise = Promise.resolved 23 in
  let result = Promise.map promise (fun x -> x + 1) in
  Promise.get result (fun r -> Printf.printf "done: %d\n" r);

  (* Process pending callbacks since native doesn't have event loop *)
  while Promise.ReadyCallbacks.callbacksPending () do
    let snapshot = Promise.ReadyCallbacks.snapshot () in
    Promise.ReadyCallbacks.call snapshot
  done
