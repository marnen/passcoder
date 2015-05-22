class ItemSelectorCell < Cell::Rails
  def show(args)
    @form = args[:form]
    @items = Item.order(:name).collect {|item| [_(item.name), item.id] }
    render
  end
end
