##Quandl
#Pkg.clone("https://github.com/milktrader/Quandl.jl")
using Quandl
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
