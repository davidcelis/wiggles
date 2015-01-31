require 'digest'

class WiggleChecksummer
  def initialize(wiggle)
    @wiggle = wiggle
  end

  def valid?
    @wiggle.checksum == calculate_checksum!
  end

  def calculate_checksum!
    Digest::MD5.hexdigest("#{@wiggle.id}#{@wiggle.name}#{@wiggle.created_at}#{@wiggle.updated_at}")
  end
end
