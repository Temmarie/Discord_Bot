class Calculate
  def initialize
    @present_year = 2020
  end

  def age(num)
    @present_year -= num
  end

  def result
    @present_year
  end
end
