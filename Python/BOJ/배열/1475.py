arr = list(input())
dict = {str(n): 0 for n in range(10)}

for num in arr:
  if num == "6" or num == "9":
    if dict["6"] <= dict["9"]:
      dict["6"] += 1
    else:
      dict["9"] += 1
  else:
    dict[num] += 1

print(max(dict.values()))
