it = 10

while it > 1:
    if it == 9:
        continue  #stops here and re-iterates loop
    if it == 3:
        break #stops loop abruptely
    print(it)
    it = it - 1

print("while loop execution is done")