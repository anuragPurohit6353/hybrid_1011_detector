# 🔁 1011 Sequence Detector using Moore and Mealy FSM (Overlapping)

This project demonstrates how to implement **both Moore and Mealy finite state machines (FSM)** in a **single Verilog design** to detect the **overlapping binary sequence `1011`**.

> 💡 Designed for academic and interview-level demonstration.  
> ✅ Verified using testbenches and waveform analysis.

---

## 🚀 Project Overview

| Feature                 | Description                        |
|------------------------|------------------------------------|
| Sequence Target        | `1011`                             |
| FSM Types              | Moore and Mealy                    |
| Overlapping Detection  | ✅ Supported                        |
| Language               | Verilog HDL                        |
| Clock Domain           | Synchronous                        |
| Reset Type             | Asynchronous Active High           |
| Simulation Tool        | Icarus Verilog + GTKWave           |

---

## 🧠 Why Both FSMs?

| Moore FSM                                | Mealy FSM                                 |
|-----------------------------------------|-------------------------------------------|
| Output depends on current **state**     | Output depends on **state and input**     |
| Slight delay in output (`1` at next clk)| Faster response (can output in same clk)  |
| Used when output stability is critical  | Used when response speed is critical      |

---

## 📐 FSM Diagrams

Both FSMs are modeled to detect `1011`:
- **Moore FSM** asserts output at the last `1` via state
- **Mealy FSM** asserts output during state transition with `din = 1`

---<img width="1553" height="244" alt="Screenshot 2025-07-10 231644" src="https://github.com/user-attachments/assets/71c376f5-e1b7-4866-aa25-a66072db3d4c" />


## 🧪 Testbench & Simulation

The testbench simulates overlapping patterns like:

