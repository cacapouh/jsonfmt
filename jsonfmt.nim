from lib import fmt

proc jsonfmt(depth: int = 10, indent: int = 2, args: seq[string]): int =
    const success = 0

    for arg in args:
        echo fmt(arg, depth, indent)
    
    success


when isMainModule:
   import cligen
   dispatch(jsonfmt)
