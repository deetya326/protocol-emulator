# SPDX-FileCopyrightText: © 2026 Deetya
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):

    # 100 kHz clock
    clock = Clock(dut.clk, 10, unit="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0

    await ClockCycles(dut.clk, 10)

    dut.rst_n.value = 1

    # UART should be idle-high after reset
    assert dut.uo_out.value == 1

    # Send 0xA5 = 10100101
    dut.ui_in.value = 0xA5
    dut.uio_in.value = 1

    # Start transmission
    await ClockCycles(dut.clk, 1)

    # Start bit
    assert dut.uo_out.value == 0

    # Remove start signal
    dut.uio_in.value = 0

    # Data bits are transmitted LSB first
    expected_bits = [1, 0, 1, 0, 0, 1, 0, 1]

    for expected in expected_bits:
        await ClockCycles(dut.clk, 1)
        assert dut.uo_out.value == expected

    # Stop bit
    await ClockCycles(dut.clk, 1)
    assert dut.uo_out.value == 1