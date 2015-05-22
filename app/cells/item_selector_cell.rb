class ItemSelectorCell < Cell::Rails
  def show(args)
    @form = args[:form]
    @items = Item.all
    render
  end
end
