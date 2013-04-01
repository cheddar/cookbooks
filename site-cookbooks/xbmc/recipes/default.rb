package "media-tv/xbmc"

systemd_user_session "bene"

systemd_user_unit "xbmc.service" do
  user "bene"
  action [:create, :enable, :start]
end
