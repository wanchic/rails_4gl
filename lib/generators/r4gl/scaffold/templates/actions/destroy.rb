  def destroy
    @<%= instance_name %> = <%= class_name %>.find(params[:id])
    item_name = @<%= instance_name %>.name
    @<%= instance_name %>.destroy

    redirect_to <%= items_url %>, notice: t('success.destroyed', model: msg_item(item_name))

  end
