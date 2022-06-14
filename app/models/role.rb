class Role < ActiveRecord::Base
  has_many :auditions

  # def auditions
  #   Audition.all.select {|a| a.role_id == self}
  # end

  def actors
    #self.auditions.map(&:actor)
    self.auditions.pluck(:actor)
  end

  def locations
    self.auditions.pluck(:location)
  end

  def lead
    lead = self.auditions.find_by(hired: true)
    lead ? lead : 'no actor has been hired for this role'
  end

  def understudy
  understudy = self.auditions.where(hired: true).second
  understudy ? understudy : 'no actor has been hired for understudy for this role'
  end

end