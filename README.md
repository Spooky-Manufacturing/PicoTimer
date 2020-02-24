# PicoTimer
PicoTimer is an open-source and open-hardware project that enables you to trigger multiple circuits with pico-second accuracy.

# Motivation
One of the biggest challenges to building a scalable photonic quatum computers is handling the inevitable optical path differences, nowhere is this more important than in synchronizing the ancilliary photons in our controlled gates with the qubits we're performing rotations on. Unfortunately, a ready-made solution to this problem does not exist, and so we've had to improvise. Achieving pico-second timing is an extremely difficult task to accomlish, modern processors which can achieve clock cycles above 1GHz are *in theory* able to produce a 1 picosecond timer, but in an electrical circuit which may have varying wire-lengths and wave propagation characteristics, actually building a timer to take into account all of these factors is for the most part out of reach of the average person's capabilities.

# How Our System Works
Instead of relying on an oscillator and clock to produce a timing circuit, we use a beam of light, specifically a laser. This does come with some limitations, but it allows us to affordably build the timing systems we need for our quantum computers!

How the system works is a laser diode is pulsed, there are a variety of methods to achieve this depending on your exact project requirements, but for our quantum computers the duration of the pulse is only relevant if you want to increase the overall clock speed of your circuit. The laser pulse enters a beam splitter which splits beam in half with half of the photons going to one circuit and the other half going to the other circuit. In our quantum circuits, we have a variety of factors needed to determine what exact delay is needed which takes into account many factors from the propagation of light through the gates, the distance between components, etc. however the base algorithm to build on is described below:
The delay in picoseconds is equal to the absolute value of the length of the optical path 1 divided by the speed of light minus the length of the optical path 2 divided by the speed of light. What's even better is because light propagates so fast, these extremely small delays are actually incredibly easy to produce!

Delay = |P1/c - P2/c|
For instance, let's say you wanted a 10 picosecond delay, plugging this in gives us:
10ps = |P1/c - P2/c|
Now we multiply each side by c the constant for speed of light (in mm) and we get:
2.998mm = |P1 - P2|

Or, written another way:
P2 = 2.998mm + P1

So, to introduce a 10 picosecond delay you only need to add 2.998mm to the optical path, this is fairly easy to do, even hand-cutting fiber-optics will net you a more accurate timing system than anything you could make with discrete components. Plus it's cheap! A beamsplitter can be purchased for as little as $4 (you don't need a special one, any will do just fine). And what if one of your circuits is an absurd distance from another one? That's perfectly fine, you simply increase the optical distance by coiling a fiber-optic line the length of P1 + 2.998mm, the exact coil length if you want to know will be:
Coil_length = (P1+2.998mm) - P2
