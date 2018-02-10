##TimeSeries in Julia
using TimeSeries
using MarketData

ohlc[1]

ohlc[[Date(2000,1,3),Date(2000,2,4)]]

ohlc["Open"][Date(2000,1,10)]

#use time and date functions
from(cl, Date(2001,10,24))
to(cl, Date(2001,10,24))

red = findwhen(ohlc["Close"] .< ohlc["Open"])

percentchange(cl)

merge(op[1:4],cl[2:6], :left)

a = TimeArray([Date(2015,10,24),Date(2015,11,04)],[15,16],["Number"])

map((timestamp, values) -> (timestampe + Dates.Year(1), values), a)


using Mocha

data_layer = HDF5DataLayer(name="data", source="data-list.txt",batch_size=64,tops=[:data])
ip_layer = InnerProductLayer(name="ip",output_dim=500,tops=[:ip],bottoms = [:data])

add_coffee_break(solver, Snapshot(exp_dir), every_n_iter=5000)
add_coffee_break(solver, TrainingSummary(), every_n_iter=1000)

backend= CPUBackend()
init(backend)
