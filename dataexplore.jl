##Data Exploration
using RDatasets

iris_dataframe = dataset("datasets","iris")

#Histogram
using Distributions, StatsBase, Gadfly

sleep = dataset("lme4","sleepstudy")

#Plot Histogram
plot(x=sleep[:Reaction], Geom.histogram(bincount=30),color=sleep[:Days])

#plot the scatter plot
plot(sleep, x="Days",y="Reaction",Geom.point)

#plot density
plot(sleep, x = "Reaction", Geom.density, color = "Subject")

plot([sin,cos], 0,25)

##Correlation analysis
a = rand(6)

autocov(a)

autocor(a)

#set seed
srand(619)
dist1 = Normal(1,3)
params(dist1)

x=rand(dist1, 1000)
plot(x = rand(dist1, 1000), Geom.histogram(bincount=30))

fit(Normal, x)


ENV["PYTHON"]="C:\\Program Files\\Python36\\python.exe"
Pkg.build("PyCall")
using PyPlot
PyPlot.svg(true) #scalable vector graphics true
x=[1:100]
y = [i^2 for i in x]
y = [301:400]

p=plot(x,y)

xlabel("X")
ylabel("Y")
title("Basic Plot")
grid("on")

x = linspace(0,3pi, 1000)
y = cos(2*x + 3*sin(3*x))
plot(x,y,color="orange",linewidth = 2.0, linestyle = "--")
title("Another Plot Using Sine and Cosine")

Pkg.add("UnicodePlots")
using UnicodePlots

scatterplot(randn(50), randn(50),title = "My Scatterplot")

lineplot(rand(3),rand(3),title="My Lineplot")

Pkg.add("Vega")
using Vega

scatterplot(x = rand(100),y=rand(100))

using Vega, Distributions
d1 = MultivariateNormal([0.0,0.0],[1.0 0.9; 0.9 1.0])
d2 = MultivariateNormal([10.0,10.0],[4.0 0.5; 0.5 4.0])
points = vcat(rand(d1,500), rand(d2,500))

x = points[:,1]
y=points[:,2]
group = vcat(ones(Int,500), ones(Int,500)+1)

scatterplot(x = x, y=y, group = group)

x=Array(Int,900)
y = Array(Int,900)
color = Array(Float64,900)
tmp=0
for counter in 1:30
    for counter2 in 1:30
        tmp += 1
        x[tmp]=counter
        y[tmp]=counter2
        color[tmp]=rand()
    end
end

hm = heatmap(x=x, y=y,color=color)

using Gadfly, Cairo
plot(x=rand(100),y=rand(100))

plot(x=rand(20),y=rand(20),Geom.point, Geom.line)

plot(x = 1:20,y=3.^rand(20),Scale.y_sqrt,Geom.point,
Geom.smooth, Guide.xlabel("This is X"),Guide.ylabel("This is Y"),Guide.title("Title"))

##Can use Gadfly to plot DataFrames
using RDatasets, Gadfly
iris = dataset("datasets","iris")

#plot iris
plot(iris, x=:SepalLength, y=:SepalWidth,
color=:Species, shape = :Species, Geom.point)
#simple histogram
p = plot(x=randn(2000), Geom.histogram(bincount=100))

plot(dataset("mlmRev","Gcsemv"),x="Course",color="Gender",Geom.histogram)

set_default_plot_size(15cm,9cm)
mlmf = dataset("mlmRev","Gcsemv")
df = mlmf[complete_cases(mlmf),:]
names(df)
plot(df, x="Course", y="Written", color="Gender")

#plot functions
plot([sin,cos],0,30)

plot((x,y) -> x*exp(-(x-Int(x))^3-y^2),-10,10,-3,3)

plot(layer(x=rand(25),y=rand(25),Geom.point),layer(x=rand(25),y=rand(25),Geom.line))

plot(x=rand(30),y=rand(30),Stat.step,Geom.line)

using Distributions
plot(x=rand(Normal(),150),y=rand(Normal(),150),Stat.qq,Geom.point )
plot(x=rand(Normal(),150),y=Normal(),Stat.qq,Geom.point)

#Specify Tick Sizes
plot(x = rand(20),y=rand(20),Stat.xticks(ticks=[0.0,0.2,0.8,1.0]),
Stat.yticks(ticks=[0.0,0.2,0.8,1.0]),Geom.point)

#Boxplot
plot(dataset("lattice","singer"),x="VoicePart",y="Height",Geom.boxplot)

#Density
plot(dataset("ggplot2","diamonds"),x="Price",color="Cut",Geom.density)

#Bar
plot(dataset("HistData","ChestSizes"),x="Chest",y="Count",Geom.bar)

#two dimensional histogram y is decsribed by colour
plot(dataset("car","UN"),x="GDP",y="InfantMortality",Scale.x_log10,Scale.y_log10,
Geom.histogram2d(xbincount=20,ybincount=20))

x_data = 0.0:0.1:3.0
y_data = x_data.^2 + rand(length(x_data))
plot(x=x_data,y=y_data,Geom.point, Geom.smooth(method=:loess,smoothing = 0.9))

#Subplot grid - multiple plots as a grid
set_default_plot_size(20cm,7.5cm)
plot(dataset("datasets","OrchardSprays"),xgroup="Treatment",x="ColPos",y="RowPos",color="Decrease",
Geom.subplot_grid(Geom.point))

#Using Fixed Scales
using DataFrames
set_default_plot_size(8cm,12cm)
widedf=DataFrame(x = [1:10],var1 = [1:10],var2 = [1:1:10].^2)
longdf=stack(widedf, [:var1,:var2])
plot(longdf, ygroup="variable",x="x",y="value",Geom.subplot_grid(Geom.point, free_y_axis=true))

#Horizontal and Vertical Lines
plot(dataset("datasets","iris"),x="SepalLength",y="SepalWidth", yintercept = [2.5,4.0], Geom.point, Geom.hline,
xintercept = [5.0, 7.0], Geom.point, Geom.vline)

##Plot a Ribbon
xs = 0:0.1:20
df_cos = DataFrame(x = xs, y=cos.(xs), ymin=cos.(xs) .-0.5,
ymax = cos.(xs) .+0.5, f= "cos")

df_sin = DataFrame(x = xs, y=sin.(xs), ymin=sin.(xs) .-0.5,
ymax = sin.(xs) .+0.5, f= "sin")

df = vcat(df_cos, df_sin)
p = plot(df, x=:x, y=:y, ymin=:ymin,ymax=:ymax, color=:f, Geom.line, Geom.ribbon)

#Violin Plots
head(dataset("lattice","singer"))
plot(dataset("lattice","singer"), x="VoicePart",y="Height",Geom.violin)

#Beeswarm plots
plot(dataset("lattice","singer"), x="VoicePart",y="Height",Geom.beeswarm)

##Continous Colour Scale
using Colors
x = repeat([1:10],inner = 10)
y = repeat([1:10],outer = 10)

plot(x=x,y=y, color = x+y,Geom.rectbin,
Scale.ContinuousColorScale(Scale.lab_gradient(colorant"green",colorant"white",colorant"red")))
