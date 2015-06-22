rem
rem BlockZ // paddle.agc
rem


rem Define the type for Paddle
type t_Paddle
	id as integer
	x as float
	y as float
	width as float
	height as float
	speed as integer
endtype

rem Initialize Paddle
function initPaddle()
	tempPaddle as t_Paddle
	
	tempId = createSprite(0)
	tempPaddle.id = tempId
	tempPaddle.x = 50.0
	tempPaddle.y = 95.0
	tempPaddle.width = 20.0
	tempPaddle.height = 3.0
	tempPaddle.speed = 25
	
	setSpriteSize(tempPaddle.id, tempPaddle.width, tempPaddle.height)
	setSpriteOffset(tempPaddle.id, tempPaddle.width / 2, tempPaddle.height / 2)
	setSpritePositionByOffset(tempPaddle.id, tempPaddle.x, tempPaddle.y)
	setSpriteColor(tempPaddle.id, 78, 78, 150, 255)
	setSpritePhysicsOn(tempPaddle.id, DYNAMIC)
		
endfunction tempPaddle


function movePaddle(time as float)
	Paddle.x = Paddle.x + time * Paddle.speed * g_AccelX
	rem setSpritePositionByOffset(Paddle.id, Paddle.x, Paddle.y)
	setSpritePhysicsVelocity(Paddle.id, g_AccelX * Paddle.speed, 0)
	setSpritePhysicsAngularVelocity(Paddle.id, 0.0)
endfunction



