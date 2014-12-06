#ARDUINO = ArduinoFirmata.connect "/dev/tty.usbserial-A7006Sog"
puts ENV['CONNECTION_PATH']
ARDUINO = ArduinoFirmata.connect ENV['CONNECTION_PATH']
puts "firmata version #{ARDUINO.version}"
