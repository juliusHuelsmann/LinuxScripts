This file contains information on the papers mentioned in the [root-readme](..) that have to do roughly with different algorithms and concepts.
# [Blockchain](blockchain)
# [machine Learning](machineLearning)
# Paxos
# Leap-second smearing
Fluctuations in earth's rotational speed cause inconsistencies between the time of atomic clocks and the solar time.
In 1972 leap seconds were introduced that are announced by the IERS. 

Computers need to adapt the time regularly by synchronizing with the network time according to the "Network Time Protocol" (NTP).
In case a Leap second occurred, the NTP traditionally accommodates a leap second (either backward or foreward) at the end of the day it occurre.
That may f.i. yield to a second appearing to occur twice. 
The fact that a leap second has been introduced is given to the client by setting the so called Leap Indicator (LI) flag in the NTP repsonse.


## Leap Smear (google)
Vary over a time window before the movement when the leap second actually happens; Thus replacing the aprupt change in time with a smooth one.
As a consequence, there is no time that gets repeated.

The LTP flag is set the following way:
```bash
lie(t) = (1 - cos(pi*t/w) / 2
```
where w is the size of the window 
