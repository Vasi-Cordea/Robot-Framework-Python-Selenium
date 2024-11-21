print("Hello World")
# comments in python

#variables, no need to specify type
a = 3

Str = "Hello World"
print(Str)

b, c, d = 5, 4.7, "Great"
print(a, b, c, d)

#print ("value is"+b+"bfd")

print(type(b))

values = [1, 2, "Vasi", 4, 5]

print(values[3]) #4

print(values[-1]) #5
print(values[1:3]) #2 vasi 4

values.insert(6, "Adi")
print(values)
              #values.pop()
values [0 ] = "Ella"
print(values)

del values[0]


#Tuple - same as LIST a type but immutable
val = (1, 2, "Vasi",  3.5)

print (val[1])
#val[2] = "VASI"
print (val)

#Dictionary
dic = {"a":2, 4:"bcd", "c":"Hello World" }

print(dic[4])
print(dic["c"])

#
dict = {}
dict["firstname"] = "Vasi"
dict["lastname"] = "CRD"
dict["Gender"] = "Male"

print(dict)
print(dict["lastname"])
