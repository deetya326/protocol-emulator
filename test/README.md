# Verification Testbench


This directory contains the Cocotb-based RTL verification infrastructure for
the protocol emulator.

## Current status

The verification environment is currently based on the Tiny Tapeout testbench
template and provides the initial simulation smoke-test harness.

The current smoke test verifies that:

- the DUT compiles successfully with Icarus Verilog;
- the Cocotb testbench starts correctly;
- clock and reset can be driven;
- the current template DUT produces the expected output.

The current DUT is still the Tiny Tapeout template module `tt_um_example`.
The testbench will be updated once the protocol-emulator CPU top-level
interface is defined.

## Running the RTL smoke test

Run `make -B` from this directory.

A successful run should report `TESTS=1 PASS=1 FAIL=0`.

The simulation generates the FST waveform `tb.fst`.

The waveform can be viewed with GTKWave using `gtkwave tb.fst tb.gtkw`
or with Surfer using `surfer tb.fst`.

## Gate-level simulation

Gate-level simulation can be run after a hardened netlist is available
using `make -B GATES=yes`.

The gate-level flow expects the generated netlist as `gate_level_netlist.v`.

## Future verification work

As the CPU RTL and ISA are developed, this testbench will be extended to cover:

- reset and basic instruction execution;
- pin I/O operations;
- cycle-accurate timing;
- UART, SPI and I2C protocol behavior;
- firmware-driven protocol sequences;
- regression tests for the reference model and assembler.
