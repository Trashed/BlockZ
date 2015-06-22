rem
rem BlockZ // ball.agc
rem


rem Define the type for a Ball
type t_Ball
	id as integer
	x as float
	y as float
	diameter as float
	speed as integer
endtype


rem Initialize the UDT and the sprite for Game Ball
function initBall()
	_ball as t_Ball
	id = createSprite(loadImage("ball.png"))
	_ball.id = id
	_ball.x = 50.0
	_ball.y = 94.0
	_ball.diameter = getSpriteWidth(id)
	_ball.speed = 30
	
	setSpriteOffset(_ball.id, _ball.diameter / 2, _ball.diameter / 2)
	setSpritePositionByOffset(_ball.id, _ball.x, _ball.y)
	setSpriteScaleByOffset(_ball.id, 0.1, 0.1)
	setSpritePhysicsOn(_ball.id, DYNAMIC)
	
endfunction _ball

rem Update ball behavior
function updateBall()

endfunction

