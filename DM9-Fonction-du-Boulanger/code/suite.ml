let f x =
  if x >= 0.0 && x <= 0.5 then 2.0 *. x
  else if x <= 1.0 then 2.0 *. (1.0 -. x)
  else failwith "x doit être dans l'intervalle [0, 1]"

let rec suite x p =
  if p > 0 then begin
    let x' = f x in
    Printf.printf "%.5f\n" x';
    suite x' (p - 1)
  end

let () =
  suite (2. /. 5.) 25
