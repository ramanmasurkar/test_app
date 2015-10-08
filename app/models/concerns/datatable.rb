module Datatable
  extend ActiveSupport::Concern

  module ClassMethods
    def pages
      params[:iDisplayStart].to_i/per_page + 1
    end

    def per_page
      params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 50
    end

    def sort_column
      @col[params[:iSortCol_0].to_i]
    end

    def sort_direction
      params[:sSortDir_0] == "desc" ? "desc" : "asc"
    end

    def params
      @params
    end
  end
end