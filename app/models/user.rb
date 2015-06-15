class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   ## Token Authenticatable
  #acts_as_token_authenticatable

  belongs_to :position
  has_one :project

  def intern?
    if position.title == "intern"
      return true
    else
      return false
    end
  end
end
