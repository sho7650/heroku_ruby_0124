Rails.application.config.permissions_policy do |f|
  f.camera      :none
  f.geolocation :none
  f.microphone  :none
  f.payment     :none
  f.usb         :none
end
