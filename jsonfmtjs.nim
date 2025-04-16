from lib import fmt

proc jsonfmt(jsonString: cstring, depth: cint, indent: cint): cstring {.exportc.} =
    fmt($(jsonString), depth, indent)

{. emit: "export default { jsonfmt };" .}
