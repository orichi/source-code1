class CartBiz
  attr_reader  :items
  attr_accessor  :biz_id

  def initialize(biz_id)
    @biz_id = biz_id
    puts "add cart biz #{@biz_id}"
    @items = []
  end

  def business
    puts "to find businesss #{biz_id}"
    Business.find(biz_id);
  end

  def total
    @items.inject(0) do |tt, item|
      subject = Subject.find(item[:subject_id])
      tt = tt + subject.price * item[:quantity].to_i
    end
  end

  def add(subject_id, quantity=1)
    if exist?(subject_id)
      existed = find(subject_id)
      update(existed[:subject_id],existed[:quantity].to_i + quantity.to_i )
    else
      @items << {:subject_id => subject_id, :quantity => quantity}
    end
  end

  def remove(subject_id)
    @items.delete_if do |item|
      item[:subject_id] == subject_id
    end
  end

  def update(subject_id, quantity)
    existed = find(subject_id)
    existed[:quantity] = quantity
  end

  def exist?(subject_id)
    !find(subject_id).blank?
  end

  def find(subject_id)
    selected = @items.select{|item| item[:subject_id] == subject_id}
    selected.blank? ? nil : selected[0]
  end
end
