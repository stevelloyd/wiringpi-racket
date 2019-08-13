# Racket interface library to WiringPi

## Introduction

[WiringPi](http://wiringpi.com/contact/) is a Raspberry Pi GPIO access library written in C. It provides an implementation of the Arduino Wiring functions for the Raspberry Pi.

This library provides access to some WiringPi functions using Racket's ffi (foreign function interface). At the moment it only covers those functions which might be used for simple I/O manipulation.

## Function names

The function names follow the camelCase names used in the C library, rather than more idiomatic Racket names, for ease of familiarity.

## Examples

An inital but now outdated example is provided in the examples directory; to drive the 4tronix PiDie GPIO experiments board. Newer examples to be documented eg https://twitter.com/zosho/status/712737135175008256

