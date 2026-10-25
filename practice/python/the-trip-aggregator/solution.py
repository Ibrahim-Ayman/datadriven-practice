def aggregate_trips(trips: list[dict]) -> list[dict]:
  result = {}
  for trip in trips : 
    if trip["user_id"] in result.keys() : 
      result[trip["user_id"]][0] += trip["duration_hours"]
      if trip["destination"] not in result[trip["user_id"]][1] : 
        result[trip["user_id"]][1].append(trip["destination"]) 
      print(f"Trip after appending {result[trip['user_id']]}")
    else : 
      result[trip["user_id"]] = [trip["duration_hours"] , [trip["destination"]]]
      print(f"Trip first time {result[trip['user_id']]}")
  
  result = dict(sorted(result.items()))
  output = [{"user_id" : k , "total_hours" : v[0] , "unique_destinations" : len(v[1])} for k , v in result.items()]
  return output 
