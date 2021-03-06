class TournamentEntry < ActiveRecord::Base
  attr_accessible :entry_reqs, :format, :future, :links, :location, :name, :ongoing, :past, :prizes, :sponsor, :status
  set_table_name "tournaments"  
  resourcify
  def status
    if !self.future.blank?
      return "future"
    elsif !self.ongoing.blank?
      return "ongoing"
    elsif !self.past.blank?
      return "past"
    end
  end
  
  def status=(val)
    self.past = false
    self.future = false
    self.ongoing = false
    if(val == "ongoing")
      self.ongoing = true
    elsif(val == "past")
      self.past = true
    elsif(val == "future")
      self.future = true
    end
  end
  
end
