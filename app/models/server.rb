# == Schema Information
#
# Table name: servers
#
#  id         :integer          not null, primary key
#  port       :integer
#  ip_address :string
#  passworded :boolean
#  users      :text
#  server_key :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_servers_on_server_key  (server_key) UNIQUE
#

class Server < ApplicationRecord
  has_secure_token :server_key

  validates :port, :ip_address, presence: true
  validates :port, numericality: { only_integer: true, greater_than: 1024 }
end
