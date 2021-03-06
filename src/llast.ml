(* Tree to keep track of llvalues for various symbols in a program *)
module L = Llvm
module StringMap = Map.Make(String)

type func = {
  value: L.llvalue;
  typ: L.lltype;
  return: Ast.typ;
  gameobj: string option;
}

type gameobj = {
  gtyp: L.lltype;
  head: L.llvalue;
  methods: func StringMap.t;
  events: func StringMap.t;
  vtable: L.llvalue;            (* TODO: events are replaced even if they're not defined in child class. *)
  semant: Ast.Gameobj.t;
  (* TODO: here the ast obj is stored with the llobj. possibly in another place
     we do two separate lookups. unify *)
}

type vsc = Direct of L.llvalue | Deferred of (L.llbuilder -> L.llvalue)

type concrete = {
  variables: (vsc * Ast.typ) StringMap.t;
  functions: func StringMap.t;
  gameobjs: gameobj StringMap.t;
  namespaces: namespace StringMap.t;
}
and namespace = Concrete of concrete | Alias of string list | File of string
