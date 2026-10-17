def unique_in_order(items):
  uni_list = []
  for item in items : 
    if item in uni_list : 
      continue 
    else : 
      uni_list.append(item)
  return uni_list
