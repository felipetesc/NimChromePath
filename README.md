# NimChromePath
Gets the chrome paths on Windows and *Nix Systems 

# Available procedures

Get paths only to Windows Systems
```
proc getWinPaths(): seq[string]

```

Get paths only to *Nix Systems
```
proc getNixPaths(): seq[string]

```

Get paths on Windows or on *Nix Systems
```
proc getpaths(): seq[string]

```

## Example:
Open Google Chrome in app mode

```
import osproc
import NimChromePath/getpaths

proc openURLLikeApp(url : string) : void =
  var paths = FindChromeLib.getChromePaths()
  if paths.len > 0 :
    var path = paths[0]
    path =  path & " --app=" & url
    echo path
    discard  osproc.execCmd(path)
 
 ```

## License

MIT
