class Cart
  attr_reader  :bizs

  def initialize
    @bizs = []
  end

  def add(biz_id, subject_id, quantity=1)
    puts "in add biz..."
    if exist?(biz_id)
      existed = find_biz(biz_id)
      puts "exist bizs #{existed}"
      existed.add(subject_id, quantity)
    else
      biz = CartBiz.new(biz_id)
      biz.add(subject_id, quantity)
      @bizs << biz
      puts "add a new biz #{biz_id}"
    end
  end

  def exist?(biz_id)
    !find_biz(biz_id).blank?
  end

  def find_biz(biz_id)
    puts "doing biz #{biz_id}"
    @bizs.select{|biz| biz.biz_id == biz_id}.first
  end

  def total
    @bizs.inject(0) do |tt, biz|
      tt = tt + biz.total
    end
  end

end