def next_greater_element(nums):
  result = []
  found = False
  for i in range(len(nums)) : 
    for j in range(i+1,len(nums)) : 
      if nums[j] > nums[i] : 
        result.append(nums[j])
        found = True 
        break
    if not found : 
      result.append(-1)
    found = False
  return result
