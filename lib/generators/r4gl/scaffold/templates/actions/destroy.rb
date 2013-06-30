  def destroy
    item_name = record_name
    @<%= instance_name %>.destroy

    redirect_to <%= items_url %>, notice: t('success.destroyed', model: msg_item(item_name))

  end
