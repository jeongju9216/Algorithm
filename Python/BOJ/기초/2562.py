numbers = [int(input()) for _ in range(9)]

maxNumber = max(numbers)
print(maxNumber)
print(numbers.index(maxNumber) + 1)
