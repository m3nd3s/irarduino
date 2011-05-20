require "serialport"

class ReadSerial
  def self.run

    #params for serial port
    port_str = "/dev/ttyUSB1"  #may be different for you
    baud_rate = 9600
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE

    sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

    #just read forever
    key = ""
    while true do
      key += ( sp.getc || "" )

      if key.strip.eql?("next")
        `xsendkeycode 117 1 && xsendkeycode 117 0`
        key = ""
      end
      
      if key.strip.eql?("back")
        `xsendkeycode 112 1 && xsendkeycode 112 0`
        key = ""
      end

    end

    sp.close                       #see note 1
  end
end

ReadSerial.run()
