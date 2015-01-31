class Wiggle < ActiveRecord::Base
  after_save :update_checksum!

  private

  def update_checksum!
    Wiggle.record_timestamps = false
    self.checksum = WiggleChecksummer.new(self).calculate_checksum!
    update_without_callbacks
  ensure
    Wiggle.record_timestamps = true
  end
end
