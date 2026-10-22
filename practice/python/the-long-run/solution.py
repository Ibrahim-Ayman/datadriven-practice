def run_length_encoding(s: str):
  if s == '' : 
    return s
  l , r = 0 , 0 
  s = list(s)
  res = []
  c = 0
  while l <= r and r < len(s): 
    if s[r] == s[l] : 
      c+=1
      r+=1
    else : 
      res.append(s[l] + str(c))
      l = r
      c = 0
  print(s[r-1])
  res.append(s[r-1] + str(c))
  return ''.join(res)
