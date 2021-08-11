#!/bin/sh

case "${1}" in
"on")
  echo "2-3" | sudo tee /sys/bus/usb/drivers/usb/bind > /dev/null
  ;;
"off")
  echo "2-3" | sudo tee /sys/bus/usb/drivers/usb/unbind > /dev/null
  ;;
*)
  echo "${1} not valid, use on/off"
esac
