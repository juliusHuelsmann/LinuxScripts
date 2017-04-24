## [True Time](http://static.googleusercontent.com/media/research.google.com/en//archive/spanner-osdi2012.pdf)
True time is part of google's new distributed database [spanner](#spanner).

### [Time Synchronization](http://www.endruntechnologies.com/time-synchronization.htm)
- [NTP](http://www.ntp.org/) is a protocol used for synchronizing the time in a network. Depends on a time reference such as
  - Atomic Clock
  - GPS

### Typical ranges for the uncertainty.
- The timing accuracy of a GPS receiver in a Network Time Server is typically 100 nanoseconds.
- The accuracy of the NTP timestamp is within 10 microseconds of UTC, and network factors, such as traffic and routers, reduce the overall network synchronization accuracy 
- The time coherency is typically within 1/2 to 2 milliseconds


### Guarantees given by True Time
The True Time API offers the client the possibility to receive an approximation of the Node's uncertainty. (Node = Datacenter)
This is achieved by returning an uncertainty interval that guarantees to contain the absoute time during which the request was invoked;
```bash
# Client evokes tt.now at absolute (real) time t_0
TT.now()
# Client receives the answer interval 
# [t_b, t_a]
# where t_0 is guaranteed to be \in [t_b, t_a].
```

For that, two time reference sources directly attatched to the different Nodes are used.
- Atomic Clocks (cheap)
- GPS (very accurate but expensive)
The errors of the different clocks tend not to be corrolated. Each Datacenter has got one ```TimeMaster``` machine that contains either an atomic clock or a gps clock.
However most of the TimeMaster machines are using atomic clocks.

All master's time references are regularly compared against each other. The behaviour of the machines using atomic clocks differ from those using gps clocks

###### Atomic clock
- slowly increase time uncertainty between synchronization
  - derived from conservatively applying worst-case clock difrt estimations
  - In case the uncertainty exceeds a certain threshold, the machines are shut down.
  
###### GPS masters
- The uncertainty of GPS masters is closed to zero


Each daemon polls differnet masters to reudce vulnearbility to errors from any of the masters. Marzullo's algorithm is used for detecting wrong time, afterwards, the local machine ime issynchronized to an estimate based on the response from the time masters.


## Why 


## [Spanner](http://static.googleusercontent.com/media/research.google.com/en//archive/spanner-osdi2012.pdf)
