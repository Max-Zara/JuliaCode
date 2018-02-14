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

function mult(x,y)
    println("x is $x and y is $y")
    return x * y
end

mult(5,7)

function multi(n,m)
    n*m, div(n,m), n%m
end

multi(8,2)

function insert_elem(arr)
    push!(arr,-10)
end

arr=[2,3,4]
insert_elem(arr)

mult(5,6)

f(a, b=5) = a + b
f(1)
f(2,5)

k(x; a1=1, a2=2)=x*(a1+a2)

k(3)
k(3,a2=3)

any(k1 = "nam1",k2="nam2",k3=7)

a=function(x)
    z=x*2
    function b(z)
        z += 1
    end
    b(z)
end

a

#Test condition in code
sum(n)=n>1 ? sum(n-1) + n:n
fib(n) = n < 2 ? n : fib(n-1) + fib(n-2)

fib(5)

##map applies to all elements
map(x -> x * 10, [1,2,3])
cubes = map(x -> x^3, (1:5))

map( x-> begin
        if x == 0 return 0
        elseif iseven(x) return 2
        elseif isodd(x) return 1
        end
    end, (-3:3))

map((-3:3)) do x
    if x == 0 return 0
    elseif iseven(x) return 2
    elseif isodd(x) return 1
    end
end

arr = Float64[x^2 for x in (1:4)]
table10 = [x * y for x=1:10, y = 1:10]
mat1 = [x + y for x in 1:2, y in 1:3]

###Conditional Evaluation
var = 7
if var > 10
    println("var has value $var and is bigger than 10")
elseif var < 10
    println("var has value $var and is less than 10")
else
    println("var has value $var and is 10")
end

a = 10
b=15
z = if a>b a
else b
end

z = a > b ? a : b

for n = 1:10
    print(n^3, " ")
end

arr = [x^2 for x in 1:10]

for(ix, val) in enumerate(arr)
    println("the $ix-th element is $val")
end

enumerate(arr)

for n = 1:5, m=1:5
    println("$n * $m = $(n*m)")
end

a = 10; b = 15
while a < b
    println(a)
    a +=1
end

a=10; b=150
while a < b
    println(a)
    a+=1
    if a>=50
        break
    end
end

arr = rand(1:10,10)
println(arr)
searched = 4
for (ix, curr) in enumerate(arr)
    if curr == searched
        println("the searched element $searched occurs on index $ix")
        break
    end
end

for n in 1:10
    if 3 <= n <= 6
        continue
    end
    println(n)
end

#error handling
codes = ["AO","ZD","SG","EZ"]

if code in codes
    println("This is inside")
else
    throw(DomainError())
end

try
    pop!(a)
catch ex
    println(typeof(ex))
    showerror(STDOUT, ex)
end

#can define variables as gloabl and as local
x = 9
function funscope(n)
    x = 0
    for i = 1:n
        local x
        x = i+1
        if(x==7)
            println("This is the local x in for: $x")
        end
    end
    x
    println("This is the local x in funscope: $x")
    global x = 15
end

funscope(10)

ma1 = rand(3,5)

ndims(ma1)
size(ma1)

idm = eye(3)
idm[2,:]=5

ma = [1 2; 3 4]

#'matrix multiply
ma * ma

#only respective
ma .* ma

inv(ma)

ma * inv(ma)

#if need to find ma1 * X = ma 2 can use X = inv(ma1)* ma2, can also use solver X = ma2/ma1

v = [1.,2.,3.]; w = [2.,4.,6.]

hcat(v,w)
vcat(v,w)

reshape(1:12, 3,4)

a = rand(3,3)

t1=a,b,c,d = 1,22.0,"World",'x'

typeof(t1)

##dictionaries
d1 = [1=> 4.2, 2=>5.3]
#dynamic dictionary with {} - discontinues
d2 = {"a"=> 1, (2,3) => true}
d3 = [:A => 100, :B=> 200]

d3[:B]

keys1 = ["J.S.Bach","Woody Allen","Barack Obama"]
values1 = [1685,1935,1961]

d5 = ["J.S.Bach" => 1685, "Woody Allen" =>1935, "Barack Obama" => 1961]

for p in d5
    println("$(p[1]) was born in $(p[2])")
end

s = Set(Any[11,14,13,7,14,11])

s1 = Set(Any[11,25]); s2 = Set(Any[25,3.14])
union(s1,s2)
intersect(s1,s2)
push!(s1,32)

str = readstring("words1.txt")
nonalphabet = r"(\W\s?)"
str = replace(str, nonalphabet, " ")
digits = r"(\d+)"
str = replace(str, digits, " ")
word_list = split(str," ")
##make a dictionary

#caclulate list of words
word_freq = Dict{String, Int64}()
for word in word_list
    word = strip(word)
    if isempty(word) continue end
    haskey(word_freq, word)?
        word_freq[word] +=1 :
        word_freq[word] =1
end

word_freq

#Checking Types
(31+42)::Float64

#can declare
convert(Int64,7.0)
Int64(7.0)

##convert all to same type
promote(1,2.5,3//4)
