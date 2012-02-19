include_recipe "mongodb"

portage_pacage_use "net-dns/pdns" do
  use %w(mongodb)
end

package "net-dns/pdns"
