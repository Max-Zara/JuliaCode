##Quandl
#Pkg.clone("https://github.com/milktrader/Quandl.jl")
using StatsBase
using Quandl
using Quandl, DataFrames
#Quandl DataBase Browser
#https://www.quandl.com/search
#Documentation - https://media.readthedocs.org/pdf/quandljl/latest/quandljl.pdf


set_auth_token("kg7iY9AdcaQAtQ9UAaPA")
quandl("GOOG/NASDAQ_QQQ", format="DataFrame")

tmp1 = quandlget("GOOG/NASDAQ_QQQ")

gdp = quandlget("FRED/GDP", format = "DataFrame")

tmp2 = quandl("FRED/GDP")

 df = quandlsearch("GDP USA", results=30)

a = interactivequandl("USA GDP")

s = quandlsearch("GDP USA", format="Dict")



##WIKI EXAMPLE
wiki_aapl = quandlget("WIKI/AAPL", format="DataFrame", from = Date(2010,1,1), to = Dates.today())
wiki_gs = quandlget("WIKI/GS", format="DataFrame", from = Date(2010,1,1), to = Dates.today())

head(wiki_gs)
random_trade = repeat([0,0,1];outer=nrow(wiki_gs))
random_match=random_trade[1:nrow(wiki_gs)]
wiki_gs[:Trade] = random_match
wiki_gs[:Capital]=1
head(wiki_gs)
wiki_gs[Symbol("Adj. Close")]
wiki_gs[:LnClose]=log(Array(wiki_gs[Symbol("Adj. Close")]))
diff_prices = diff(wiki_gs[:LnClose])
#Create a column for the Day Return
wiki_gs[:DayReturn]=wiki_gs[:LnClose]
wiki_gs[2:end,:DayReturn]=diff_prices
wiki_gs[1,:DayReturn]=0

#Work out what the trade makes you
wiki_gs[:TradeReturn]=wiki_gs[:Trade] .* wiki_gs[:LnClose] + 1
wiki_gs[:TradeCapital]=cumprod(wiki_gs[:TradeReturn])

wiki_gs[:HWM] =


#using Plotly
#ENV["PYTHON"]="C:\\Program Files\\Python36\\python.exe"
#Pkg.build("PyCall")
#using PyPlot
#using Gadfly
plot(wiki_gs[:Date],wiki_gs[:TradeCapital],Geom.line)

#using Temporal
#using Plots
#Timestamps = [Float64(t) for t in wiki_gs[:Date]]

plot(x=wiki_gs[:Date],y=wiki_gs[:TradeCapital])
