# Verificaton of AHB Lite to APB Bridge using UVM
---
The AHB-Lite to APB bridge module is a hardware module that facilitates communication between two different bus protocols in a System-on-Chip (SoC) design. The AHB-Lite (Advanced High-performance Bus Lite) and APB (Advanced Peripheral Bus) are two popular bus protocols used in SoC designs.

The AHB-Lite bus is a high-performance bus that is typically used to connect high-speed master devices, such as processors and DMA controllers, to high-speed slave devices, such as memory and peripherals. The APB bus, on the other hand, is a lower-performance bus that is typically used to connect slower peripherals, such as timers, GPIOs, and UARTs, to the rest of the system.

The AHB-Lite to APB bridge module acts as a translator between the two bus protocols, enabling the communication of the slower APB devices with the faster AHB-Lite devices. The bridge module consists of logic that converts the AHB-Lite transactions into APB transactions, and vice versa.

The bridge module also handles the arbitration of bus access between the AHB-Lite and APB buses, ensuring that there are no conflicts or data loss during communication. It also provides the necessary signal level conversions and clock domain crossings, ensuring that the signals are properly synchronized and compatible with each other.

Overall, the AHB-Lite to APB bridge module is a crucial component in SoC designs that allows for the seamless integration of different bus protocols, enabling the efficient and effective operation of the entire system.
---
