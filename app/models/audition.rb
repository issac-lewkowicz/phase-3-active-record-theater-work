class Audition < ActiveRecord::Base
  belongs_to :role

  # def role
  #   self.role
  # end
  #^ Already built in

  def call_back
    # self.hired = true
    # self.save
    self.update(hired: true)
  end
end