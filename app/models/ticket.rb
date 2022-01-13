class Ticket < ActiveRecord::Base
  belongs_to :user, optional: true
  belongs_to :train, optional:true
end
