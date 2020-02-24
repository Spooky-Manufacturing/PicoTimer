# PicoTimer
PicoTimer is an open-source and open-hardware project that enables you to trigger multiple circuits with up to pico-second or greater accuracy!

![Example Circuit](https://github.com/Spooky-Manufacturing/PicoTimer/blob/master/img/picotimer.png)

## Motivation

One of the biggest challenges to building scalable photonic quatum computers is handling the inevitable optical path differences, nowhere is this more important than in synchronizing the ancilliary photons in our controlled gates. Unfortunately, a ready-made solution to this problem does not exist, and so we've had to improvise. Achieving pico-second timing is an extremely difficult task to accomplish, modern processors which can achieve clock cycles above 1GHz are *in theory* able to produce a 1 picosecond delay, but in an electrical circuit which may have varying wire-lengths and wave propagation characteristics, actually building a timer to take into account all of these factors is for the most part out of reach of the average person's capabilities.

## The PicoTimer

Instead of relying on an oscillator and clock or more complex methods using wire-length to create a delay, we use a beam of light- specifically, a laser. This setup does come with some limitations, and it may not necessarily be the perfect choice for every high-speed timing or delay mechanism, but it does have one huge advantage over electrical based systems in that it can be easily built using discrete components.

The PicoTimer operates by pulsing a laser diode to produce a laser beam that is the directed into a beam splitter which splits the beams into two optical paths which are directed into high-speed photodiodes. By varying the lengths of the optical paths, we are able to easily vary the delay between two circuits from pico-seconds to a few nanoseconds.

In our quantum circuits, we have a variety of factors needed to determine what exact delay is needed which takes into account many variables from the propagation of single-photons through the optical circuit, the speed of electricity through the triggering circuit, accuracy of our manufacturing capabilities, rise and fall times of components, et cetera. All of which is far too much to realistically cover in short-form like this.

Instead, we will introduce a simple model to use to build your own pico-second capable timer.

## The Maths 

The term "delay" in electronics has the following definitions:

1. The time interval between the propagation of an electrical signal and its' reception.
2. An electronic device that introduces a time interval.

Previously in this document I used the term delay to denote the 2nd, more colloquial definition, however this introduces a discrepancy, so to clarify this I will list the definitions and constraints for the purposes of this section:

1. **Delay** (Dn) refers to the time interval between the propagation of an ***electromagnetic wave*** and its' reception.

2. **Differential Delay** (iD) refers to the difference in time between the propagation of an electromagnetic wave by a source and its' reception by two: iD = |Dn-Dn|

3. **Path Length** (Pn) refers to the physical distance a photon needs to travel through an optical circuit.

4. We assume a perfect vacuum that preserves the constant **speed of light** (c).

5. We assume a perfect beam splitter with no phase shift.

6. We assume that the formula for **distance**, **speed**, and **time** (s=d/t) still hold even though the earth is flat (just checking you're still paying attention, the earth is approximately spherical)

   Variables: distance = d, time=t, speed=s, speed of light = c, delay = Dn, differential delay = iD, path length = Pn

````
d = t*s
d=t*c
P1 = t * c
P1 = D1 * c
P1/c = D1
P2 = t*c
P2 = D2 * c
P2/c = D2
iD = |D1 - D2|
iD = |P1/c - P2/c|
````


This proves the differential delay is equal to the absolute value of the length of optical path 1 divided by the speed of light minus the length of the optical path 2 divided by the speed of light.

# The Application



Now that we've proven we can create a delay between two components using the speed of light, we can plug in some numbers to figure out what sort of delays we can introduce using the formula we created earlier:

    iD = |P1/c - P2/c|

For instance, let's say you wanted a 10 picosecond delay, plugging this in gives us:

    10ps = |P1/c - P2/c|

Now we multiply each side by c the constant for speed of light (in mm) and we get (approximately):

    2.998mm = |P1 - P2|
    
So, to introduce a 10 picosecond delay you only need to make the optical path of the component you want to delay 2.998mm larger than the other. The easiest setup is to just place the components exactly that distance away from one another, a more sophisticated setup might use a fiber-optic coil, even hand-cutting fiber-optics will net you a more accurate timing system than anything you could make with discrete components. Plus it's cheap! A beamsplitter can be purchased for as little as $4 (you don't need a special one, any will do just fine). And what if one of your circuits is an absurd distance from another one? That's perfectly fine, you simply increase the optical distance by coiling a fiber-optic line the length of P1 + 2.998mm, the exact coil length if you want to know will be:

    Coil_length = (P1+2.998mm) - P2.

Here is a quick example of how we are using PicoTimer to implement an optical quantum circuit:

![Example Circuit](https://github.com/Spooky-Manufacturing/PicoTimer/blob/master/img/cx_prototype.png)
