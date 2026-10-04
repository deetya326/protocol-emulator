![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)


# Protocol Emulator ASIC

A tiny programmable processor designed for cycle-accurate communication protocol emulation.

## Jane Street ASIC Competition

This project is being developed for the **Jane Street Protocol Emulator ASIC Competition**.

The goal is to design a small, reprogrammable processor whose instruction set is optimized for pin-level I/O and cycle-exact timing, allowing communication protocols to be implemented in firmware.

### Competition Deadline

**January 18, 2027**

### Competition Link

[Jane Street Protocol Emulator ASIC Competition](https://blog.janestreet.com/protocol-emulator-asic-competition/)

## Team

| Member | Role |
|---|---|
| Deetya | Lead — Architecture, RTL, Physical Design |
| Rachana | Verification, Firmware, Tooling |

## Target Protocols

### Required

- UART
- SPI
- I2C

### Stretch Goals

- JTAG
- SWD
- CAN
- Low-speed USB
- 10 Mbit Ethernet

## Repository Structure

```text
protocol-emulator/
├── asm/          Assembler and ISA tooling
├── fw/           Protocol firmware
├── model/        Software ISA reference model
│
├── src/          Hardware RTL
├── test/         Testbenches and verification
├── docs/         Project documentation and ISA specification
│
├── info.yaml     Tiny Tapeout project configuration
├── README.md     Project documentation
└── LICENSE       Project license
```

## Project Status

### Architecture

- [ ] ISA specification
- [ ] ISA review
- [ ] ISA frozen

### Tooling

- [ ] Python assembler
- [ ] Reference ISA simulator
- [ ] Program loader

### RTL

- [ ] CPU core
- [ ] GPIO / pin-control unit
- [ ] Cycle counter
- [ ] Memory interface
- [ ] Protocol I/O support

### Verification

- [ ] Instruction-level tests
- [ ] Randomized testing
- [ ] Protocol checkers
- [ ] SystemVerilog assertions
- [ ] Formal verification
- [ ] Functional coverage
- [ ] Full regression

### Firmware

- [ ] UART
- [ ] SPI
- [ ] I2C

### ASIC Flow

- [ ] Synthesis
- [ ] Area analysis
- [ ] Place and route
- [ ] Timing analysis
- [ ] DRC
- [ ] LVS
- [ ] Final GDS

### Submission

- [ ] Documentation
- [ ] Final regression
- [ ] Submission package
- [ ] Target submission — January 16, 2027
- [ ] Competition deadline — January 18, 2027

## ISA Documentation

The ISA specification is maintained in [`docs/isa.md`](docs/isa.md).

The specification covers:

- Registers
- Instructions
- Pin I/O
- Timing
- Memory

## Verification and Development

The software tooling and verification infrastructure are developed alongside the hardware RTL.

The reference ISA model is intended to provide a software-level reference for checking processor behavior, while the assembler converts firmware programs into the instruction representation consumed by the processor.

Protocol firmware and verification environments will be developed for UART, SPI, and I2C.

## Tiny Tapeout

This project uses the Tiny Tapeout Verilog flow for the ASIC implementation.

Project configuration is maintained in [`info.yaml`](info.yaml).

## License

See [`LICENSE`](LICENSE).
