class Task
  def self.all
    [
      Task.new("Do the dishes", "Fresh and clean!", "app-urls", :default),
      Task.new("Hang out the washing", "Sunny day", "rmq", :value_one),
      Task.new("Have a cup of tea", "Use a teacup", "teacup", :value_two),
      Task.new("Be a RubyMotion Pro", "Try ProMotion", "promotion", :subtitle)
    ]
  end

  attr_accessor :title, :subtitle, :image, :type

  def initialize(title, subtitle, image, type)
    @title = title
    @subtitle = subtitle
    @image = image
    @type = type
  end
end
