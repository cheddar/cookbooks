shorewall_rule "zentoo-dev" do
  destport "3000,8081"
end

shorewall6_rule "zentoo-dev" do
  destport "3000,8081"
end

