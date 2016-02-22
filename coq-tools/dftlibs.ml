let to_name = String.concat "_"
let to_dir  = String.concat "/"
let prefix  = "coq-fs"

(* Default FS list *)
let plugin_list =
  [ ["Coq"; "syntax"]
  ; ["Coq"; "decl_mode"]
  ; ["Coq"; "cc"]
  ; ["Coq"; "firstorder"]
  ; ["Coq"; "setoid_ring"]
  ; ["Coq"; "extraction"]
  ; ["Coq"; "funind"]
  ; ["Coq"; "quote"]

  ; ["Coq"; "fourier"]
  ; ["Coq"; "omega"]
  ; ["Coq"; "micromega"]
  ; ["Coq"; "romega"]
  ]

let coq_theory_list =
  [ ["Coq"; "Init"]
  ; ["Coq"; "Unicode"]
  ; ["Coq"; "Bool"]
  ; ["Coq"; "Logic"]
  ; ["Coq"; "Program"]
  ; ["Coq"; "Classes"]
  ; ["Coq"; "Structures"]
  ; ["Coq"; "Relations"]
  ; ["Coq"; "Setoids"]
  ; ["Coq"; "Arith"]
  ; ["Coq"; "PArith"]
  ; ["Coq"; "NArith"]
  ; ["Coq"; "ZArith"]
  ; ["Coq"; "QArith"]
  ; ["Coq"; "Lists"]
  ; ["Coq"; "Vectors"]
  ; ["Coq"; "Reals"]
  ; ["Coq"; "Sets"]
  ; ["Coq"; "FSets"]
  ; ["Coq"; "MSets"]
  ; ["Coq"; "Sorting"]
  ; ["Coq"; "Wellfounded"]
  ; ["Coq"; "Strings"]

  ; ["Coq"; "Numbers"]
  ; ["Coq"; "Numbers"; "NatInt"]
  ; ["Coq"; "Numbers"; "Natural"; "Abstract"]
  ; ["Coq"; "Numbers"; "Integer"; "Abstract"]
  ]

(* Packages: name, deps, modules *)

let pkgs : (string * string list * string list list) list=
  [ "init", [],
    [ ["Coq"; "syntax"]
    ; ["Coq"; "decl_mode"]
    ; ["Coq"; "cc"]
    ; ["Coq"; "firstorder"]
    ; ["Coq"; "extraction"]
    ; ["Coq"; "funind"]
    ; ["Coq"; "quote"]
    ; ["Coq"; "Init"]
    ; ["Coq"; "Bool"]
    ; ["Coq"; "Unicode"]
    ; ["mathcomp"; "ssreflect"]
    ]
  ; "math-comp", [],
    [ ["mathcomp"; "algebra"]
    ; ["mathcomp"; "fingroup"]
    ; ["mathcomp"; "solvable"]
    ; ["mathcomp"; "field"]
    ]
  ; "coq-base", [],
    [ ["Coq"; "Logic"]
    ; ["Coq"; "Program"]
    ; ["Coq"; "Classes"]
    ; ["Coq"; "Structures"]
    ; ["Coq"; "Relations"]
    ; ["Coq"; "Setoids"]
    ; ["Coq"; "Lists"]
    ; ["Coq"; "Vectors"]
    ; ["Coq"; "Sets"]
    ; ["Coq"; "Sorting"]
    ; ["Coq"; "FSets"]
    ; ["Coq"; "MSets"]
    ; ["Coq"; "Wellfounded"]
    ; ["Coq"; "Strings"]
    ]
  ; "coq-arith", ["coq-base"],
    [ ["Coq"; "setoid_ring"]
    ; ["Coq"; "Arith"]
    ; ["Coq"; "NArith"]
    ; ["Coq"; "PArith"]
    ; ["Coq"; "ZArith"]
    ; ["Coq"; "QArith"]
    ; ["Coq"; "Numbers"]
    ; ["Coq"; "Numbers"; "NatInt"]
    ; ["Coq"; "Numbers"; "Natural"; "Abstract"]
    ; ["Coq"; "Numbers"; "Integer"; "Abstract"]
    ]
  ; "coq-reals", ["coq-arith"],
    [ ["Coq"; "fourier"]
    ; ["Coq"; "omega"]
    ; ["Coq"; "micromega"]
    ; ["Coq"; "Reals"] ]
  ; "coquelicot", ["coq-reals"],
    [ [ "Coquelicot" ] ]
  ; "flocq", ["coq-reals"],
    [ ["Coq"; "romega"]
    ; [ "Flocq" ; "Core" ] ]
  ; "tlc", ["coq-reals"],
    [ ["TLC"] ]
  ; "sf", ["coq-reals"],
    [ ["SF"] ]
  ; "cpdt", ["coq-reals"],
    [ ["Cpdt"] ]

  (* ; "hott", [], *)
  (*   [ ["HoTT"] *)
  (*   ; ["HoTT" ; "Basics"] *)
  (*   ; ["HoTT" ; "Types"] ] *)

  ; "color", [ "coq-reals"],
    [ ["CoLoR" ; "Filter"]
    ; ["CoLoR" ; "RPO"]
    ; ["CoLoR" ; "Coccinelle"]
    ; ["CoLoR" ; "Coccinelle" ; "list_extensions"]
    ; ["CoLoR" ; "Coccinelle" ; "term_orderings"]
    ; ["CoLoR" ; "Coccinelle" ; "basis"]
    ; ["CoLoR" ; "Coccinelle" ; "examples"]
    ; ["CoLoR" ; "Coccinelle" ; "examples" ; "cime_trace"]
    ; ["CoLoR" ; "Coccinelle" ; "ac_matching"]
    ; ["CoLoR" ; "Coccinelle" ; "term_algebra"]
    ; ["CoLoR" ; "Coccinelle" ; "unification"]
    ; ["CoLoR" ; "NonTermin"]
    ; ["CoLoR" ; "Term"]
    ; ["CoLoR" ; "Term" ; "Lambda"]
    ; ["CoLoR" ; "Term" ; "SimpleType"]
    ; ["CoLoR" ; "Term" ; "String"]
    ; ["CoLoR" ; "Term" ; "Varyadic"]
    ; ["CoLoR" ; "Term" ; "WithArity"]
    ; ["CoLoR" ; "HORPO"]
    ; ["CoLoR" ; "ProofChecker"]
    ; ["CoLoR" ; "MatrixInt"]
    ; ["CoLoR" ; "SemLab"]
    ; ["CoLoR" ; "Conversion"]
    ; ["CoLoR" ; "DP"]
    ; ["CoLoR" ; "Util"]
    ; ["CoLoR" ; "Util" ; "Multiset"]
    ; ["CoLoR" ; "Util" ; "Vector"]
    ; ["CoLoR" ; "Util" ; "Pair"]
    ; ["CoLoR" ; "Util" ; "FSet"]
    ; ["CoLoR" ; "Util" ; "Integer"]
    ; ["CoLoR" ; "Util" ; "FMap"]
    ; ["CoLoR" ; "Util" ; "Matrix"]
    ; ["CoLoR" ; "Util" ; "Logic"]
    ; ["CoLoR" ; "Util" ; "Polynom"]
    ; ["CoLoR" ; "Util" ; "Option"]
    ; ["CoLoR" ; "Util" ; "FGraph"]
    ; ["CoLoR" ; "Util" ; "Function"]
    ; ["CoLoR" ; "Util" ; "List"]
    ; ["CoLoR" ; "Util" ; "Relation"]
    ; ["CoLoR" ; "Util" ; "Bool"]
    ; ["CoLoR" ; "Util" ; "Nat"]
    ; ["CoLoR" ; "Util" ; "Set"]
    ; ["CoLoR" ; "Util" ; "Algebra"]
    ; ["CoLoR" ; "PolyInt"]
    ; ["CoLoR" ; "SubtermCrit"]
    ; ["CoLoR" ; "MPO"]
    ; ["CoLoR" ; "MannaNess"]
    ]

  ]
