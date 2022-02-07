class Deal < ApplicationRecord
  belongs_to :sites

  private
  def self.inheritance_column
    nil
  end
end
