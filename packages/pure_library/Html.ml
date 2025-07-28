let is_self_closing_tag = function
  | "area" | "base" | "basefont" | "bgsound" | "br" | "col" | "command" | "embed" | "frame" | "hr" | "image" | "img"
  | "input" | "keygen" | "link" | "meta" | "param" | "source" | "track" | "wbr" ->
      true
  | _ -> false

let render_self_closing_tag tag attributes =
  let rendered_attributes = List.map (fun (key, value) -> key ^ "=" ^ value) attributes in
  "<" ^ tag ^ " " ^ String.concat " " rendered_attributes ^ " />"
