class Subject < ApplicationRecord

  has_many :pages

  scope :visible, lambda { where(:visible => true)}
  scope :invisible, -> { where(:visible => false)}
  scope :sorted, -> { order("position ASC")}
  scope :newest_first, -> { order("created_at DESC")}
  scope :search, ->(query) { where("name LIKE ?", "%#{query}%")}

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  # validates_presence_of vs. validates_length_of :minimum => 1
  # different error messages: "can't be blank" or "is too short"
  # validates_length_of allows strings with only spaces!
end
