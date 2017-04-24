The True Time component of the google spanner database is an interesting approach to time synchronization offering a sharp uncertainty interval. From my point of view techniques of it cannot be applied directly to the problem we want to solve in the TimeCoherency project.

The true Time API used in Spanner offers a certainty interval for time synchronization on different nodes that is solved by using time synchronization hardware.
In our project, we do also rely on time synchronization, but we actually aim to reduce the power consumption of our Node network. For doing so, it is sufficient to maintain an estimate on the time uncertainty of directly connected nodes.o


## [True Time](http://static.googleusercontent.com/media/research.google.com/en//archive/spanner-osdi2012.pdf)
True time is part of google's new distributed database [spanner](#spanner) and copes with Time Synchronization on different nodes.

### [Time Synchronization](http://www.endruntechnologies.com/time-synchronization.htm)
- [NTP](http://www.ntp.org/) is a protocol used for synchronizing the time in a network. Depends on a time reference such as
  - Atomic Clock
  - GPS

### Typical ranges for the uncertainty.
- The timing accuracy of a GPS receiver in a Network Time Server is typically 100 nanoseconds.
- The accuracy of the NTP timestamp is within 10 microseconds of UTC, and network factors, such as traffic and routers, reduce the overall network synchronization accuracy 
- The time coherency is typically within 1/2 to 2 milliseconds


### Guarantees given by True Time
The True Time API offers the client the possibility to receive an approximation of the Node's uncertainty.
This is achieved by returning an uncertainty interval that guarantees to contain the absoute time during which the request was invoked;
```bash
# Client evokes tt.now at absolute (real) time t_0
TT.now()
# Client receives the answer interval 
# [t_b, t_a]
# where t_0 is guaranteed to be \in [t_b, t_a].
```
### The way the uncertainty interval is computed
For that, two kinds time reference sources are used at so-called ```TimeMasters``` distributed in the network.
- Atomic Clocks (cheap)
- GPS (very accurate but expensive)
Each TimeMaster has only got one of the above mentioned time references.
However most of the TimeMaster machines are using atomic clocks.
The use of two different physical time references is done because the errors of the different clocks tend not to be corrolated.

All TimeMaster's time references are regularly compared against each other. The behaviour of the machines using atomic clocks differ from those using gps clocks

###### Atomic clock
- slowly increase time uncertainty between synchronization
  - derived from conservatively applying worst-case clock difrt estimations
  - In case the uncertainty exceeds a certain threshold, the machines are shut down.
  
###### GPS masters
- The uncertainty of GPS masters is closed to zero


Each Node (TimeslaveDaemon) polls differnet masters to reudce vulnearbility to errors from any of the masters. Marzullo's algorithm is used for detecting wrong time, afterwards, the local machine time is synchronized to an estimate based on the response from the time masters.

### Typical diameter of the consistence interval
- variation from about 2 to 14 ms (+-1 to 7)
- avg 8 ms (+-4)
These values are essentially higher than those mentioned in [this section](#Typical ranges for the uncertainty.) because the real time is actually guaranteed to lie inside the range.

### References
- http://static.googleusercontent.com/media/research.google.com/en//archive/spanner-osdi2012.pdf
- http://www.endruntechnologies.com/time-synchronization.htm

## [Spanner](http://static.googleusercontent.com/media/research.google.com/en//archive/spanner-osdi2012.pdf)
