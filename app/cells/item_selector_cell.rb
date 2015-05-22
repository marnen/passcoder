class ItemSelectorCell < Cell::Rails
  def show(args)
    @form = args[:form]
    @items = Item.order :name
    render
  end
end
