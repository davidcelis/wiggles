require 'forwardable'
require 'digest'

class WiggleChecksummer
  extend Forwardable

  def_delegators :@wiggle, :checksum, :id, :name, :created_at, :updated_at

  def initialize(wiggle)
    @wiggle = wiggle
  end

  def valid?
    checksum == calculate_checksum!
  end

  def calculate_checksum!
    Digest::MD5.hexdigest("#{id}#{name}#{created_at}#{updated_at}")
  end
end
