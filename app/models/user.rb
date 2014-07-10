class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_uniqueness_of :email
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password

  def to_s
    "#{first_name} #{last_name}"
  end
end
