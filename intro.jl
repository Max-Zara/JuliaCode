##Intro to High Performance Programming
println("Max is nice")

include("supervisedML.jl") #runs code from another file

using Winston
print(rand(100))
a=5
b =2a^2+30a+9
using PyPlot
x = linspace(0,5)
y=cos.(2x+5)
plot(x,y,linewidth=2.0, linestyle="--")
title("a nice cosinus")
xlabel("X"); ylabel("Y")

print_with_color(:red, "Max")

typemax(Int)
typemax(Int16)
typemin(Int)

0.1 + 0.2

0.1 + 0.2 == 0.3

s = "Hello, Julia"
s[2]

str2="I am the a: the beginning"

for c in str2
    println(c)
end

#concat strings
"ABC" * "DEF"

string("abc","def","ghi")

search("Julia","l")
replace("Julia","u","o")
split("34,TomJones,James",",")

name = "Pasca"
@printf("Hello, %s \n", name)  #s is for string

#d is for integers
@printf("%d\n", 1e5)
x = 7.35679
#.3f gives decimal places
@printf("x = %.3f\n",x)

aa = 1.52310
bb = 33.9769

@printf("%.2f %.2f\n", aa, bb)

#Regular Expressions
email_pattern = r".+@.+"
input = "john.doe@mit.edu"
println(ismatch(email_pattern,input))

##try and capture the email
email_pattern = r"(.+)@(.+)"
m = match(email_pattern, input)
println(m.captures)
