  def update
    if @<%= instance_name %>.update(<%= instance_name %>_params)
      redirect_to @<%= instance_name %>, notice: t('success.updated', model: msg_item(record_name))
    else
      render :edit
    end

  end
