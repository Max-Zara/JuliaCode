using DataFrames, Gadfly

p = plot(x=randn(2000),Geom.histogram(bincount=100))

x=randn(2000)


arr = zeros(500000)
@parallel for i=1:500000
    arr[i]=i
end

arr

nheads = @parallel (+) for i=1:10000000
    Int(rand(Bool))
end

f(x::Float64, y::Float64) = x+y

f(10.0,12.0)

f(x::Number, y::Number)=2x+2y

f(10,11)

#M={rand(500,500) for i=1:10}; pmap(svd,M)
using DataArrays
x = DataArray([1.1 , 2.2, 3.3, 4.4, 5.5, 6.6])

x[1]= NA
x

true || x
true && x[1]
mean(x[2:6])

dvector = data([10,20,30,40,50])
dmatrix = data([10 20 30;40 50 60])

dropna(x)

df = DataFrame(Name = ["Ajava Rho","Las Vegas"],Count = [14.04, 17.3], OS =["Ubuntu","Mint"])

df2 = DataFrame()
df2[:X]=1:10
df2[:Y]= ["Head", "Tail",
"Head", "Head",
"Tail", "Head",
"Tail", "Tail",
"Head", "Tail"]

df2

size(df2)

rename!(df2, [:X => :newX, :Y => :newY])
describe(df2)

using RDatasets, RData
iris = dataset("datasets", "iris")
neuro = dataset("boot", "neuro")

head(iris)

df_iris_sample  = readtable("iris.csv")

methods(readtable)

writetable("output_df_iris.csv", df_iris_sample)

using DataFrames
names(DfTRoadSafety_Accidents_2015)

DfT_Vehicles = readtable("Vehicles_2015.csv")

DfTRoadSafety_Accidents_2015 = readtable("Accidents_2015.csv")
head(DfTRoadSafety_Accidents_2015)

##now join two data sets

full_DfT = join(DfTRoadSafety_Accidents_2015, DfT_Vehicles, on = :Accident_Index)

head(full_DfT)
ncol(full_DfT), nrow(full_DfT)

#inner_join - only if keys in both df]
#left_join - has all keys in first DF, but not right
#outer join - has rows that are present in both
#semi join - only rows from first DF that are both in left and right
#anti join - only present in left DF
#cross join - cartesian produt of rows from first DF and second DF

#cross join example
cross_DfT = join(DfTRoadSafety_Accidents_2015, DfT_Vehicles, on = :Accident_Index, kind = :left)
head(cross_DfT)
ncol(cross_DfT), nrow(cross_DfT)

Cities = ["Delhi","Amsterdam","Hamburg"][rand(1:3,10)]
Cities


df1 = DataFrame(Any[1:10,Cities, rand(10)],[:ID,:City,:RandomValue1])
df2 = DataFrame(ID=1:10,City=Cities, RandomValue2 = rand(100:110,10))

##apply full join

full_df1_df2 = join(df1,df2, on = [:ID, :City])


#right join
right_DfT = join(DfTRoadSafety_Accidents_2015, DfT_Vehicles, on = :Accident_Index, kind = :right)
head(right_DfT)

##narow the scope of the problem to location
by(DfTRoadSafety_Accidents_2015, :Location_Northing_OSGR, size)

size(DfTRoadSafety_Accidents_2015)

#stack helps to reshape the dataset
iris_stackdf = stackdf(iris)

iris2 = iris
iris2[:id] = 1:size(iris,1)

head(iris2)

iris_stack = stack(iris2,[1:4])
#size(iris_stack)

#iris2
#iris_stack = stack(iris2,1:4)
#iris_df2 = stack(iris, [:PetalLength, :PetalWidth], :Species)
iris_melt = stack(iris2, 1:4)
unstack(iris_melt, :id, :variable, :value)
unstack(iris_melt, :variable, :value)

#methods(stack)

stackdf(iris)

#iris_stack
#aggregating to get mean
iris_mean_stack = by(iris_stackdf, [:variable, :Species], df -> DataFrame(iris_mean = mean(df[:value])))
unstack(iris_mean_stack, :Species, :iris_mean)

sort!(iris2, cols=[:SepalLength, :PetalLength])

sort(iris2, cols=[order(:Species, by = uppercase), order(:PetalLength, rev=true)])


rnd_df = DataFrame(A = randn(5), B = randn(5), C = randn(5))
methods(ModelFrame)
rnd_mod = ModelFrame(@formula(A ~ B + C),rnd_df)

rnd_df

rnd_mm = ModelMatrix(rnd_mod)


using RDatasets
iris_df = dataset("datasets","iris")

sample(iris_df[:SepalLength],5)

#methods(sample)
sample(iris_df[3], 400, replace = true, ordered = false)

##Julia has WeightVec to represent weight vectors to facilitate the assignment of weights to samples
# to explicitly distinguish the role of vvector from other data vectors
# to save computation cycles

using StatsBase
wv = StatsBase.Weights([1.,2.,3.],6.)

eltype(wv)
length(wv)
isempty(wv)
sum(wv)
eltypes(iris_df)

exam = dataset("mlmRev","Exam")

describe(exam)

a = [123, 4234, 23423, 1231231, 1432432423, 1231413413]
geomean(a)
harmmean(a)

#trimmean(a,0.1)
methods(trim)
#StatsBase.trim(a,0.5)
#mean(trim(a,1))

wv = rand(6)

mean(a, weights(wv))

var(a)

b = [1 2; 3 4; 5 6; 7 8; 9 10]
var(b,2)
std(b)

mean_and_var(b)

mean_and_std(b)

c= [12,234,567,1234,535,335,19]

skewness(c)

kurtosis(c)

#First moment is mean
#Second moment is Var
#3rd Moment is Skewness
#4th moment is kurtosis

moment(c,3)

#span measures the total spread of dataset
span(c)

variation(c) #coefficient of variation = std/mean


##Z-Scores
d = [12,23,45,67,99,72,61,39,21,71]

zscore(d)

#Entropy is the measure of disorder in dataset and provides the approx measure of randomness in system.
#It increases with randomness

using Distributions
e = Dirichlet([1.0,3.0,5.0])

arr = rand(e)

sum(arr)

entropy(arr)

a = rand(10)
quantile(a)
#inter quartile range
iqr(a)

percentile(a, 0.5)

#nquantile creates a vector of quantiles defined by us
nquantile(a,2)

mode(a)
summarystats(a)

#Stats Base has a lot of deviations calculations
#meanad = mean(abs(x-y))
#maxad = max(abs(x-y))
#msd = mean(abs2(x-y) - MSE
#rmsd = sqrt(msd(a,b)) - RMSE


#Ranking
a = rand(4)

ordinalrank(a)

a=rand(1:5,30)
counts(a)
proportions(a, 1:4)
