string = input()

list = [0] * 26
for char in string:
  list[ord(char) - 97] += 1

for num in list:
  print(num, end = " ")
