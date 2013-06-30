  def create
    @<%= instance_name %> = <%= class_name %>.new(<%= instance_name %>_params)

    if @<%= instance_name %>.save
      redirect_to @<%= instance_name %>, notice: t('success.created', model: msg_item(record_name))
    else
      render :new
    end

  end
