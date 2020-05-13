class Game
  def initialize
    @random_num = rand(1..5)
  end

  def guess(num)
    @random_num(num) == true
  end
end

hey there