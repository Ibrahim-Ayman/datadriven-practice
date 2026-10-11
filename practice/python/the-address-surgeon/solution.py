def parse_address(address):
  address_splited = address.split(",")
  street = address_splited[0].strip()
  city = address_splited[1].strip()
  state = address_splited[2].split(" ")[1].strip()
  zip = address_splited[2].split(" ")[2].strip()
  return {"zip" : zip , "city" : city , "state" : state , "street" : street}
