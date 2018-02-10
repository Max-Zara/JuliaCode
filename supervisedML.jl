###Supervised Machine Learnings
Pkg.build("ScikitLearn")
#using ScikitLearn
using DecisionTree
using PyPlot
srand(100)
X = sort(5 * rand(80))
XX = reshape(X, 80, 1)
y = sin.(X)
y[1:5:end] += 3 * (0.5 - rand(16))

regr_1 = DecisionTreeRegressor()
regr_2 = DecisionTreeRegressor(pruning_purity_threshold = 0.05)

fit!(regr_1, XX, y)
fit!(regr_2, XX, y)

DecisionTree.DecisionTreeRegressor(Nullable(0.05),5,0,#undef)

X_test = 0:0.01:5.0
y_1 = predict(regr_1, hcat(X_test))
y_2 = predict(regr_2, hcat(X_test))

##Plot Results
scatter(X, y, c="k", label="data")
plot(X_test, y_1, c="g", label="no pruning", linewidth = 2)
plot(X_test, y_2, c="r", label="pruning purity = 0.05",linewidth = 2)

xlabel("data")
ylabel("target")
title("DecisionTreeRegression")
legend(prop=Dict("Size"=>10))



###NAIVE BAYES
using NaiveBayes
Pkg.build("NaiveBayes")
using StatsBase
X = [1 1 0 2 1;
0 0 3 1 0;
1 0 1 0 2]

y = [:a, :b, :b, :a, :a]

m = MultinomialNB()

using Clustering, Gadfly
iris = dataset("datasets","iris")
features = Array(iris[:,1:4])
result = kmeans(features, 3)
plot(iris, x="PetalLength",y="PetalWidth",color=result.assignments, Geom.point)

###Using ScikitLearn
ENV["PYTHON"]="C:\\Program Files\\Python36\\python.exe"
Pkg.build("PyCall")

Pkg.build("ScikitLearn")
@sk_import datasets: (make_circles, make_moons, make_blobs)
@sk_import cluster: (estimate_bandwidth, MeanShift, MiniBatchKMeans, AgglomerativeClustering, SpectralClustering)

@sk_import cluster: (DBSCAN, AffinityPropagation, Birch)
srand(33)
n_samples=1500
noisy_circles=make_circles(n_samples = n_samples, factor=.5, noise = .05)

#Pkg.clone("https://github.com/bicycle1885/RandomForests.jl", "RandomForests")
using RandomForests
using DecisionTree
using RDatasets: dataset

features = convert(Array, iris[:,1:4])
labels = convert(Array, iris[:,5])

model= build_tree(labels, features)
model=prune_tree(model, 0.9)
print_tree(model,5)

##apply learned model
apply_tree(model, [5.9, 3.0, 5.1, 1.9])
apply_tree_proba(model, [5.9, 3.0, 5.1, 1.9], ["setosa","versicolor","virginica"])
#run nfold x-validation
accuracy = nfoldCV_tree(labels, features, 0.9, 3)

##Now train random forest classifier
#using 2 random features, 10 trees, 0.5 portion of samples per tree, and maximum depth of 6
model = build_forest(labels, features, 2, 10, 0.5, 6)

apply_forest(model, [5.9, 3.0, 5.1, 1.9])
apply_forest_proba(model, [5.9, 3.0, 5.1, 1.9], ["setosa","versicolor","virginica"])

accuracy = nfoldCV_forest(labels, features, 2, 10, 3, 0.5)

##Now train a regression tree

n, m = 10^3, 5;
features = randn(n,m)
weights = rand(-2:2,m)
labels = features * weights
#train regression tree using avg of 5 samples per leaf
model = build_tree(labels, features, 5)

apply_tree(model, [-0.9, 3,5.1, 1.9, 0])
r2 = nfoldCV_tree(labels,features, 3, 5)

##Train Regression Forest
model = build_forest(labels, features, 2, 10, 5, 0.7)
