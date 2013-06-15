module Rails4gl
  module Controller
    extend ActiveSupport::Concern

    #module ClassMethods
    #  def init
    #    before_filter :set_field_length_param
    #  end
    #end

    def set_model(model)
      @model = model.model_name.human
    end

    def set_field_length_param
      @fl_param = 1.1
    end

    private

    def msg_item(item)
      "#{@model.capitalize}: \"#{item}\""
    end

    #module Helpers
    #  extend ActiveSupport::Concern
    #
    #  def title(page_title)
    #    content_for(:title) { page_title }
    #  end
    #end

  end
end