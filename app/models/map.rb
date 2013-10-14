class Map < ActiveRecord::Base
  attr_accessible :name
  
  def updateContent(name, content, mapid, userid)
    @pop=Pop.find(:all, :conditions => ["name=? and map_id=? and user_id=?", name, mapid, userid])[0]
    @pop.comment=content
    @pop.save

  end
  
  def getMapId(id)
    return id
  end
  
  def getUserId(id)
    return  id
  end
  
  def getContent(mapid, userid)
    count=0
    output=""
    #@pops=Pop.all
    @pops=Pop.find(:all, :conditions => ["map_id=? and user_id=?", mapid, userid])
    output+="{"
    @pops.each do |pop|
      count+=1
      output+="\""+pop.name+"\":\""+pop.comment+"\""
      if (count<@pops.length)
        output+=","
      end

      @pops.length

    end
    output+="}"
    return output
  end
  
end
