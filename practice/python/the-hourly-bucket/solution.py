def group_by_hour(events):
    result = {}
    
    for event in events : 
        ts = event['ts'][0:13]
        if ts not in result : 
            result[ts] = [event['type']]
        else : 
            result[ts].append(event['type'])
    return result
