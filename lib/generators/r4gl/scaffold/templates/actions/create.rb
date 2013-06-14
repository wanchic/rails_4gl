  def create
    @<%= instance_name %> = <%= class_name %>.new(params[:<%= instance_name %>])

    if @<%= instance_name %>.save
      redirect_to @<%= instance_name %>, notice: t('success.created', model: msg_item(@<%= instance_name %>.name))
    else
      render :new
    end

  end
