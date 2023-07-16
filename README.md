# UART_using_Verilog
In this project I have implemented the Universal Asynchronous Receiver Transmitter using Verilog HDL.\
The UART has a 8-bit Data Size.\
The transmitter starts giving output from the input 8-bit data on recieving a start signal.\
The first bit of transmitter is a logic low bit(1'b0) indicating the start and starts outputing the data bits.\
After transmitting the data the transmitter transmits an even parity bit and goes into the idle state.\ 

In the idle state the transmitter outputs logic high bit(1'b1).\
The reciever starts working when the serial input to it pulled logic low from idle state.\
After which it reads the data bits.\
At the end it checks whether the input is corrupted using the parity bit and flags by outputing logic high on "iscor" port, if the result is corrupted.\
At the end it outputs a done signal stating that the input has been read and the output is ready and goes into the idle state.\
