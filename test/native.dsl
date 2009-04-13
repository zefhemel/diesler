StringBuilder = Object importNativeClass: "java.lang.StringBuilder"
s = StringBuilder new: "initial value"
s append: "Bla"
s append: "Bla"
s append: "Bla"
str = s toString 
print: "It says: " + str

JavaString = Object importNativeClass: "java.lang.String"
str = JavaString new: "Something"
print: str
print: str toUpperCase
