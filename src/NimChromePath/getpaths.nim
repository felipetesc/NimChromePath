# This is just an example to get you started. Users of your library will
# import this file by writing ``import FindChromeLib/submodule``. Feel free to rename or
# remove this file altogether. You may create additional modules alongside
# this file as required.

import os

proc exists(p: string): bool =
  try:
    echo getFileInfo(p)
    result = true
  except OSError:
    result = false

# get default windows paths
proc getWinPaths(): seq[string] =
  echo "entering inside getWinPaths"
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
  let uncheckedPaths = @["/usr/local/sbin", "/usr/local/bin", "/usr/sbin", "/usr/bin", "/sbin", "/bin"]
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
