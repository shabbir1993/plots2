class TagController < ApplicationController

  def tag
    if (@tag = DrupalTag.find_by_name(params[:id]))
      @nodes = DrupalTag.find_nodes_by_type([@tag],'note',8)
      @tags = [@tag]
      @tagnames = @tags.collect(&:name)
      @wikis = DrupalTag.find_nodes_by_type(@tags,'page',10)
    end
    @unpaginated = true
    render :template => "notes/index"
  end

  def author
    render :json => DrupalUsers.find_by_name(params[:id]).tag_counts
  end

end
