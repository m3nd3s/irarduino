require "serialport"

class ReadSerial
  def self.run

    #params for serial port
    port_str = "/dev/ttyUSB0"  #may be different for you
    baud_rate = 9600
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE

    sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

    #just read forever
    while true do
      printf("%s", sp.gets)
    end

    sp.close                       #see note 1
  end
end

ReadSerial.run()
