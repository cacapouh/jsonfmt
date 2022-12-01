import std/json
import tables
import sequtils
import std/strformat
import std/strutils


type
    Args = tuple
        depth: int
        indent: int
    State = tuple
        depth: int
        indentNum: int


proc newArgs(depth: int, indent: int): Args = (depth, indent)
proc newState(depth: int, indent: int): State = (depth, indent)
proc update(state: State, indentNumIncr: int): State = (state.depth + 1, state.indentNum + indentNumIncr)
proc indent(state: State): string = " ".repeat(state.indentNum).mapIt(&"{it}").join()


proc innerFmt(jsonString: string, state: State, args: Args): string =
    let jsonNode = parseJson(jsonString)
    let fields: OrderedTable[string,JsonNode] = jsonNode.getFields()

    if args.depth == 0:
        &"{jsonNode}"
    elif args.depth <= state.depth:
        jsonString
    elif jsonNode.kind == JObject:
        let nextState = state.update(args.indent)
        let convert = proc(key: string): string =
            let v = innerFmt(&"{jsonNode[key]}", nextState, args).replace("\n", &"\n{nextState.indent()}")
            &"\"{key}\": {v}"
        let kvs = fields.keys.toSeq.mapIt(convert(it)).mapIt(&"{nextState.indent()}{it}").join(",\n")
        &"{{\n{kvs}\n}}"
    elif jsonNode.kind == JArray:
        let nextState = state.update(args.indent)
        let convert = proc(elem: JsonNode): string =
            let v = innerFmt(&"{elem}", nextState, args).replace("\n", &"\n{nextState.indent()}")
            &"{v}"
        let elems = jsonNode.getElems().toSeq.mapIt(convert(it)).mapIt(&"{nextState.indent()}{it}").join(",\n")
        &"[\n{elems}\n]"
    else:
        jsonString


proc jsonfmt(depth: int = 10, indent: int = 2, args: seq[string]): int =
    const success = 0

    for arg in args:
        echo innerFmt(arg, newState(0, 0), newArgs(depth, indent))
    
    success


when isMainModule:
   import cligen
   dispatch(jsonfmt)
