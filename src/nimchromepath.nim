import os

proc exists(p: string): bool =
  try:
    discard getFileInfo(p)
    result = true
  except OSError:
    result = false

# get default windows paths
proc getWinPaths(): seq[string] =
  let uncheckedPaths = @["C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe", "C:\\Program Files (x86)\\Google\\Application\\chrome.exe", "C:\\Users\\UserName\\AppDataLocal\\Google\\Chrome\\chrome.exe"]
  result = @[]
  var found = false
  for index in 0 ..< uncheckedPaths.len:
    found = exists(uncheckedPaths[index])
    if found:
      result.add(uncheckedPaths[index])
  return result

export getWinPaths

# get default linux paths
proc getNixPaths(): seq[string] =
  let uncheckedPaths = @["/usr/bin/google-chrome", "/usr/local/sbin/google-chrome", "/usr/local/bin/google-chrome", "/usr/sbin/google-chrome", "/usr/bin/chrome", "/sbin/google-chrome", "/bin/google-chrome"]
  result = @[]
  var found = false
  for index in 0 ..< uncheckedPaths.len:
    found = exists(uncheckedPaths[index])
    if found:
      result.add(uncheckedPaths[index])
  return result

export getNixPaths

proc getpaths(): seq[string] =
  result = @[]
  when defined windows:
    result = getWinPaths()
  elif defined linux:
    result = getNixPaths()

export getpaths
