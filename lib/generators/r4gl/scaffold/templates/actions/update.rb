  def update
    @<%= instance_name %> = <%= class_name %>.find(params[:id])

    if @<%= instance_name %>.update_attributes(params[:<%= instance_name %>])
      redirect_to @<%= instance_name %>, notice: t('success.updated', model: msg_item(@<%= instance_name %>.name))
    else
      render :edit
    end

  end
