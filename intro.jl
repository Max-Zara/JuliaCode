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

for i in 1:2:9
    print(i)
end

a= split("A,B,C,D",",")
typeof(a)
show(a)

arr = [100,25,37]
show(arr)
arr2 = Array(Int64,5)
show(arr2)

arr3 = Float64[]
#push populates the array
push!(arr3,2)
show(arr3)

arr4 = Int64([1:7])
push!(arr4,9)
show(arr4)

sizehint(arr2)
ndims(arr2)

join(arr4,", ")
eqa = linspace(0,10,5)
show(eqa)

v1 = rand(Int32,5)
Int64(v1)

b=Array(1:7);c = [100,200,300]
append!(b,c)

pop!(b) #take one element at the end
push!(b,42) #add one element to end

shift!(b) #takes form front
unshift!(b,42) #adds one from front

##check whether element in array
in(42,b)
in(43,b)

sort(b)

a1=Array(1:3); a2 = Array(4:6)

a1 .* a2 #multiply respective rows
dot(a1,a2)  ##dot product

a= [1,2,4,6]
a1 = a
show(a1)
a[4]=0

start_time = time()
time_elapsed = time() - start_time
println("Time elapsed: $time_elapsed")

using Dates
strftime(time())

d = Date(2014,9,1)
dt = DateTime(2014,9,1,12,30,59,1)

x=1.0
x=1

function scopetest()
    println(x)
    y::Float64 = 1.0
end

scopetest()
println(y)

x = begin
    a=5
    2*a
end

x

x=(a=5;2*a)

#For fixing items specify const - will give warning when changed
const GC = 6.67e-11

GC = 3.14

str = "The Gold and Blue Loses a Bit of its Luster"
println(str)
nchars = length(str)
println("The headline counts $nchars characters")
str2 = replace(str, "Blue","Red")

arr=Array(1:100)
sum(arr)
mean(arr)
std(arr)
