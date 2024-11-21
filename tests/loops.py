greeting = "Good Morning"
a = 4

if greeting == "Good Morning":
    print(" Condition matches")
    print("second line")
else:
    print("Condition did not match")
# moving to left will exclude next line from if else loop
print("if else condition code is completed")

#for loop

obj= [2, 3, 4, 5, 8]
for i in obj:
    print(i*2)

# sum of First Natural numbers 1+2+3+4+5 =15
#range(i,j) -> i to j-1
summation = 0
for j in range(1, 6):
    summation = summation + j
print(summation)