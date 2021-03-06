DirectionAndAngle = Struct.new(:dir, :angle)

E = DirectionAndAngle.new('E', 0)
N = DirectionAndAngle.new('N', Math::PI/2)
W = DirectionAndAngle.new('W', Math::PI)
S = DirectionAndAngle.new('S', Math::PI*3/2)

DirectionHash = {'N' => N, 'E' => E, 'S' => S, 'W' => W}

class Rotator

  def initialize(initial_direction = 'N')
    @commands = {'l'=> 'left', 'r' => 'right'}
    @directions = [N, E, S, W]
    @direction = @directions.find_index(DirectionHash[initial_direction])
  end

  def direction
    @directions[@direction].dir
  end

  def angle
    @directions[@direction].angle
  end

  def left
    @direction = @direction - 1
  end

  def right
    @direction = (@direction + 1) % 4
  end

  def process(direction)
    if @commands.has_key?(direction)
      send @commands[direction]
    end
  end
end


