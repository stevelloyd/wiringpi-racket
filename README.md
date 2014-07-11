# Racket interface library to WiringPi

## Introduction

[WiringPi](http://wiringpi.com/contact/) is a Raspberry Pi GPIO access library written in C. It provides an implementation of the Arduino Wiring functions for the Raspberry Pi.

This library provides access to some WiringPi functions using Racket's ffi (foreign function interface). At the moment it only covers those functions which might be used for simple I/O manipulation.

## Function names

The function names follow the camelCase names used in the C library, rather than more idiomatic Racket names, for ease of familiarity.

## Examples

An inital example is provided in the examples directory; to drive the 4tronix PiDie GPIO experiments board 
[‎www.4tronix.co.uk/pidie/](http://www.4tronix.co.uk/pidie/). More to follow; there's a brief post about it [here](http://stevelloyd.net/notes/2014/07/11/a-racket-interface-to-wiringpi/)