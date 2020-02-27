class CategoryPresenter < Rectify::Presenter
  
  def category_all
    Category.all.order(name: :asc) 
  end
  
  def selected_caption(category_id)
    category_id.nil? ? t('all') : Category.find_by!(id: category_id).name
  end
end
